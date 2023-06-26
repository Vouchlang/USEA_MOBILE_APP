import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Student_Dashboard/Student_Other_Class/Class_Student_User.dart';
import '../../../Student_Dashboard/Student_Other_Class/Class_Survey_Status.dart';
import '/Student_Dashboard/Student_Detail/Class_Detail/Class_St_Detail.dart';
import '/Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import '/Student_Dashboard/Student_JobHistory/Class_JobHistory/Class_Job_History.dart';
import '/Student_Dashboard/Student_LogIn/Student_LogIn.dart';
import '/theme_builder.dart';
import '../Class_Account/Class_Account_Screen.dart';

class Guest_Acc extends StatefulWidget {
  const Guest_Acc({Key? key}) : super(key: key);

  @override
  State<Guest_Acc> createState() => Guest_AccState();
}

class Guest_AccState extends State<Guest_Acc> {
  static const String KEYLOGIN = 'login';
  static const String KEYSTUDENT_USER = 'student_user';
  static const String KEYSURVEY = 'survey';
  static const String KEYJOBHISTORY = 'job_history';
  static const String KEYSTDETAIL = 'student_detail';

  // var studentLogIn = Student_LogIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLoggedIn = sharePref.getBool(KEYLOGIN);

    if (isLoggedIn != null && isLoggedIn) {
      List<StudentUser> dataStudentUser = getSavedStudentUser(sharePref);
      List<SurveyStatus> dataSurvey = getSavedSurvey(sharePref);
      List<JobHistory> dataJobHistory = getSavedJobHistory(sharePref);
      List<StDetail> dataStDetail = getSavedStDetail(sharePref);
      if (isLoggedIn) {
        navigateToSt_HomeScreen(
            dataStudentUser, dataSurvey, dataJobHistory, dataStDetail);
      }
    }
  }

  List<StudentUser> getSavedStudentUser(SharedPreferences sharedPreferences) {
    final studentUserString = sharedPreferences.getString(KEYSTUDENT_USER);
    if (studentUserString != null) {
      final jsonData = json.decode(studentUserString);
      List<StudentUser> studentUserList = [];
      for (var item in jsonData) {
        StudentUser studentUser = StudentUser.fromJson(item);
        studentUserList.add(studentUser);
      }
      return studentUserList;
    } else {
      return [];
    }
  }

  List<SurveyStatus> getSavedSurvey(SharedPreferences sharedPreferences) {
    final surveyString = sharedPreferences.getString(KEYSURVEY);
    if (surveyString != null) {
      final jsonData = json.decode(surveyString);
      List<SurveyStatus> surveyList = [];

      for (var item in jsonData) {
        SurveyStatus survey = SurveyStatus.fromJson(item);
        surveyList.add(survey);
      }

      return surveyList;
    } else {
      return [];
    }
  }

  List<JobHistory> getSavedJobHistory(SharedPreferences sharedPreferences) {
    final jobHistoryString = sharedPreferences.getString(KEYJOBHISTORY);
    if (jobHistoryString != null) {
      final jsonData = json.decode(jobHistoryString);
      List<JobHistory> jobHistoryList = [];

      for (var item in jsonData) {
        JobHistory jobHistory = JobHistory.fromJson(item);
        jobHistoryList.add(jobHistory);
      }
      return jobHistoryList;
    } else {
      return [];
    }
  }

  List<StDetail> getSavedStDetail(SharedPreferences sharedPreferences) {
    final stDetailString = sharedPreferences.getString(KEYSTDETAIL);
    if (stDetailString != null) {
      final jsonData = json.decode(stDetailString);
      List<StDetail> stDetailList = [];

      for (var item in jsonData) {
        StDetail stDetail = StDetail.fromJson(item);
        stDetailList.add(stDetail);
      }
      return stDetailList;
    } else {
      return [];
    }
  }

  void navigateToSt_HomeScreen(
    List<StudentUser> studentUser,
    List<SurveyStatus> survey,
    List<JobHistory> jobHistory,
    List<StDetail> stDetail,
  ) {
    Get.off(
      St_Home(
        data_studentUser: studentUser,
        data_survey: survey,
        data: stDetail,
        data_jobhistory: jobHistory,
        data_stdetail: stDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Container(
            height: 10,
            color: Colors.blue,
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: USecondaryColor,
              image: DecorationImage(
                image: AssetImage('assets/image/guess_acc.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 3.5,
            crossAxisSpacing: 3,
            childAspectRatio: 1.90,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
            children: List.generate(
              account_screen.length,
              (index) => Card(
                elevation: 2,
                color: UBackgroundColor,
                shadowColor: ULightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return account_screen[index].screen;
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        account_screen[index].img,
                        scale: 6,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        account_screen[index].name.tr,
                        style: TextStyle(
                          fontSize: UTitleSize,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
