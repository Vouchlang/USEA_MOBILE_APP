import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Custom_Build_Student_login.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../Users_API.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '/Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Custom_AppBar.dart';

class Student_LogIn extends StatefulWidget {
  @override
  State<Student_LogIn> createState() => _Student_LogInState();
}

class _Student_LogInState extends State<Student_LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitForm() async {
    final String studentId = _textControllerUsername.text;
    final String password = _textControllerPsw.text;

    try {
      var response = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': studentId,
          'pwd': password,
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
          saveStudentUser(
            sharedPref,
            dataList_StudentUser,
          );

          Get.off(
            () => St_Home(
              data_studentUser: dataList_StudentUser,
              sourceScreen: st_sourceScreen,
            ),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 100),
          );
        } else {
          print('Error');
        }
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => buildErrorDialog(
            txtTitle: 'គណនីនិស្សិត'.tr,
            txtDescription: 'អត្តលេខនិស្សិត ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវ។ សូមបញ្ចូលម្ដងទៀត!!!'.tr,
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e');
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return buildErrorDialog(
              txtTitle: 'គណនីនិស្សិត'.tr,
              txtDescription: 'Server Error!!!'.tr,
            );
          },
        );
      }
    }
  }

  // Save student user
  void saveStudentUser(SharedPreferences sharedPreferences, List<StudentUser> studentUserList) {
    final jsonData = studentUserList.map((studentUser) => studentUser.toJson()).toList();
    sharedPreferences.setString(
      'student_user',
      json.encode(jsonData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'គណនីនិសិ្សត'.tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: UPdMg20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUniversityColumn(imageHeight: MediaQuery.of(context).size.height / 4),
            buildHeight15(),
            buildForm(
              formKey: _formKey,
              accName: 'អត្តលេខនិស្សិត'.tr,
              textControllerUserName: _textControllerUsername,
              textControllerUserPsw: _textControllerPsw,
              inputHint: '\t\tបញ្ចូលអត្តលេខនិស្សិត'.tr,
              obscureText: _obscureText,
              onPressed: () => setState(
                () => _obscureText = !_obscureText,
              ),
            ),
            buildSubmitButton(_submitForm),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     buildSubmitButton(_submitForm),
            //     buildWidth15(),
            //     InkWell(
            //       highlightColor: UTransParentColor,
            //       splashColor: UTransParentColor,
            //       onTap: _navigateToQRScanner,
            //       child: Container(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: UPdMg15,
            //         ),
            //         height: UHeight40,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(
            //             UPdMg5,
            //           ),
            //           color: UPrimaryColor,
            //         ),
            //         child: const Text(
            //           'Scan QR Code',
            //           style: TextStyle(
            //             color: UBackgroundColor,
            //             fontSize: UTitleSize,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
