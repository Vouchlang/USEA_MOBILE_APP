import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Student_Dashboard/Student_Home/UI_Home/St_Home.dart';

import '../../Custom_AppBar.dart';

class Student_LogIn extends StatefulWidget {
  @override
  State<Student_LogIn> createState() => _Student_LogInState();
}

class _Student_LogInState extends State<Student_LogIn> {
  final _textControllerUsername = TextEditingController();
  final _textControllerPsw = TextEditingController();
  String userName = '1';
  String password = '1';
  String errorText = 'Error';
  bool _obscureText = true;
  bool _validateUsername = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: Custom_AppBar(title: 'Student Account'.tr),
      body: Container(
        alignment: Alignment.center,
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
                  color: Colors.indigo[900],
                  fontSize: 16),
            ),
            Text(
              'UNIVERSITY OF SOUTH-EAST ASIA',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.indigo[900],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'អត្តលេខនិស្សិត',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'KhmerOSbattambang',
                  color: Colors.grey[700],
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              alignment: Alignment.center,
              child: TextField(
                controller: _textControllerUsername,
                cursorColor: Colors.grey,
                cursorWidth: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '\t\tបញ្ចូលអត្តលេខ',
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
                  errorText:
                      _validateUsername ? 'Username cannot be null' : null,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'ពាក្យសម្ងាត់',
                style: TextStyle(
                  fontFamily: 'KhmerOSbattambang',
                  color: Colors.grey[700],
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              alignment: Alignment.center,
              child: TextField(
                obscureText: _obscureText,
                controller: _textControllerPsw,
                cursorColor: Colors.grey,
                cursorWidth: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '\t\tបញ្ចូលពាក្យសម្ងាត់',
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
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 15,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    suffixIconColor: Colors.grey,
                    errorText:
                        _validatePassword ? 'Password cannot be null' : null),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 75,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.indigo[900],
              ),
              child: InkWell(
                onTap: () {
                  setState(
                    () {
                      if (userName == _textControllerUsername.text &&
                          password == _textControllerPsw.text) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => St_Home()));
                      } else if (_textControllerUsername.text.isEmpty &&
                          _textControllerPsw.text.isEmpty) {
                        _validateUsername = true;
                        _validatePassword = true;
                      } else if (_textControllerUsername.text.isEmpty) {
                        _validateUsername = true;
                      } else if (_textControllerPsw.text.isEmpty) {
                        _validatePassword = true;
                      } else if (_textControllerPsw.text.isNotEmpty &&
                          _textControllerUsername.text.isNotEmpty) {
                        _validatePassword = false;
                        _validateUsername = false;
                      } else if (_textControllerPsw.text.isNotEmpty) {
                        _validatePassword = false;
                      } else if (_textControllerUsername.text.isNotEmpty) {
                        _validateUsername = false;
                      }
                    },
                  );
                },
                child: Text(
                  'ចូល',
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
