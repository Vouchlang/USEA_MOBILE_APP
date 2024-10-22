import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Guardian_Dashboard/Guardian_Home/UI_Home/Guardian_Home.dart';
import '../../../theme_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_Widget/CustomText.dart';
import '../../Student_Dashboard/Student_LogIn/Login/Custom_Build_Student_login.dart';
import '../../Student_Dashboard/Users_API.dart';
import '../Guardian_Other_Class/Class_Guardian_User.dart';
import '/Custom_AppBar.dart';

class Guardian_Login extends StatefulWidget {
  @override
  State<Guardian_Login> createState() => _Guardian_LoginState();
}

class _Guardian_LoginState extends State<Guardian_Login> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  bool _obscureText = true;
  // var data;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitForm() async {
    final String guardianId = _textControllerUsername.text;
    final String password = _textControllerPsw.text;

    try {
      var response = await http.post(
        Uri.parse(APIGuardianLogin),
        body: {
          'guardian_id': guardianId,
          'pwd': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          final guardianUserData = data['guardian_users'];

          List<GuardianUser> dataList_GuardianUser = [];
          for (var item in guardianUserData) {
            GuardianUser dataModel1 = GuardianUser(
              name_kh: item['name_kh'] ?? 'N/A',
              guardian_id: item['guardian_id'] ?? 'N/A',
              pwd: item['pwd'] ?? 'N/A',
            );
            dataList_GuardianUser.add(dataModel1);
          }

          SharedPreferences sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool('login', true);
          saveGuardianUser(
            sharedPref,
            dataList_GuardianUser,
          );

          Get.off(
            () => Guardian_Home(
              data_guardianUser: dataList_GuardianUser,
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
          builder: (BuildContext context) {
            return buildErrorDialog(
              txtTitle: 'គណនីអាណាព្យាបាល'.tr,
              txtDescription: 'អត្តលេខអាណាព្យាបាល ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវ។ សូមបញ្ចូលម្ដងទៀត!!!'.tr,
            );
          },
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
              txtTitle: 'គណនីអាណាព្យាបាល'.tr,
              txtDescription: 'Server Error!!!'.tr,
            );
          },
        );
      }
    }
  }

  // Save guardian user
  void saveGuardianUser(SharedPreferences sharedPreferences, List<GuardianUser> guardianUserList) {
    final jsonData = guardianUserList.map((guardianUser) => guardianUser.toJson()).toList();
    sharedPreferences.setString(
      'guardian_user',
      json.encode(jsonData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'គណនីអាណាព្យាបាល'.tr),
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
              accName: 'អត្តលេខអាណាព្យាបាល'.tr,
              textControllerUserName: _textControllerUsername,
              textControllerUserPsw: _textControllerPsw,
              inputHint: '\t\tបញ្ចូលអត្តលេខអាណាព្យាបាល'.tr,
              obscureText: _obscureText,
              onPressed: () => setState(
                () => _obscureText = !_obscureText,
              ),
            ),
            buildSubmitButton(_submitForm),
          ],
        ),
      ),
    );
  }
}
