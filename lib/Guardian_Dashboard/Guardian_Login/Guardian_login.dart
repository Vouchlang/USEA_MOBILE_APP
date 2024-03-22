import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Guardian_Dashboard/Guardian_Home/UI_Home/Guardian_Home.dart';
import 'package:usea_app/theme_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_Widget/CustomText.dart';
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
  var data;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitForm() async {
    final String studentId = _textControllerUsername.text;
    final String password = _textControllerPsw.text;

    try {
      var response = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=login_parents',
        ),
        body: {
          'guardian_id': studentId,
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
              name_kh: item['name_kh'],
              guardian_id: item['guardian_id'],
              pwd: item['pwd'],
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
            duration: Duration(
              milliseconds: 100,
            ),
          );
        } else {
          print('Error');
        }
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              elevation: 2,
              child: Container(
                height: 175,
                margin: EdgeInsets.all(
                  UPdMg7,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: UPdMg10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    URoundedLarge,
                  ),
                  color: UBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'គណនីអាណាព្យបាល'.tr,
                      style: TextStyle(
                        fontSize: UTitleSize16,
                        fontWeight: UTitleWeight,
                      ),
                    ),
                    SizedBox(
                      height: UHeight10,
                    ),
                    Text(
                      'អត្តលេខអាណាព្យបាល ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវ។ សូមបញ្ចូលម្ដងទៀត!!!'
                          .tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                      ),
                    ),
                    SizedBox(
                      height: UHeight20,
                    ),
                    Divider(),
                    InkWell(
                      highlightColor: UTransParentColor,
                      splashColor: UTransParentColor,
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        width: UFullWidth,
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: UPrimaryColor,
                            fontSize: UTitleSize,
                            fontFamily: UEFontFamily,
                            fontWeight: UBodyWeight,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
            return Dialog(
              elevation: 2,
              child: Container(
                height: 175,
                margin: EdgeInsets.all(
                  7,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: UPdMg10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    URoundedLarge,
                  ),
                  color: UBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'គណនីអាណាព្យាបាល'.tr,
                      style: TextStyle(
                        fontSize: UTitleSize16,
                        fontWeight: UTitleWeight,
                      ),
                    ),
                    SizedBox(
                      height: UHeight10,
                    ),
                    Text(
                      'Server Error!!!'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                        fontFamily: UEFontFamily,
                      ),
                    ),
                    SizedBox(
                      height: UHeight20,
                    ),
                    Divider(),
                    InkWell(
                      highlightColor: UTransParentColor,
                      splashColor: UTransParentColor,
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        width: UFullWidth,
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: UPrimaryColor,
                            fontSize: UTitleSize,
                            fontFamily: UEFontFamily,
                            fontWeight: UBodyWeight,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ); // You can add further error handling logic if needed
      }
    }
  }

  void saveGuardianUser(SharedPreferences sharedPreferences,
      List<GuardianUser> guardianUserList) {
    final jsonData =
        guardianUserList.map((guardianUser) => guardianUser.toJson()).toList();
    sharedPreferences.setString(
      'guardian_user',
      json.encode(jsonData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(
        title: 'គណនីអាណាព្យាបាល'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: UPdMg20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo3.png',
              scale: UScale15,
            ),
            SizedBox(
              height: UHeight15,
            ),
            Text(
              'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
              style: TextStyle(
                fontFamily: 'KhmerOSmuol',
                color: UPrimaryColor,
                fontSize: UTitleSize16,
              ),
            ),
            Text(
              'UNIVERSITY OF SOUTH-EAST ASIA',
              style: TextStyle(
                letterSpacing: 1.5,
                fontFamily: UEFontFamily,
                color: UPrimaryColor,
                fontSize: UTitleSize16,
                fontWeight: UBodyWeight,
              ),
            ),
            SizedBox(
              height: UHeight15,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'អត្តលេខអាណាព្យាបាល'.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: UBodySize,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: UPdMg10,
                      horizontal: 30,
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _textControllerUsername,
                      cursorColor: UGreyColor,
                      cursorWidth: 1,
                      cursorHeight: UHeight30,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                          UPdMg10,
                        ),
                        hintText: '\t\tបញ្ចូលអត្តលេខ'.tr,
                        hintStyle: TextStyle(
                          fontSize: UBodySize10,
                          color: UGreyColor,
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _textControllerUsername.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 15,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UGreyColor,
                          ),
                        ),
                        suffixIconColor: UGreyColor,
                        errorStyle: TextStyle(
                          fontSize: UBodySize10,
                          fontFamily: UKFontFamily,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ពាក្យសម្ងាត់'.tr,
                      style: TextStyle(
                        fontSize: UBodySize,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: UPdMg10,
                      horizontal: 30,
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: _textControllerPsw,
                      cursorColor: UGreyColor,
                      cursorWidth: 1,
                      cursorHeight: UHeight30,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                          UPdMg10,
                        ),
                        hintText: '\t\tបញ្ចូលពាក្យសម្ងាត់'.tr,
                        hintStyle: TextStyle(
                          fontSize: UBodySize10,
                          color: UGreyColor,
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _obscureText = !_obscureText;
                              },
                            );
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 15,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UGreyColor,
                          ),
                        ),
                        suffixIconColor: UGreyColor,
                        errorStyle: TextStyle(
                          fontSize: UBodySize10,
                          fontFamily: UKFontFamily,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: UHeight10,
                  ),
                ],
              ),
            ),
            InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: _submitForm,
              child: Container(
                width: 100,
                height: UHeight40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    UPdMg5,
                  ),
                  color: UPrimaryColor,
                ),
                child: Text(
                  'ចូល'.tr,
                  style: TextStyle(
                    color: UBackgroundColor,
                    fontSize: UTitleSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
