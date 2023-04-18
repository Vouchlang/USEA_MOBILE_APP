import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail.dart';

class testing_log extends StatefulWidget {
  @override
  _testing_logState createState() => _testing_logState();
}

class _testing_logState extends State<testing_log> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Fetch data from API and parse response
      final response = await http.post(
          Uri.parse('http://192.168.3.34/hosting_api/Student/st_login.php'),
          body: {
            'student_id': _usernameController.text,
            'pwd': _passwordController.text,
          });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Navigate to next screen and pass data
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NextScreen(data)));
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
      appBar: AppBar(title: Text('Testing')),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Student ID',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
