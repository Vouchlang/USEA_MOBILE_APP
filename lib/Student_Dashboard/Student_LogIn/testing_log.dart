import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail.dart';

class User {
  final String student_id;
  final String pwd;

  User({
    required this.student_id,
    required this.pwd,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      student_id: json['student_id'],
      pwd: json['pwd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': student_id,
      'pwd': pwd,
    };
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final TextEditingController _student_idController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final user = User(
      student_id: _student_idController.text,
      pwd: _pwdController.text,
    );

    final apiUrl = 'http://192.168.3.34/hosting_api/Student/st_login.php';
    final headers = {'Content-Type': 'application/json'};

    // Make API login request with user data
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: jsonEncode(user.toJson()));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['access_token'];

      // Save token to local storage using SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', token);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => TTT(
                    user: responseData,
                  )));
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to log in. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _student_idController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: false,
            ),
            SizedBox(height: 32.0),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              ElevatedButton(
                onPressed: _login,
                child: Text('Log in'),
              ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
