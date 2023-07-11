import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_AppBar.dart';
import '../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../Student_Home/UI_Home/St_Home.dart';
import '../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
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

        List<JobHistory> dataList_JobHistory = [];
        for (var item in jobHistoryData) {
          JobHistory dataModel1 = JobHistory(
            date_start_work: item['date_start_work'],
            status_name: item['status_name'],
            workPlace: item['work_place'],
            position: item['position'],
            salary: item['salary'],
          );
          dataList_JobHistory.add(dataModel1);
        }

        List<StDetail> dataList_StDetail = [];
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
          dataList_StDetail.add(dataModel);
        }

        SharedPreferences sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool('login', true);
        // saveJobHistory(sharedPref, dataList_JobHistory);
        // saveStDetail(sharedPref, dataList_StDetail);

        Get.off(St_Home(
          // data_jobhistory: dataList_JobHistory,
          data_studentUser: [],
          // data_survey: [],
          // data_studyinfo: [],
          // data_schedule: [],
        ));
      } else {
        print('Error');
      }
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
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                              color: Theme.of(context).copyWith().primaryColor,
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

  // void saveJobHistory(
  //     SharedPreferences sharedPreferences, List<JobHistory> jobHistoryList) {
  //   final jsonData =
  //       jobHistoryList.map((jobHistory) => jobHistory.toJson()).toList();
  //   sharedPreferences.setString('job_history', json.encode(jsonData));
  // }

  // void saveStDetail(
  //     SharedPreferences sharedPreferences, List<StDetail> stDetailList) {
  //   final jsonData = stDetailList.map((stDetail) => stDetail.toJson()).toList();
  //   sharedPreferences.setString('student_detail', json.encode(jsonData));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'គណនីនិសិ្សត'.tr),
      body: Container(),
    );
  }
}
