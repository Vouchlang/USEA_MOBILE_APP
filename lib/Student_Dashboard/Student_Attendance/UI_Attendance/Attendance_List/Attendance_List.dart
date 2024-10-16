import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../Custom_AppBar.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../../Student_Other_Class/Class_Student_User.dart';
import '../../../Student_Performance/UI_Perfomance/Custom_Build_Performance.dart';
import '../../../Users_API.dart';
import '../../Class_Attendance/Class_Attendance.dart';
import '../Attendance_Detail/Attendance_Detail.dart';
import '../Attendance/Build_Custom_Attendance.dart';
import 'Build_Custom_Attendance_List.dart';

class AttendanceList extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  AttendanceList({
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late List<Attendances> attendances = [];
  late int selectedYearIndex = 0;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: attendances.isEmpty ? buildFutureBuilder() : buildAttListData(),
    );
  }

  Widget buildAttListData() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      color: UPrimaryColor,
      backgroundColor: UBackgroundColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(UPdMg5),
        shrinkWrap: true,
        children: [
          Container(
            alignment: Alignment.center,
            height: 70,
            width: UFullWidth,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: attendances.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildYearButton(
                  onTap: () => setState(
                    () => selectedYearIndex = index,
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  boxColor: selectedYearIndex == index ? UPrimaryColor : UBackgroundColor,
                  yearName: 'ឆ្នាំទី​ ${attendances[index].year_no}'.tr,
                  selectedColor: selectedYearIndex == index ? UBackgroundColor : UTextColor,
                );
              },
            ),
          ),
          buildAttListRow(),
          Column(
            children: attendances[selectedYearIndex]
                .semesters
                .map(
                  (year) => Column(
                    children: [
                      buildSemesterName(
                        width: MediaQuery.of(context).size.width,
                        semesterName: TitleTheme('ឆមាសទី ${year.semester_no}'.tr),
                      ),
                      buildHeight5(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: year.subjects
                            .map(
                              (subject) => buildAttListSubData(
                                onTap: () => Get.to(
                                  () => Attendance_Detail(
                                    subjectName: Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                                    subjectDate: subject.dates,
                                  ),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 100),
                                ),
                                subName: Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                                widgetCredit: buildCHText(subject.credit),
                                widgetHour: buildCHText(subject.hour),
                                widgetAl: buildNumAtt(
                                  text: subject.attendance_al,
                                  color: UYellowColor,
                                ),
                                widgetPm: buildNumAtt(
                                  text: subject.attendance_pm,
                                  color: UOrangeColor,
                                ),
                                widgetA: buildNumAtt(
                                  text: subject.attendance_a,
                                  color: URedColor,
                                ),
                                widgetPs: buildNumAtt(
                                  text: subject.attendance_ps,
                                  color: UScoreColor,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Future<void> _refreshData() async {
    try {
      final response = await http.post(
        Uri.parse(APIStAttendance),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        List<Attendances> attendanceList = [];

        jsonData['attendance_data']?.forEach((year, yearData) {
          List<Semester> semesters = [];

          yearData['semesters']?.forEach((semesterKey, semesterData) {
            List<Subject> subjects = [];

            semesterData['subjects']?.forEach((subjectData) {
              List<Dates> dates = [];

              subjectData['dates']?.forEach((dateData) {
                List<Sessions> sessions = [];

                dateData['sessions'].forEach((sessionData) {
                  Sessions sessionObj = Sessions(
                    date: sessionData['date'] ?? 'N/A',
                    session: sessionData['session'] ?? 'N/A',
                    session_all: sessionData['session_all'] ?? 'N/A',
                    absent_status: sessionData['absent_status'] ?? 'N/A',
                  );
                  sessions.add(sessionObj);
                });

                Dates dateObj = Dates(
                  date_name: dateData['date_name'] ?? 'N/A',
                  sessions: sessions,
                );
                dates.add(dateObj);
              });

              Subject subjectObj = Subject(
                id: subjectData['id'] ?? 'N/A',
                code: subjectData['code'] ?? 'N/A',
                name_kh: subjectData['name_kh'] ?? 'N/A',
                name_en: subjectData['name_en'] ?? 'N/A',
                hour: subjectData['hour'] ?? 'N/A',
                credit: subjectData['credit'] ?? 'N/A',
                attendance_a: subjectData['attendance_a'] ?? 'N/A',
                attendance_pm: subjectData['attendance_pm'] ?? 'N/A',
                attendance_al: subjectData['attendance_al'] ?? 'N/A',
                attendance_all: subjectData['attendance_all'] ?? 'N/A',
                attendance_ps: subjectData['attendance_ps'] ?? 'N/A',
                dates: dates,
              );

              subjects.add(subjectObj);
            });

            Semester semesterObj = Semester(
              semester_no: semesterData['semester_no'] ?? 'N/A',
              subjects: subjects,
            );

            semesters.add(semesterObj);
          });

          Attendances attendance = Attendances(
            year_no: year,
            semesters: semesters,
          );

          attendanceList.add(attendance);
        });

        setState(
          () => attendances = attendanceList,
        );
      } else {
        // Handle error case
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error case
      print('Failed to fetch attendance: $e');
    }
  }

  void selectYear(int index) {
    setState(
      () => selectedYearIndex = index,
    );
  }
}
