import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_loginPage1.dart';

class ApiService {
  static const baseUrl = 'http://192.168.3.34/hosting_api/Student';

  static Future<http.Response> login(String student_id, String pwd) async {
    final response =
        await http.post(Uri.parse('$baseUrl/st_login_demo.php'), body: {
      'student_id': student_id,
      'pwd': pwd,
    });
    return response;
  }

  static Future<http.Response> getPosts() async {
    final response =
        await http.get(Uri.parse('$baseUrl/st_workplace_demo.php'));
    return response;
  }

  // Add additional API requests as needed
}

class AuthService {
  static final _storage = FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  static Future<void> setToken(String access_token) async {
    await _storage.write(key: 'access_token', value: access_token);
  }

  static Future<bool> isLoggedIn() async {
    final access_token = await getToken();
    return access_token != null;
  }

  static Future<void> logout() async {
    await _storage.delete(key: 'access_token');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final _student_idController = TextEditingController();
  final _pwdController = TextEditingController();

  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final student_id = _student_idController.text;
    final pwd = _pwdController.text;

    final response = await ApiService.login(student_id, pwd);

    if (response.statusCode == 200) {
      final access_token = response.body;
      print('Access Token: $access_token'); // Print access_token in console
      await AuthService.setToken(access_token);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid student_id or pwd'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _student_idController,
              decoration: InputDecoration(
                labelText: 'Student ID',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _pwdController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading ? CircularProgressIndicator() : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
