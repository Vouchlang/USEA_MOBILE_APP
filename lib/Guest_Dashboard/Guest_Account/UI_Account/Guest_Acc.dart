import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Student_Dashboard/Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../../Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import '../../../Student_Dashboard/Student_JobHistory/Class_JobHistory/Class_Job_History.dart';
import '../../../Student_Dashboard/Student_LogIn/Student_LogIn.dart';
import '../../../Student_Dashboard/Student_LogIn/testing_log_detail.dart';
import '/Guest_Dashboard/Guest_Account/Class_Account/Class_Account_Screen.dart';
import '/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';

class Guest_Acc extends StatefulWidget {
  const Guest_Acc({Key? key}) : super(key: key);

  @override
  State<Guest_Acc> createState() => Guest_AccState();
}

class Guest_AccState extends State<Guest_Acc> {
  static const String KEYLOGIN = 'login';
  static const String KEYJOBHISTORY = 'job_history';
  static const String KEYSTDETAIL = 'student_detail';

  var studentLogIn = Student_LogIn();
  final List<Account_Screen> account_screen = [
    Account_Screen(
      name: 'គណនីនិស្សិត',
      img: 'assets/image/Acc_Student.png',
      screen: Student_LogIn(),
    ),
    Account_Screen(
      name: 'គណនីអាណាព្យាបាល',
      img: 'assets/image/Acc_Guardian.png',
      screen: LoginPage1(),
    ),
    Account_Screen(
      name: 'គណនីបុគ្គលិក',
      img: 'assets/image/Acc_Staff.png',
      screen: New_Event(),
    ),
    Account_Screen(
      name: 'គណនីសាស្ត្រាចារ្យ',
      img: 'assets/image/Acc_Lecturer.png',
      screen: New_Event(),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLoggedIn = sharePref.getBool(KEYLOGIN);

    if (isLoggedIn != null) {
      if (isLoggedIn) {
        List<JobHistory> dataJobHistory = getSavedJobHistory(sharePref);
        List<StDetail> dataStDetail = getSavedStDetail(sharePref);
        if (dataJobHistory.isNotEmpty && dataStDetail.isNotEmpty) {
          navigateToJobHistoryScreen(dataJobHistory, dataStDetail);
        }
      }
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

  void navigateToJobHistoryScreen(
      List<JobHistory> jobHistory, List<StDetail> stDetail) {
    Get.off(
      St_Home(
        data: stDetail,
        data_jobhistory: jobHistory,
        data_stdetail: stDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/usea_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 270,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.95,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                  children: List.generate(
                    account_screen.length,
                    (index) => Card(
                      elevation: 3,
                      color: Colors.white,
                      shadowColor: Colors.grey[200],
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
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                account_screen[index].img,
                                scale: 7,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                account_screen[index].name.tr,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
