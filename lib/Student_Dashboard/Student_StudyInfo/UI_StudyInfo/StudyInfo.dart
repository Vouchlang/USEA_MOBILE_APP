import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'StudyInfo_Exam.dart';

class Study_Info extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  Study_Info({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
  }) : super(key: key);

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  late StudyinfoExam? studyinfoExam;

  @override
  void initState() {
    super.initState();
    studyinfoExam = StudyinfoExam(
      data_studentUser: widget.data_studentUser,
      sourceScreen: widget.sourceScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការសិក្សា'.tr),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: UPdMg15),
        shrinkWrap: true,
        children: [studyinfoExam!],
      ),
    );
  }
}
