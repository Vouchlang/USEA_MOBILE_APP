import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _token;
  Map<String, dynamic>? _profileData;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  Future<String> _getToken(String studentId, String password) async {
    final url =
        Uri.parse('http://192.168.3.34/hosting_api/Student/st_login.php');
    final response = await http.post(
      url,
      body: {
        'student_id': studentId,
        'pwd': password,
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      print('Token: $token');
      return token;
    } else {
      throw Exception('Failed to get token');
    }
  }

  Future<Map<String, dynamic>> _getProfile() async {
    final response = await http.get(
      Uri.parse('http://192.168.3.34/hosting_api/Student/st_workplace.php'),
      headers: {'Authorization': 'Bearer $_token'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load profile');
    }
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final token =
          await _getToken(_studentIdController.text, _passwordController.text);
      setState(() {
        _isLoading = false;
        _isLoggedIn = true;
        _token = token;
      });

      final profileData = await _getProfile();
      setState(() {
        _profileData = profileData;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => TestCredential(
            profileData: _profileData!,
          ),
        ),
      );
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: SelectableText(error.toString()),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              _isLoggedIn
                  ? Text(
                      'You are logged in!',
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _studentIdController,
                            decoration: InputDecoration(
                              hintText: 'Student ID',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            obscureText: false,
                          ),
                        ),
                        _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  _login();
                                },
                                child: Text('Login'),
                              ),
                      ],
                    ),
            ]))));
  }
}
