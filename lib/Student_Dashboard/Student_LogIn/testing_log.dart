import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail.dart';

import '../../Custom_AppBar.dart';
import '../Student_Home/UI_Home/St_Home.dart';

class testing_log extends StatefulWidget {
  @override
  _testing_logState createState() => _testing_logState();
}

class _testing_logState extends State<testing_log> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  bool _obscureText = true;

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
        final data = jsonDecode(response.body);

        // Navigate to next screen and pass data
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => NextScreen(data)));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => St_Home(
                      data: data,
                    )));
      } else {
        // Show error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Error'.tr),
            content: Text('Invalid Student ID or Password.'.tr),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Student ID'.tr;
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
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password'.tr;
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
