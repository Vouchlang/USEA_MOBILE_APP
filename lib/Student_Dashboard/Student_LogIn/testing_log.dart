import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String? _token;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      setState(() {
        _isLoggedIn = true;
        _token = prefs.getString('token');
      });
    }
  }

  void _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> _getToken(String studentId, String pwd) async {
    final response = await http.post(
      Uri.parse('http://192.168.3.34/hosting_api/Student/st_login.php'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'student_id': studentId,
        'pwd': pwd,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['error'] == false) {
        _saveToken(responseJson['token']);
        return responseJson['token'];
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>?> _getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.post(
      Uri.parse('http://192.168.3.34/hosting_api/Student/st_profile.php'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['error'] == false) {
        return responseJson['data'];
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      throw Exception('Failed to load profile');
    }
  }

  void _login() {
    setState(() {
      _isLoading = true;
    });

    _getToken(_studentIdController.text, _passwordController.text)
        .then((value) => {
              setState(() {
                _isLoading = false;
                _isLoggedIn = true;
                _token = value;
              }),
              _getProfile().then((profileData) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TestCredential(
                      profileData: {},
                    ),
                  ),
                );
              }),
            })
        .catchError((error) => {
              setState(() {
                _isLoading = false;
              }),
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(error.toString()),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing')),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 48.0),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _studentIdController,
                    decoration: InputDecoration(
                      hintText: 'Student ID',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      _login();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
