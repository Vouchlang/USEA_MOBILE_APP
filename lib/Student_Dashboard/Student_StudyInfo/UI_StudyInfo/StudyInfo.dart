import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Class_StudyInfo/Class_Study_Info_assignment.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_StudyInfo/Class_Study_Info.dart';

class Study_Info extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  const Study_Info({
    super.key,
    required this.data_studentUser,
  });

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  bool isLoading = false;
  late List<StudyInfoData> _dataStudyInfo = [];
  late List<StudyInfoAssignmentData> _dataStudyInfoAssignment = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? 'http://192.168.1.182/usea/api/apidata.php?action=exam_schedule'
            : 'http://192.168.1.182/usea/api/student_info_data_exam_en.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );
      var response_assignment = await http.post(
        Uri.parse(
            'http://192.168.1.51/hosting_api/Test_student/st_study_info_assignment_testing.php'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (mounted) {
          setState(() {
            _dataStudyInfo = List<StudyInfoData>.from(
              data['study_info_data'].map(
                (data) => StudyInfoData.fromJson(data),
              ),
            );
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }

      if (response_assignment.statusCode == 200) {
        var data_assignment = jsonDecode(response_assignment.body);
        if (mounted) {
          setState(() {
            _dataStudyInfoAssignment = List<StudyInfoAssignmentData>.from(
              data_assignment['study_info_assignment_data'].map(
                (data_assignment) =>
                    StudyInfoAssignmentData.fromJson(data_assignment),
              ),
            );
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Error: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការសិក្សា'.tr),
      body: _dataStudyInfo.isEmpty && _dataStudyInfoAssignment.isEmpty
          ? FutureBuilder(
              future: Future.delayed(Duration(seconds: 10)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: UPrimaryColor,
                    ),
                  );
                } else {
                  return Center(
                    child: Text('គ្មានទិន្ន័យ'.tr),
                  );
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _dataStudyInfo.isEmpty
                        ? SizedBox.shrink()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(UPdMg_5),
                            itemCount: _dataStudyInfo.length,
                            itemBuilder: (BuildContext context, index) {
                              final isLastIndex =
                                  index == _dataStudyInfo.length - 1;
                              return Card(
                                elevation: 1,
                                shadowColor: ULightGreyColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(URoundedLarge),
                                ),
                                color: UBackgroundColor,
                                margin: isLastIndex
                                    ? EdgeInsets.fromLTRB(
                                        UPdMg_5, UPdMg_5, UPdMg_5, UPdMg_10)
                                    : EdgeInsets.all(UPdMg_5),
                                child: Padding(
                                  padding: EdgeInsets.all(UPdMg_8),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              NormalDateStudyInfo(
                                                _dataStudyInfo[index].date,
                                              ),
                                              buildDividerAtt(),
                                              NormalDateStudyInfo(
                                                  _dataStudyInfo[index].month),
                                            ],
                                          ),
                                        ),
                                        buildVerticalDividerAtt(),
                                        Container(
                                          padding:
                                              EdgeInsets.only(left: UPdMg_8),
                                          child: IntrinsicWidth(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 250,
                                                  child: TitleAttendance_Theme(
                                                      _dataStudyInfo[index]
                                                          .title),
                                                ),
                                                buildDividerAtt(),
                                                RowDataStudyInfo(
                                                  'មុខវិជ្ជា\t',
                                                  _dataStudyInfo[index].subject,
                                                ),
                                                RowDataStudyInfo(
                                                  'បន្ទប់\t',
                                                  _dataStudyInfo[index].room,
                                                ),
                                                RowDataStudyInfo(
                                                  'ម៉ោង\t',
                                                  _dataStudyInfo[index].time,
                                                ),
                                                RowDataStudyInfo(
                                                  'លេខតុ\t',
                                                  _dataStudyInfo[index].seat,
                                                ),
                                                _dataStudyInfo[index].takeout ==
                                                        '1'
                                                    ? Text(
                                                        'ដកបេក្ខភាព',
                                                        style: TextStyle(
                                                          fontSize: UBodySize,
                                                          fontWeight:
                                                              UTitleWeight,
                                                          color: URedColor,
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    _dataStudyInfoAssignment.isEmpty
                        ? SizedBox.shrink()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(UPdMg_5),
                            itemCount: _dataStudyInfoAssignment.length,
                            itemBuilder: (BuildContext context, index) {
                              final isLastIndex =
                                  index == _dataStudyInfoAssignment.length - 1;
                              return Card(
                                elevation: 2,
                                shadowColor: ULightGreyColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(URoundedLarge),
                                ),
                                margin: isLastIndex
                                    ? EdgeInsets.fromLTRB(
                                        UPdMg_5, UPdMg_5, UPdMg_5, UPdMg_10)
                                    : EdgeInsets.all(UPdMg_5),
                                child: Padding(
                                  padding: EdgeInsets.all(UPdMg_10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Text(
                                              _dataStudyInfoAssignment[index]
                                                      .expire_date
                                                      .isEmpty
                                                  ? 'ថ្ងៃផុតកំណត់៖ '.tr + 'N/A'
                                                  : 'ថ្ងៃផុតកំណត់៖ '.tr +
                                                      _dataStudyInfoAssignment[
                                                              index]
                                                          .expire_date,
                                              style: TextStyle(
                                                fontSize: UTitleSize,
                                                fontWeight: UTitleWeight,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: UWidth15,
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Text(
                                              _dataStudyInfoAssignment[index]
                                                      .expire_time
                                                      .isEmpty
                                                  ? 'ម៉ោង '.tr + 'N/A'
                                                  : 'ម៉ោង '.tr +
                                                      _dataStudyInfoAssignment[
                                                              index]
                                                          .expire_time,
                                              style: TextStyle(
                                                fontSize: UTitleSize,
                                                fontWeight: UTitleWeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      buildDividerStDetail(),
                                      buildStudyDataAssign(
                                          'ឈ្មោះ',
                                          _dataStudyInfoAssignment[index]
                                                  .assignment_name
                                                  .isEmpty
                                              ? 'N/A'
                                              : _dataStudyInfoAssignment[index]
                                                  .assignment_name),
                                      buildDividerStDetail(),
                                      buildStudyDataAssign(
                                          'មុខវិជ្ជា',
                                          _dataStudyInfoAssignment[index]
                                                  .subject_name
                                                  .isEmpty
                                              ? 'N/A'
                                              : _dataStudyInfoAssignment[index]
                                                  .subject_name),
                                      buildDividerStDetail(),
                                      buildStudyDataAssign(
                                          'បន្ទប់',
                                          _dataStudyInfoAssignment[index]
                                                  .room_name
                                                  .isEmpty
                                              ? 'N/A'
                                              : _dataStudyInfoAssignment[index]
                                                  .room_name),
                                      buildDividerStDetail(),
                                      buildStudyDataAssign(
                                          'សាស្ត្រចារ្យ',
                                          _dataStudyInfoAssignment[index]
                                                  .lecturer_name
                                                  .isEmpty
                                              ? 'N/A'
                                              : _dataStudyInfoAssignment[index]
                                                  .lecturer_name),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
