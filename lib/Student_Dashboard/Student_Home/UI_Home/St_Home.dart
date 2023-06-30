import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Student_Dashboard/Student_Schedule/Class_Schedule/Class_Schedule.dart';
import 'package:usea_app/Student_Dashboard/Student_StudyInfo/Class_StudyInfo/Class_Study_Info.dart';
import '/theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Student_Other_Class/Class_Survey_Status.dart';
import '/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';
import 'Student_Dashboard.dart';

class St_Home extends StatefulWidget {
  final dynamic data;
  final List<StudentUser> data_studentUser;
  final List<SurveyStatus> data_survey;
  final List<JobHistory> data_jobhistory;
  final List<StDetail> data_stdetail;
  final List<StudyInfoData> data_studyinfo;
  final List<ScheduleClass> data_schedule;

  const St_Home({
    Key? key,
    required this.data,
    required this.data_jobhistory,
    required this.data_stdetail,
    required this.data_studentUser,
    required this.data_survey,
    required this.data_studyinfo,
    required this.data_schedule,
  }) : super(key: key);

  @override
  State<St_Home> createState() => _St_HomeState();
}

class _St_HomeState extends State<St_Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late TabController controller;

  int currentIndex = 1;
  void onTap(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      Guest_Home(),
      Student_Home(
        data_studentUser: widget.data_studentUser,
        data_survey: widget.data_survey,
        data_jobhistory: widget.data_jobhistory,
        data_stdetail: widget.data_stdetail,
        data_studyinfo: widget.data_studyinfo,
        data_schedule: widget.data_schedule,
      ),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 100,
        child: Center(
          child: BottomNavigationBar(
            elevation: 0,
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: UPrimaryColor,
            unselectedItemColor: UGreyColor,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: 'ទំព័រដើម'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  size: 20,
                ),
                label: 'ចូលគណនី'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
