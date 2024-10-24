import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' as qrScanner;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';
import 'Custom_Build_Login_QR_Code.dart';
import 'package:usea_app/theme_builder.dart';
import '../../Student_Home/UI_Home/St_Home.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Users_API.dart';
import 'package:google_ml_kit/google_ml_kit.dart' as mlKit;

class QRLoginScreen extends StatefulWidget {
  const QRLoginScreen({super.key});

  @override
  _QRLoginScreenState createState() => _QRLoginScreenState();
}

class _QRLoginScreenState extends State<QRLoginScreen> with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isDialogShown = false;
  bool _isFlashOn = false;
  late AnimationController _animationController;
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  bool _isScanning = false;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    result == null
        ? Future.delayed(
            const Duration(minutes: 2),
          ).then(
            (value) {
              Get.back();
            },
          )
        : _submitForm();
  }

  @override
  Widget build(BuildContext context) {
    final double cutOutSize = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              overlayColor: UTextColor.withOpacity(0.75),
              borderRadius: URoundedLarge,
              borderLength: 32,
              cutOutSize: cutOutSize,
            ),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
          buildCustomBackButton(),
          buildScanQRCodeTxt(MediaQuery.of(context).size.height * 0.225),
          buildCustomBorders(
            cutOutSize: cutOutSize,
            top: (MediaQuery.of(context).size.height - cutOutSize) * 0.5,
            left: (MediaQuery.of(context).size.width - cutOutSize) * 0.5,
          ),
          _buildScanningLine(cutOutSize),
          Positioned(
            bottom: (MediaQuery.of(context).size.height - cutOutSize) * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildFlashlightButton(
                  bgColor: _isFlashOn ? UBackgroundColor : ULightGreyColor,
                  onTap: _toggleFlash,
                ),
                buildWidth15(),
                buildImageScaner(_pickImageAndScan),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    controller!.pauseCamera();
    controller!.resumeCamera();
  }

