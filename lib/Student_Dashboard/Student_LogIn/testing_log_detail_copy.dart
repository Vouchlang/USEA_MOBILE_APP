import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/Student_Dashboard/Student_JobHistory/Class_JobHistory/Class_Job_History.dart';
import '/Student_Dashboard/Student_LogIn/testing_log_detail_more.dart';
import '../Student_Detail/Class_Detail/Class_St_Detail.dart';

class LoginPage1_M extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1_M> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = '';

  Future<void> _login1() async {
    final String studentId = _studentIdController.text;
    final String password = _passwordController.text;

    final url = 'http://192.168.3.34/hosting_api/Student/login_test.php';
    final response = await http.post(Uri.parse(url), body: {
      'student_id': studentId,
      'pwd': password,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data != null) {
        final userData = data['user_data'];
        final jobHistoryData = data['job_history_data'];

        List<JobHistory> dataList1 = [];
        for (var item in jobHistoryData) {
          JobHistory dataModel = JobHistory(
            date_start_work: item['date_start_work'],
            workPlace: item['work_place'],
            position: item['position'],
            salary: item['salary'],
            status_name: 'status_name',
          );
          dataList1.add(dataModel);
        }

        List<StDetail> dataList2 = [];
        for (var item in userData) {
          StDetail dataModel = StDetail(
            faculty_name: item['faculty_name'],
            degree_name: item['degree_name'],
            major_name: item['major_name'],
            year_name: item['year_name'],
            semester_name: item['semester_name'],
            name_kh: item['name_kh'],
            name_en: item['name_en'],
            student_id: item['student_id'],
            stage_name: item['stage_name'],
            term_name: item['term_name'],
            academic_year: item['academic_year'],
            shift_name: item['shift_name'],
            room_name: item['room_name'],
            status_name: item['status_name'],
            date_of_birth: item['date_of_birth'],
            phone_number: item['phone_number'],
            profile_pic: item['profile_pic'],
            job: item['job'],
            work_place: item['work_place'],
          );
          dataList2.add(dataModel);
        }

        print(dataList1);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataPage(
              data11: dataList1,
              data12: dataList2,
            ),
          ),
        );
      } else {
        setState(() {
          _message = 'Invalid credentials';
        });
      }
    } else {
      setState(() {
        _message = 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _studentIdController,
                decoration: InputDecoration(
                  labelText: 'Student ID',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: false,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login1,
                child: Text('Login1'),
              ),
              SizedBox(height: 16.0),
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}
