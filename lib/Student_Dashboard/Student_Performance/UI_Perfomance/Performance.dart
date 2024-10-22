import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Users_API.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Performance/Class_Performance.dart';
import 'Custom_Build_Dialog_Performance.dart';
import 'Custom_Build_Performance.dart';

class Performance extends StatefulWidget {
  late final List<StudentUser> data_studentUser;
  late final String sourceScreen;

  Performance({
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  late List<Performance_Class> performances = [];
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
      appBar: Custom_AppBar(title: 'ដំណើរការសិក្សា'.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: UPrimaryColor,
        backgroundColor: UBackgroundColor,
        child: Container(
          alignment: Alignment.topCenter,
          child: performances.isEmpty
              ? buildFutureBuilder()
              : RefreshIndicator(
                  onRefresh: _refreshData,
                  color: UPrimaryColor,
                  backgroundColor: UBackgroundColor,
                  child: buildPerformanceBody(),
                ),
        ),
      ),
    );
  }

  Widget buildPerformanceBody() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        buildHeight5(),
        Container(
          height: 70,
          alignment: Alignment.center,
          width: UFullWidth,
          padding: const EdgeInsets.symmetric(horizontal: UPdMg5),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: performances.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildYearButton(
                onTap: () => setState(
                  () => selectedYearIndex = index,
                ),
                width: MediaQuery.of(context).size.width / 3,
                boxColor: selectedYearIndex == index ? UPrimaryColor : UBackgroundColor,
                yearName: 'ឆ្នាំទី​ ${performances[index].yearNo}'.tr,
                selectedColor: selectedYearIndex == index ? UBackgroundColor : UTextColor,
              );
            },
          ),
        ),
        performances[selectedYearIndex].semesters.isNotEmpty
            ? Column(
                children: performances[selectedYearIndex].semesters.map((semester) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: UPdMg5),
                    child: Card(
                      elevation: 0.5,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: UBackgroundColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(URoundedLarge),
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        UPdMg10,
                        UZeroPixel,
                        UPdMg10,
                        UPdMg7,
                      ),
                      color: UBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildRowTitleCard(
                            semester: 'ឆមាសទី ${semester.semesterNo}'.tr,
                            attWidget: buildRowTitleContainer(
                              width: 110,
                              text: 'វត្តមាន'.tr,
                              align: Alignment.centerRight,
                            ),
                            scoreWidget: buildRowTitleContainer(
                              width: 65,
                              text: 'ពិន្ទុ'.tr,
                              align: Alignment.centerLeft,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(UPdMg10),
                            margin: const EdgeInsets.only(bottom: UPdMg10),
                            width: UFullWidth,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...semester.subjects.map(
                                  (subject) {
                                    final pscore_total = subject.pscore_total.toString() == 'N/A' ? 'N/A' : double.parse(subject.pscore_total.toString());
                                    return IntrinsicHeight(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildSubjectData(
                                            Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              buildAttData(
                                                onTap: () => showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) => Dialog(
                                                    elevation: 5,
                                                    backgroundColor: UBackgroundColor,
                                                    insetPadding: const EdgeInsets.all(UPdMg10),
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(URoundedLarge),
                                                      ),
                                                    ),
                                                    child: SingleChildScrollView(
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              buildDialogSubjectName(
                                                                Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                                                              ),
                                                              buildHeight5(),
                                                              Container(
                                                                padding: const EdgeInsets.all(UPdMg10),
                                                                width: UFullWidth,
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: subject.attendances.asMap().entries.map((att) {
                                                                    final attendance = att.value;
                                                                    return buildAttDialogData(
                                                                      attTitle: attendance.title,
                                                                      attAl: CustomPerformanceDiaglogTextThemeBold(
                                                                        text: attendance.attendance_al,
                                                                        size: UTitleSize,
                                                                        color: UYellowColor,
                                                                      ),
                                                                      attPm: CustomPerformanceDiaglogTextThemeBold(
                                                                        text: attendance.attendance_pm,
                                                                        size: UTitleSize,
                                                                        color: UOrangeColor,
                                                                      ),
                                                                      attAb: CustomPerformanceDiaglogTextThemeBold(
                                                                        text: attendance.attendance_a,
                                                                        size: UTitleSize,
                                                                        color: URedColor,
                                                                      ),
                                                                      attPs: CustomPerformanceDiaglogTextThemeBold(
                                                                        text: attendance.attendance_ps,
                                                                        size: UTitleSize,
                                                                        color: UScoreColor,
                                                                      ),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          buildCloseImgPosition(
                                                            () => Get.back(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                attData: subject.attendance_ps,
                                              ),
                                              const VerticalDivider(
                                                color: UGreyColor,
                                                thickness: 0.5,
                                                width: UZeroPixel,
                                              ),
                                              buildScoreData(
                                                onTap: () => showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (BuildContext context) {
                                                    return Dialog(
                                                      elevation: 5,
                                                      backgroundColor: UBackgroundColor,
                                                      insetPadding: const EdgeInsets.all(UPdMg10),
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(URoundedLarge),
                                                        ),
                                                      ),
                                                      child: SingleChildScrollView(
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                buildDialogSubjectName(
                                                                  Get.locale?.languageCode == 'km' ? subject.name_kh : subject.name_en,
                                                                ),
                                                                buildHeight5(),
                                                                Container(
                                                                  padding: const EdgeInsets.symmetric(
                                                                    vertical: UPdMg5,
                                                                    horizontal: UPdMg10,
                                                                  ),
                                                                  width: UFullWidth,
                                                                  child: Container(
                                                                    padding: const EdgeInsets.symmetric(vertical: UPdMg5),
                                                                    child: Column(
                                                                      children: subject.scores.asMap().entries.map((entry) {
                                                                        final int index = entry.key;
                                                                        final score = entry.value;
                                                                        final double marginBottom = (index == subject.scores.length - 1) ? UPdMg5 : UPdMg15;
                                                                        return IntrinsicHeight(
                                                                          child: buildScoreDialogData(
                                                                            scoreTitle: score.title,
                                                                            marginBottom: marginBottom,
                                                                            numAtt: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.number_attendance,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            numAssign: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.number_assignment,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            numMid: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.number_mid_term,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            numFinal: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.number_final,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            scoreAtt: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.score_attendance,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            scoreAssign: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.score_assignment,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            scoreMid: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.score_mid_term,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                            scoreFinal: CustomPerformanceDiaglogTextTheme(
                                                                              text: score.score_final,
                                                                              size: UTitleSize,
                                                                              fontWeight: UBodyWeight,
                                                                              color: UScoreColor,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            buildCloseImgPosition(
                                                              () => Get.back(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                borderColor: pscore_total.toString() == 'N/A'
                                                    ? UScoreColor
                                                    : double.parse(pscore_total.toString()) > 49
                                                        ? UScoreColor
                                                        : URedColor,
                                                score: subject.pscore_total.toString(),
                                                scoreColor: pscore_total.toString() == 'N/A'
                                                    ? UScoreColor
                                                    : double.parse(pscore_total.toString()) > 49
                                                        ? UScoreColor
                                                        : URedColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ],
                            ),
                          ),
                          buildBottomCard(
                            keyName: 'មធ្យមភាគ'.tr,
                            value: semester.average,
                          ),
                          buildBottomCard(
                            keyName: 'ពិន្ទុមធ្យមភាគ'.tr,
                            value: semester.gpa,
                          ),
                          buildBottomCard(
                            keyName: 'និទ្ទេស'.tr,
                            value: semester.grade,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            : buildFutureBuilder()
      ],
    );
  }

  Future<void> _refreshData() async {
    try {
      final response = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIStPerformanceKh : APIStPerformanceEn,
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Performance_Class> performanceList = [];

        data['study_performance_data'].forEach((year, yearData) {
          List<Semester> semesters = [];

          yearData['semesters'].forEach((semesterKey, semesterData) {
            List<Subject> subjects = [];

            semesterData['subjects'].forEach((subjectData) {
              List<Attendances> attendances = [];
              List<Scores> scores = [];

              subjectData['attendances'].forEach((attendancesData) {
                Attendances attendancesObj = Attendances(
                  title: attendancesData['title'] ?? 'N/A',
                  attendance_a: attendancesData['attendance_a'] ?? 'N/A',
                  attendance_al: attendancesData['attendance_al'] ?? 'N/A',
                  attendance_pm: attendancesData['attendance_pm'] ?? 'N/A',
                  attendance_ps: attendancesData['attendance_ps'] ?? 'N/A',
                  attendance_all: attendancesData['attendance_all'] ?? 'N/A',
                );

                attendances.add(attendancesObj);
              });

              subjectData['scores'].forEach((scoresData) {
                Scores scoresObj = Scores(
                  title: scoresData['title'] ?? 'N/A',
                  score_attendance: scoresData['score_attendance'] ?? 'N/A',
                  score_assignment: scoresData['score_assignment'] ?? 'N/A',
                  score_mid_term: scoresData['score_mid_term'] ?? 'N/A',
                  score_final: scoresData['score_final'] ?? 'N/A',
                  number_attendance: scoresData['number_attendance'] ?? 'N/A',
                  number_assignment: scoresData['number_assignment'] ?? 'N/A',
                  number_mid_term: scoresData['number_mid_term'] ?? 'N/A',
                  number_final: scoresData['number_final'] ?? 'N/A',
                );

                scores.add(scoresObj);
              });

              Subject subjectObj = Subject(
                id: subjectData['id'] ?? 'N/A',
                name_kh: subjectData['name_kh'] ?? 'N/A',
                name_en: subjectData['name_en'] ?? 'N/A',
                pscore_total: subjectData['pscore_total'] ?? 'N/A',
                attendance_ps: subjectData['attendance_ps'] ?? 'N/A',
                attendances: attendances,
                scores: scores,
              );

              subjects.add(subjectObj);
            });

            Semester semesterObj = Semester(
              semesterNo: semesterData['semester_no'] ?? 'N/A',
              average: semesterData['average'] ?? 'N/A',
              gpa: semesterData['gpa'] ?? 'N/A',
              grade: semesterData['grade'] ?? 'N/A',
              meaning: semesterData['meaning'] ?? 'N/A',
              subjects: subjects,
            );

            semesters.add(semesterObj);
          });

          Performance_Class performance = Performance_Class(
            yearNo: yearData['year_no'] ?? 'N/A',
            semesters: semesters,
          );

          performanceList.add(performance);
        });
        setState(() {
          performances = performanceList;
        });
      } else {
        // Handle error case
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error case
      print('Failed to fetch performance: $e');
    }
  }

  void selectYear(int index) {
    setState(() {
      selectedYearIndex = index;
    });
  }
}
