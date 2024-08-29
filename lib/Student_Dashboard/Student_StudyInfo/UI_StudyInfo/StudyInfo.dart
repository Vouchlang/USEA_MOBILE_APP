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
  final String sourceScreen;

  const Study_Info({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  bool isLoading = false;
  late List<StudyInfoData> _dataStudyInfo = [];

  // ignore: unused_field
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
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlStudent + 'action=exam_schedule'
              : APIUrlStudentEn + 'action=exam_schedule',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );
      var response_assignment = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlStudent + 'action=moodle_activities'
              : APIUrlStudentEn + 'action=moodle_activities',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
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
      print('Failed to fetch studt info: $error');
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
      appBar: Custom_AppBar(
        title: 'ព័ត៌មានការសិក្សា'.tr,
      ),
      body: _dataStudyInfo.isEmpty
          //  _dataStudyInfo.isEmpty && _dataStudyInfoAssignment.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _dataStudyInfo.isEmpty
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(
                            UPdMg10,
                            UPdMg15,
                            UPdMg10,
                            UZeroPixel,
                          ),
                          child: Text(
                            'ព័ត៌មានការប្រឡង'.tr,
                            style: const TextStyle(
                              color: UPrimaryColor,
                              fontSize: UTitleSize,
                              fontWeight: UTitleWeight,
                              height: UTextHeight,
                            ),
                          ),
                        ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(
                      UPdMg5,
                    ),
                    itemCount: _dataStudyInfo.length,
                    itemBuilder: (BuildContext context, index) {
                      final isLastIndex = index == _dataStudyInfo.length - 1;
                      return Card(
                        elevation: 0.5,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: UBackgroundColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(
                            URoundedLarge,
                          ),
                        ),
                        color: UBackgroundColor,
                        margin: EdgeInsets.fromLTRB(
                          UPdMg5,
                          isLastIndex ? UPdMg5 : UZeroPixel,
                          UPdMg5,
                          UPdMg10,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: UPdMg15,
                                  horizontal: UPdMg10,
                                ),
                                width: UFullWidth,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      URoundedLarge,
                                    ),
                                    topRight: Radius.circular(
                                      URoundedLarge,
                                    ),
                                  ),
                                  color: UBGLightBlue,
                                ),
                                child: Text(
                                  _dataStudyInfo[index].title,
                                  style: const TextStyle(
                                    fontSize: UTitleSize16,
                                    fontWeight: UTitleWeight,
                                    color: UPrimaryColor,
                                    height: UTextHeight,
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.all(
                                    UPdMg10,
                                  ),
                                  child: Row(
                                    children: [
                                      IntrinsicHeight(
                                        child: Container(
                                          width: 55,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              NormalDateStudyInfo(
                                                _dataStudyInfo[index].month,
                                              ),
                                              buildDividerAtt(),
                                              NormalDateStudyInfo(
                                                _dataStudyInfo[index].date,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      buildVerticalDividerAtt(),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: UPdMg8,
                                        ),
                                        child: IntrinsicWidth(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                                      'ដកបេក្ខភាព'.tr,
                                                      style: TextStyle(
                                                        fontSize: UBodySize,
                                                        fontWeight:
                                                            UTitleWeight,
                                                        color: URedColor,
                                                        fontFamily: Get.locale
                                                                    ?.languageCode ==
                                                                'km'
                                                            ? UKFontFamily
                                                            : UEFontFamily,
                                                        height: UTextHeight,
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // _dataStudyInfoAssignment.isEmpty
                  //     ? SizedBox.shrink()
                  //     : Padding(
                  //         padding: EdgeInsets.fromLTRB(
                  //           UPdMg10,
                  //           UPdMg10,
                  //           UPdMg10,
                  //           UZeroPixel,
                  //         ),
                  //         child: Text(
                  //           'កិច្ចការផ្ទះ និងស្រាវជ្រាវ\t (Not Available)'.tr,
                  //           style: TextStyle(
                  //             color: UPrimaryColor,
                  //             fontSize: UTitleSize,
                  //             fontWeight: UTitleWeight,
                  //           ),
                  //         ),
                  //       ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   padding: EdgeInsets.all(
                  //     UPdMg5,
                  //   ),
                  //   itemCount: _dataStudyInfoAssignment.length,
                  //   itemBuilder: (BuildContext context, index) {
                  //     final isLastIndex =
                  //         index == _dataStudyInfoAssignment.length - 1;
                  //     return Card(
                  //       elevation: 2,
                  //       shadowColor: ULightGreyColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(
                  //           URoundedLarge,
                  //         ),
                  //       ),
                  //       margin: isLastIndex
                  //           ? EdgeInsets.fromLTRB(
                  //               UPdMg5,
                  //               UPdMg5,
                  //               UPdMg5,
                  //               UPdMg10,
                  //             )
                  //           : EdgeInsets.all(
                  //               UPdMg5,
                  //             ),
                  //       child: Padding(
                  //         padding: EdgeInsets.all(
                  //           UPdMg10,
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Flexible(
                  //                   flex: 2,
                  //                   child: Text(
                  //                     _dataStudyInfoAssignment[index]
                  //                             .expire_date
                  //                             .isEmpty
                  //                         ? 'ថ្ងៃផុតកំណត់៖ '.tr + 'N/A'
                  //                         : 'ថ្ងៃផុតកំណត់៖ '.tr +
                  //                             _dataStudyInfoAssignment[index]
                  //                                 .expire_date,
                  //                     style: TextStyle(
                  //                       fontSize: UTitleSize,
                  //                       fontWeight: UTitleWeight,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   width: UWidth15,
                  //                 ),
                  //                 Flexible(
                  //                   flex: 1,
                  //                   child: Text(
                  //                     _dataStudyInfoAssignment[index]
                  //                             .expire_time
                  //                             .isEmpty
                  //                         ? 'ម៉ោង '.tr + 'N/A'
                  //                         : 'ម៉ោង '.tr +
                  //                             _dataStudyInfoAssignment[index]
                  //                                 .expire_time,
                  //                     style: TextStyle(
                  //                       fontSize: UTitleSize,
                  //                       fontWeight: UTitleWeight,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Divider(),
                  //             buildStudyDataAssign(
                  //               'ឈ្មោះ',
                  //               _dataStudyInfoAssignment[index]
                  //                       .assignment_name
                  //                       .isEmpty
                  //                   ? 'N/A'
                  //                   : _dataStudyInfoAssignment[index]
                  //                       .assignment_name,
                  //             ),
                  //             Divider(),
                  //             buildStudyDataAssign(
                  //               'មុខវិជ្ជា',
                  //               _dataStudyInfoAssignment[index]
                  //                       .subject_name
                  //                       .isEmpty
                  //                   ? 'N/A'
                  //                   : _dataStudyInfoAssignment[index]
                  //                       .subject_name,
                  //             ),
                  //             Divider(),
                  //             buildStudyDataAssign(
                  //               'បន្ទប់',
                  //               _dataStudyInfoAssignment[index]
                  //                       .room_name
                  //                       .isEmpty
                  //                   ? 'N/A'
                  //                   : _dataStudyInfoAssignment[index]
                  //                       .room_name,
                  //             ),
                  //             Divider(),
                  //             buildStudyDataAssign(
                  //               'សាស្ត្រចារ្យ',
                  //               _dataStudyInfoAssignment[index]
                  //                       .lecturer_name
                  //                       .isEmpty
                  //                   ? 'N/A'
                  //                   : _dataStudyInfoAssignment[index]
                  //                       .lecturer_name,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
    );
  }
}
