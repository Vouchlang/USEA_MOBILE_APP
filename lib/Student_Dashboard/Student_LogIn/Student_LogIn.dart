import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Custom_AppBar.dart';
import '../../Guest_Dashboard/Guest_Account/UI_Account/Guest_Acc.dart';

class Student_LogIn extends StatefulWidget {
  @override
  State<Student_LogIn> createState() => _Student_LogInState();
}

class _Student_LogInState extends State<Student_LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  bool _obscureText = true;
  var data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _submitForm() async {
      if (_formKey.currentState!.validate()) {
        // Fetch data from API and parse response
        final response = await http.post(
            Uri.parse('http://192.168.3.34/hosting_api/Student/st_login.php'),
            body: {
              'student_id': _textControllerUsername.text,
              'pwd': _textControllerPsw.text,
            });

        if (response.statusCode == 200) {
          data = jsonDecode(response.body);
          print(data);
          var sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(Guest_AccState.KEYLOGIN, true);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => St_Home(
                        data: data,
                        data_jobhistory: data, data_stdetail: data,
                      )));
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                elevation: 3,
                child: Container(
                  height: 175.0,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'គណនីនិស្សិត'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'KhmerOSbattambang',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'អត្តលេខនិស្សិត ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវ។ សូមបញ្ចូលម្ដងទៀត!!!'
                            .tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.5, fontFamily: 'KhmerOSbattambang'),
                      ),
                      SizedBox(height: 20.0),
                      Divider(),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).copyWith().primaryColor,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'គណនីនិសិ្សត'.tr),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo3.png',
              scale: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
              style: TextStyle(
                  fontFamily: 'KhmerOSmuol',
                  color: Theme.of(context).primaryColor,
                  fontSize: 16),
            ),
            Text(
              'UNIVERSITY OF SOUTH-EAST ASIA',
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontFamily: 'Poppins',
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'អត្តលេខនិស្សិត'.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'KhmerOSbattambang',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _textControllerUsername,
                      cursorColor: Colors.grey,
                      cursorWidth: 1,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: '\t\tបញ្ចូលអត្តលេខ'.tr,
                          hintStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontFamily: 'KhmerOSbattambang'),
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
                              borderSide: BorderSide(color: Colors.grey)),
                          suffixIconColor: Colors.grey,
                          errorStyle: TextStyle(
                              fontSize: 10, fontFamily: 'KhmerOSbattambang')),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'សូមបញ្ចូលអត្តលេខ'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ពាក្យសម្ងាត់'.tr,
                      style: TextStyle(
                        fontFamily: 'KhmerOSbattambang',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    alignment: Alignment.center,
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: _textControllerPsw,
                      cursorColor: Colors.grey,
                      cursorWidth: 1,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: '\t\tបញ្ចូលពាក្យសម្ងាត់'.tr,
                          hintStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontFamily: 'KhmerOSbattambang'),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 15,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          suffixIconColor: Colors.grey,
                          errorStyle: TextStyle(
                              fontSize: 10, fontFamily: 'KhmerOSbattambang')),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'សូមបញ្ចូលពាក្យសម្ងាត់'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: _submitForm,
              child: Container(
                width: 75,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'ចូល'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'KhmerOSbattambang',
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
