import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_Attendance/UI_Attendance/Attendance_Detail.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Attendance/Class_Attendance.dart';
import 'Attendance_List.dart';

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

  Future<void> _refreshData() async {
    try {
      final response = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=attendance_data',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );

      var responseDetail = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=login_student',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );

      if (response.statusCode == 200 && responseDetail.statusCode == 200) {
        var data = jsonDecode(responseDetail.body);
        if (mounted) {
          setState(() {
            _dataStDetail = List<StDetail>.from(
              data['user_data'].map(
                (data) => StDetail.fromJson(data),
              ),
            );
          });
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

        setState(() {
          attendances = attendanceList;
        });
      } else {
        // Handle error case
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error case
      print('Failed to fetch attendance: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'វត្តមាន'.tr,
      ),
      body: attendances.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: UPdMg5,
                  vertical: UPdMg15,
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        UPdMg5,
                        UZeroPixel,
                        UPdMg5,
                        UPdMg5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildAttList(
                            'យឺត',
                            UYellowColor,
                          ),
                          buildAttList(
                            'សុំច្បាប់',
                            UOrangeColor,
                          ),
                          buildAttList(
                            'អវត្តមាន',
                            URedColor,
                          ),
                          buildAttList(
                            'វត្តមាន\t',
                            UScoreColor,
                          ),
                        ],
                      ),
                    ),
                    _buildLastSemesterSubjects(),
                    SizedBox(
                      height: UHeight10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            Get.to(
                              () => AttendanceList(
                                data_studentUser: widget.data_studentUser,
                                sourceScreen: widget.sourceScreen,
                              ),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(
                                milliseconds: 100,
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              right: UPdMg5,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: UPdMg5,
                              horizontal: UPdMg10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                URoundedMedium,
                              ),
                              color: UBtnColor,
                              boxShadow: [
                                BoxShadow(
                                  color: UBtnColor,
                                ),
                              ],
                            ),
                            child: CustomTextTheme(
                              'មើលទាំងអស់'.tr,
                              UBodySize,
                              UPrimaryColor,
                              UBodyWeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildLastSemesterSubjects() {
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
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredSemester.subjects.length,
              itemBuilder: (BuildContext context, int index) {
                final subject = filteredSemester.subjects[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      URoundedLarge,
                    ),
                  ),
                  elevation: 1,
                  child: InkWell(
                    highlightColor: UTransParentColor,
                    splashColor: UTransParentColor,
                    onTap: () {
                      setState(
                        () {
                          Get.to(
                            () => Attendance_Detail(
                              subjectDate: subject.dates,
                              subjectName: Get.locale?.languageCode == 'km'
                                  ? subject.name_kh
                                  : subject.name_en,
                            ),
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(
                              milliseconds: 100,
                            ),
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        UPdMg10,
                        UPdMg15,
                        UPdMg15,
                        UPdMg15,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 165,
                                  child: Text(
                                    Get.locale?.languageCode == 'km'
                                        ? subject.name_kh
                                        : subject.name_en,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: UTitleSize,
                                      fontWeight: UTitleWeight,
                                      color: UTextColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: UHeight5,
                                ),
                                Row(
                                  children: [
                                    buildCHText(
                                      subject.credit.toString(),
                                    ),
                                    buildCHText(
                                      '\tក្រេឌីត\t'.tr,
                                    ),
                                    buildCHText(
                                      subject.hour.toString(),
                                    ),
                                    buildCHText(
                                      '\tម៉ោង'.tr,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: UWidth5,
                            ),
                            buildNumAtt(
                              subject.attendance_al,
                              UYellowColor,
                            ),
                            buildDivider(),
                            buildNumAtt(
                              subject.attendance_pm,
                              UOrangeColor,
                            ),
                            buildDivider(),
                            buildNumAtt(
                              subject.attendance_a,
                              URedColor,
                            ),
                            buildDivider(),
                            buildNumAtt(
                              subject.attendance_ps,
                              UScoreColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: Text(
              'No subjects in the last semester of the last year.',
            ),
          );
        }
      } else {
        return Center(
          child: Text(
            'No semesters in the last year.',
          ),
        );
      }
    } else {
      return Center(
        child: Text(
          'No data available for attendance.',
        ),
      );
    }
  }
}