// Pick Image from gallery
  Future<void> _pickImageAndScan() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (mounted) {
          setState(
            () => _image = File(pickedFile.path),
          );
        }
        await _scanQRCodeFromImage(pickedFile.path);
      } else {
        _showErrorSnackbar('No image selected.');
        print('No image selected.');
      }
    } catch (e) {
      _showErrorSnackbar('Error picking image: $e');
    }
  }

  // Scan QR Code image from gallery
  Future<void> _scanQRCodeFromImage(String filePath) async {
    try {
      final inputImage = mlKit.InputImage.fromFilePath(filePath);
      final barcodeScanner = mlKit.BarcodeScanner(
        formats: [mlKit.BarcodeFormat.qrCode],
      );
      final List<mlKit.Barcode> barcodes = await barcodeScanner.processImage(inputImage);
      if (barcodes.isNotEmpty) {
        final mlKit.Barcode barcode = barcodes.first;
        final String? qrCodeData = barcode.displayValue ?? barcode.rawValue;
        if (qrCodeData != null && _isValidQRCode(qrCodeData)) {
          if (mounted) {
            setState(
              () => result = Barcode(
                code: qrCodeData,
                format: qrCodeData,
              ),
            );
            await _submitForm();
          }
        } else {
          _showErrorSnackbar('Invalid or unsupported QR code format');
        }
      } else {
        _showErrorSnackbar('No QR code found in the image');
      }
    } catch (e) {
      _showErrorSnackbar('Error scanning image: $e');
    }
  }

  // Check for valid QR code
  bool _isValidQRCode(String qrCode) {
    return qrCode.isNotEmpty;
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();

      if (status.isPermanentlyDenied) {
        openAppSettings();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera permission is permanently denied. Please enable it from settings.')),
        );
      } else if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera permission denied')),
        );
      }
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      _checkCameraPermission();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    if (mounted) {
      setState(
        () => this.controller = controller,
      );
    }

    controller.scannedDataStream.listen((qrScanner.Barcode scanData) async {
      try {
        if (mounted) {
          setState(
            () => result = Barcode(
              code: scanData.code,
              format: scanData.format.formatName,
            ),
          );
          await _submitForm();
          controller.pauseCamera();
        }
      } catch (e) {
        print("Error while scanning: $e");
      }
    });
  }

  void _showSuccessSnackbar(final String message) {
    if (!_isDialogShown) {
      if (mounted) {
        setState(
          () => _isDialogShown = true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: UTransParentColor,
            content: AwesomeSnackbarContent(
              title: 'Success',
              message: message,
              contentType: ContentType.success,
            ),
            duration: const Duration(seconds: 5),
          ),
        );

        // Reset the flag after the snackbar is dismissed
        Future.delayed(const Duration(seconds: 5), () {
          if (mounted) {
            setState(
              () => _isDialogShown = false,
            );
          }
        });
      }
    }
  }

  void _showErrorSnackbar(final String message) {
    if (!_isDialogShown) {
      if (mounted) {
        setState(
          () => _isDialogShown = true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: UTransParentColor,
            content: AwesomeSnackbarContent(
              title: 'Login Failed',
              message: message,
              contentType: ContentType.failure,
            ),
            duration: const Duration(seconds: 5),
          ),
        );

        Future.delayed(const Duration(seconds: 5), () {
          if (mounted) {
            setState(
              () => _isDialogShown = false,
            );
          }
        });
      }
    }
  }

  void saveStudentUser(SharedPreferences sharedPreferences, List<StudentUser> studentUserList) {
    final jsonData = studentUserList.map((studentUser) => studentUser.toJson()).toList();
    sharedPreferences.setString(
      'student_user',
      json.encode(jsonData),
    );
  }

  Future<void> _submitForm() async {
    String? username;
    String? password;

    if (_isScanning) return;
    _isScanning = true;

    if (result != null) {
      final data = result!.code?.split(':');
      if (data != null && data.length == 2) {
        username = data[0];
        password = data[1];
      } else {
        _showErrorSnackbar('Invalid QR code format');
        return; // Exit the function if the QR code format is invalid
      }
    }

    final String studentId = username ?? _textControllerUsername.text;
    final String pwd = password ?? _textControllerPsw.text;

    try {
      var response = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': studentId,
          'pwd': pwd,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data != null) {
          final studentUserData = data['student_users'];

          List<StudentUser> dataList_StudentUser = [];
          for (var item in studentUserData) {
            StudentUser dataModel1 = StudentUser(
              name_kh: item['name_kh'] ?? 'N/A',
              student_id: item['student_id'] ?? 'N/A',
              pwd: item['pwd'] ?? 'N/A',
              guardian_id: item['guardian_id'] ?? 'N/A',
            );
            dataList_StudentUser.add(dataModel1);
          }

          SharedPreferences sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool('login', true);
          saveStudentUser(sharedPref, dataList_StudentUser);
          _showSuccessSnackbar('Login Successful');
          Get.off(
            () => St_Home(
              data_studentUser: dataList_StudentUser,
              sourceScreen: st_sourceScreen,
            ),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 100),
          );
        } else {
          _showErrorSnackbar('Unexpected data format');
        }
      } else {
        _showErrorSnackbar('An error occurred: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorSnackbar('Server Error');
    }
  }

// Build Scanning line on QR Code
  Widget _buildScanningLine(final double cutOutSize) {
    return SizedBox(
      width: cutOutSize,
      height: cutOutSize,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: cutOutSize / 2 - 1,
                left: UWidth5,
                right: UWidth5,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: UBackgroundColor,
                    borderRadius: BorderRadius.circular(URoundedMedium),
                  ),
                  transform: Matrix4.translationValues(
                    0,
                    _animationController.value * 200 - 100,
                    0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _toggleFlash() async {
    if (controller != null) {
      if (mounted) {
        setState(
          () => _isFlashOn = !_isFlashOn,
        );
      }
      await controller!.toggleFlash();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class Barcode {
  final String? code;
  final String? format;

  Barcode({this.code, this.format});
}
