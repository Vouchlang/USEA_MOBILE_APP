import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Custom_Build_QR_Code.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';

class QrCodeGenerator extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String profileImageUrl;

  const QrCodeGenerator({
    Key? key,
    required this.data_studentUser,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  late final GlobalKey _qrKey = GlobalKey();

  Future<void> _captureAndSave(BuildContext context) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      await Future.delayed(const Duration(milliseconds: 200));

      RenderRepaintBoundary boundary = _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));

      if (byteData != null) {
        final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
        if (result['isSuccess']) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'QR Code saved successfully.',
                style: TextStyle(
                  fontSize: UTitleSize,
                  color: UBackgroundColor,
                ),
              ),
              backgroundColor: UScoreColor,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to save QR Code.',
                style: TextStyle(
                  fontSize: UTitleSize,
                  color: UBackgroundColor,
                ),
              ),
              backgroundColor: URedColor,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to capture QR Code.',
              style: TextStyle(
                fontSize: UTitleSize,
                color: UBackgroundColor,
              ),
            ),
            backgroundColor: URedColor,
          ),
        );
      }
    } else if (await Permission.storage.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Storage permission is permanently denied.',
            style: TextStyle(
              fontSize: UTitleSize,
              color: UBackgroundColor,
            ),
          ),
          backgroundColor: URedColor,
          action: SnackBarAction(
            label: 'Settings',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Storage permission is required to save QR Code.',
            style: TextStyle(
              fontSize: UTitleSize,
              color: UBackgroundColor,
            ),
          ),
          backgroundColor: URedColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        titleSpacing: UZeroPixel,
        centerTitle: false,
        title: const Text(
          'QR Code',
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
        iconTheme: const IconThemeData.fallback(),
        leading: buildBackBtn(
          () => Get.back(),
        ),
        actions: [
          IconButton(
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            icon: const FaIcon(
              FontAwesomeIcons.solidFloppyDisk,
              size: 20,
              color: UPrimaryColor,
            ),
            onPressed: () => _captureAndSave(context),
          ),
        ],
      ),
      body: buildQRCodeBody(
        qrKey: _qrKey,
        fullWidth: MediaQuery.of(context).size.width,
        fullHeight: MediaQuery.of(context).size.height,
        qrContainerSize: MediaQuery.of(context).size.width / 1.35,
        qrImgSize: MediaQuery.of(context).size.width / 1.75,
        data: '${widget.data_studentUser[0].student_id}:${widget.data_studentUser[0].pwd}',
        studentId: widget.data_studentUser[0].student_id,
        imageUrl: widget.profileImageUrl,
      ),
    );
  }
}
