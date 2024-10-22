import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Custom_AppBar.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../../Users_API.dart';
import '../../../Student_Other_Class/Class_Student_User.dart';
import '../../Class_Attendance/Class_Attendance.dart';
import '../Attendance_Detail/Attendance_Detail.dart';
import '../Attendance_List/Attendance_List.dart';
import 'Build_Custom_Attendance.dart';

class Attendance extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  const Attendance({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late List<Attendances> attendances = [];
  late List<StDetail> _dataStDetail = [];

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
      body: attendances.isEmpty
          ? buildFutureBuilder()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: UPdMg5),
                children: [
                  buildAttListRow(),
                  buildLastSemesterSubjects(),
                  buildAttReadAllBtn(
                    buildNavBtn(
                      onTap: () => Get.to(
                        () => AttendanceList(
                          data_studentUser: widget.data_studentUser,
                          sourceScreen: widget.sourceScreen,
                        ),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 100),
                      ),
                      text: 'មើលទាំងអស់',
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildLastSemesterSubjects() {
    if (attendances.isNotEmpty) {
      // Filter the attendances list to get only the desired year and semester
      final filteredYear = attendances.firstWhere(
        (year) => year.year_no == _dataStDetail[0].year_name,
        orElse: () => Attendances(
          year_no: _dataStDetail[0].year_name,
          semesters: [],
        ),
      );

      if (filteredYear.semesters.isNotEmpty) {
        final filteredSemester = filteredYear.semesters.firstWhere(
          (semester) => semester.semester_no == _dataStDetail[0].semester_name,
          orElse: () => Semester(
            semester_no: _dataStDetail[0].semester_name,
            subjects: [],
          ),
        );

        if (filteredSemester.subjects.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredSemester.subjects.length,
            itemBuilder: (context, index) {
              final subject = filteredSemester.subjects[index];

              return Stack(
                children: [
                  buildAttListSubData(
                    onTap: () => Get.to(
                      () => Attendance_Detail(
                        subjectDate: subject.dates,
                        subjectName: Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                      ),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 100),
                    ),
                    subName: Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                    widgetCredit: buildCHText(subject.credit.toString()),
                    widgetHour: buildCHText(subject.hour.toString()),
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
                  //Re Study Status
                  // Positioned(
                  //   right: 12,
                  //   top: UHeight7,
                  //   child: Container(
                  //     width: UWidth7,
                  //     height: UWidth7,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(
                  //         URoundedLarge,
                  //       ),
                  //       color: subject.credit.toString() != '3'
                  //           ? URedColor
                  //           : UTransParentColor,
                  //     ),
                  //   ),
                  // ),
                ],
              );
            },
          );
        } else {
          return buildErrorAttSubject();
        }
      } else {
        return buildErrorAttSemester();
      }
    } else {
      return buildErrorAtt();
    }
  }

  Future<void> _refreshData() async {
    try {
      final response = await http.post(
        Uri.parse(
          APIStAttendance,
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      var responseDetail = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      if (response.statusCode == 200 && responseDetail.statusCode == 200) {
        var data = jsonDecode(responseDetail.body);
        if (mounted) {
          setState(
            () => _dataStDetail = List<StDetail>.from(
              data['user_data'].map(
                (data) => StDetail.fromJson(data),
              ),
            ),
          );
        }

        //Student Att
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
}
