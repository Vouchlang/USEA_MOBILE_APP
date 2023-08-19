import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Student_Dashboard/Student_Attendance/UI_Attendance/Attendance_Detail.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Attendance/Class_Attendance.dart';
import 'Attendance_List.dart';

class Attendance extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  const Attendance({super.key, required this.data_studentUser});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late List<Attendances> attendances = [];
  int selectedYearIndex = 0;

  @override
  void initState() {
    super.initState();
    _refreshData();
    print(_displayLastSemesterSubjects);
  }

  Future<void> _refreshData() async {
    String apiUrl =
        'http://192.168.3.87/usea/api/apidata.php?action=attendance_data';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
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
      print('Error: $e');
    }
  }

  List<Attendances> _displayLastSemesterSubjects() {
    if (attendances.isNotEmpty) {
      final lastYearWithSemesters = attendances.last;

      if (lastYearWithSemesters.semesters.isNotEmpty) {
        final lastSemester = lastYearWithSemesters.semesters.last;

        if (lastSemester.subjects.isNotEmpty) {
          for (final subject in lastSemester.subjects) {
            print('Subject Name: ${subject.name_kh}');
            print('Subject Code: ${subject.code}');
          }
        } else {
          print('No subjects in the last semester of the last year.');
        }
      } else {
        print('No semesters in the last year.');
      }
    } else {
      print('No data available for attendance.');
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: USecondaryColor,
        appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
        body: attendances.isEmpty
            ? FutureBuilder(
                future: Future.delayed(Duration(seconds: 3)),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: Text('No Data'),
                    );
                  }
                },
              )
            : RefreshIndicator(
                onRefresh: _refreshData,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: UPdMg_10,
                    vertical: UPdMg_15,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 3, UPdMg_5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildAttList('វត្តមាន\t', UScoreColor),
                            buildAttList('យឺត', UYellowColor),
                            buildAttList('អវត្តមានមានច្បាប់', UOrangeColor),
                            buildAttList('អវត្តមាន', URedColor),
                          ],
                        ),
                      ),
                      _buildLastSemesterSubjects(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: UPdMg_5,
                              horizontal: UPdMg_10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(URoundedMedium),
                              color: UBtnColor,
                              boxShadow: [BoxShadow(color: UBtnColor)],
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(AttendanceList(
                                    data_studentUser: widget.data_studentUser));
                              },
                              child: CustomTextTheme(
                                text: 'មើលទាំងអស់'.tr,
                                color: UPrimaryColor,
                                fontWeight: UBodyWeight,
                                size: UBodySize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )));
  }

  Widget _buildLastSemesterSubjects() {
    if (attendances.isNotEmpty) {
      final lastYearWithSemesters = attendances.last;

      if (lastYearWithSemesters.semesters.isNotEmpty) {
        final lastSemester = lastYearWithSemesters.semesters.last;

        if (lastSemester.subjects.isNotEmpty) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lastSemester.subjects.length,
              itemBuilder: (BuildContext context, int index) {
                final subject = lastSemester.subjects[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(URoundedLarge),
                  ),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      UPdMg_10,
                      UPdMg_15,
                      UPdMg_15,
                      UPdMg_15,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Attendance_Detail(
                                subjectDate: subject.dates,
                                subjectName: subject.name_kh,
                              ),
                            ),
                          );
                        });
                      },
                      child: IntrinsicHeight(
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 165,
                                    child: Text(
                                      subject.name_kh,
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: UTitleSize,
                                        fontWeight: UTitleWeight,
                                        color: UTextColor,
                                        fontFamily: UKFontFamily,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      buildCHText(subject.credit.toString()),
                                      buildCHText('\tក្រេឌីត\t'.tr),
                                      buildCHText(subject.hour.toString()),
                                      buildCHText('\tម៉ោង'.tr),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              buildNum(subject.attendance_al, UYellowColor),
                              buildDivider(),
                              buildNum(subject.attendance_pm, UOrangeColor),
                              buildDivider(),
                              buildNum(subject.attendance_a, URedColor),
                              buildDivider(),
                              buildNum(subject.attendance_ps, UScoreColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: Text('No subjects in the last semester of the last year.'),
          );
        }
      } else {
        return Center(
          child: Text('No semesters in the last year.'),
        );
      }
    } else {
      return Center(
        child: Text('No data available for attendance.'),
      );
    }
  }
}
