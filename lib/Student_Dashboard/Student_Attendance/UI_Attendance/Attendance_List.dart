import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Attendance/Class_Attendance.dart';
import 'Attendance_Detail.dart';

class AttendanceList extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  AttendanceList({required this.data_studentUser});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late List<Attendances> attendances = [];
  int selectedYearIndex = 0;

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

  void selectYear(int index) {
    setState(() {
      selectedYearIndex = index;
    });
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
              child: Padding(
                padding: EdgeInsets.all(
                  UPdMg5,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: UFullWidth,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: attendances.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final isLastIndex = index == attendances.length - 1;

                            return GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    selectedYearIndex = index;
                                  },
                                );
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                margin: EdgeInsets.fromLTRB(
                                  UPdMg10,
                                  UPdMg10,
                                  isLastIndex ? UPdMg10 : UZeroPixel,
                                  UPdMg10,
                                ),
                                padding: EdgeInsets.all(
                                  UPdMg10,
                                ),
                                width: 120,
                                decoration: BoxDecoration(
                                  color: selectedYearIndex == index
                                      ? UPrimaryColor
                                      : UBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    URoundedMedium,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: ULightGreyColor,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'ឆ្នាំទី​ ${attendances[index].year_no}'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: UTitleSize,
                                    color: selectedYearIndex == index
                                        ? UBackgroundColor
                                        : UTextColor,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: UHeight5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: UPdMg10,
                        vertical: UPdMg5,
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
                    Column(
                      children: attendances[selectedYearIndex]
                          .semesters
                          .map(
                            (year) => Column(
                              children: [
                                SizedBox(
                                  height: UHeight10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    UPdMg5,
                                  ),
                                  child: Center(
                                    child: TitleTheme(
                                      'ឆមាសទី ${year.semester_no}'.tr,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: UHeight5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: year.subjects
                                      .map(
                                        (subject) => Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              URoundedLarge,
                                            ),
                                          ),
                                          elevation: 1,
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                              UPdMg10,
                                              UPdMg15,
                                              UPdMg15,
                                              UPdMg15,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => Attendance_Detail(
                                                    subjectName: Get.locale
                                                                ?.languageCode ==
                                                            'km'
                                                        ? subject.name_kh
                                                        : subject.name_en,
                                                    subjectDate: subject.dates,
                                                  ),
                                                  transition: Transition
                                                      .rightToLeftWithFade,
                                                  duration: Duration(
                                                    milliseconds: 100,
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 165,
                                                        child: Text(
                                                          Get.locale?.languageCode ==
                                                                  'km'
                                                              ? subject.name_kh
                                                              : subject.name_en,
                                                          style: TextStyle(
                                                            height: 1.5,
                                                            fontSize:
                                                                UTitleSize,
                                                            fontWeight:
                                                                UTitleWeight,
                                                            color: UTextColor,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          buildCHText(
                                                            subject.credit,
                                                          ),
                                                          buildCHText(
                                                            '\tក្រេឌីត\t'.tr,
                                                          ),
                                                          buildCHText(
                                                            subject.hour,
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
              ),
            ),
    );
  }
}
