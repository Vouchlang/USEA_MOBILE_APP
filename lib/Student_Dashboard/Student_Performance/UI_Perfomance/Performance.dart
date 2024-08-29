import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Performance/Class_Performance.dart';

class Performance extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  Performance({
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  late List<Performance_Class> performances = [];
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
          Get.locale?.languageCode == 'km'
              ? APIUrlStudent + 'action=study_performance'
              : APIUrlStudentEn + 'action=study_performance',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ដំណើរការសិក្សា'.tr,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: UPrimaryColor,
        child: Container(
          alignment: Alignment.topCenter,
          child: performances.isEmpty
              ? buildFutureBuild()
              : RefreshIndicator(
                  onRefresh: _refreshData,
                  color: UPrimaryColor,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      buildHeight5(),
                      Container(
                        height: 70,
                        alignment: Alignment.center,
                        width: UFullWidth,
                        padding: const EdgeInsets.symmetric(
                          horizontal: UPdMg5,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: performances.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final isLastIndex =
                                index == performances.length - 1;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedYearIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                margin: EdgeInsets.fromLTRB(
                                  UPdMg5,
                                  UPdMg10,
                                  isLastIndex ? UPdMg5 : UPdMg5,
                                  UPdMg10,
                                ),
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  color: selectedYearIndex == index
                                      ? UPrimaryColor
                                      : UBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    URoundedMedium,
                                  ),
                                  boxShadow: [
                                    const BoxShadow(
                                      blurRadius: 1,
                                      color: ULightGreyColor,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'ឆ្នាំទី​ ${performances[index].yearNo}'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: UTitleSize,
                                    fontWeight: UTitleWeight,
                                    color: selectedYearIndex == index
                                        ? UBackgroundColor
                                        : UTextColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      performances[selectedYearIndex].semesters.isNotEmpty
                          ? Column(
                              children: performances[selectedYearIndex]
                                  .semesters
                                  .map((semester) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                    bottom: UPdMg5,
                                  ),
                                  child: Card(
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
                                        Container(
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
                                          child: IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'ឆមាសទី ${semester.semesterNo}'
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: UPrimaryColor,
                                                    fontSize: UTitleSize,
                                                    fontWeight: UTitleWeight,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    buildTitleContainer(
                                                      110,
                                                      'វត្តមាន'.tr,
                                                      Alignment.centerRight,
                                                    ),
                                                    const VerticalDivider(
                                                      color: UGreyColor,
                                                      thickness: 0.5,
                                                      width: UZeroPixel,
                                                    ),
                                                    buildTitleContainer(
                                                      65,
                                                      'ពិន្ទុ'.tr,
                                                      Alignment.centerLeft,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(
                                            UPdMg10,
                                          ),
                                          width: UFullWidth,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ...semester.subjects.map(
                                                (subject) {
                                                  final pscore_total = subject
                                                              .pscore_total
                                                              .toString() ==
                                                          'N/A'
                                                      ? 'N/A'
                                                      : double.parse(subject
                                                          .pscore_total
                                                          .toString());
                                                  return IntrinsicHeight(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              right: UPdMg15,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: UPdMg10,
                                                            ),
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              Get.locale?.languageCode ==
                                                                      'km'
                                                                  ? subject
                                                                      .name_kh
                                                                  : subject
                                                                      .name_en,
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    UTextColor,
                                                                fontSize:
                                                                    UTitleSize,
                                                                height:
                                                                    UTextHeight,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: UWidth50,
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical:
                                                                    UPdMg10,
                                                              ),
                                                              child: InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                splashColor: Colors
                                                                    .transparent,
                                                                onTap: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            5,
                                                                        backgroundColor:
                                                                            UBackgroundColor,
                                                                        insetPadding:
                                                                            const EdgeInsets.all(
                                                                          UPdMg10,
                                                                        ),
                                                                        shape:
                                                                            const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(
                                                                              URoundedLarge,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(
                                                                                      UPdMg10,
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
                                                                                    child: Container(
                                                                                      margin: const EdgeInsets.only(
                                                                                        right: 50,
                                                                                      ),
                                                                                      child: Text(
                                                                                        subject.name_en.tr,
                                                                                        style: const TextStyle(
                                                                                          fontSize: UTitleSize,
                                                                                          fontWeight: UTitleWeight,
                                                                                          color: UPrimaryColor,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  buildHeight5(),
                                                                                  Container(
                                                                                    padding: const EdgeInsets.all(
                                                                                      UPdMg10,
                                                                                    ),
                                                                                    width: UFullWidth,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: subject.attendances.asMap().entries.map((att) {
                                                                                        final attendance = att.value;
                                                                                        return Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              alignment: Alignment.centerLeft,
                                                                                              child: CustomPerformanceDiaglogTextThemeTitle(
                                                                                                attendance.title,
                                                                                                UTitleSize,
                                                                                                UPrimaryColor,
                                                                                              ),
                                                                                            ),
                                                                                            IntrinsicHeight(
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Row(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'យឺត'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextThemeBold(
                                                                                                        attendance.attendance_al,
                                                                                                        UTitleSize,
                                                                                                        UYellowColor,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'សុំច្បាប់'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextThemeBold(
                                                                                                        attendance.attendance_pm,
                                                                                                        UTitleSize,
                                                                                                        UOrangeColor,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'អវត្តមាន'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextThemeBold(
                                                                                                        attendance.attendance_a,
                                                                                                        UTitleSize,
                                                                                                        URedColor,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'វត្តមាន'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextThemeBold(
                                                                                                        attendance.attendance_ps,
                                                                                                        UTitleSize,
                                                                                                        UScoreColor,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Container(
                                                                                                    margin: const EdgeInsets.only(
                                                                                                      bottom: 5,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      }).toList(),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Positioned(
                                                                                right: UZeroPixel,
                                                                                top: UZeroPixel,
                                                                                height: UHeight40,
                                                                                width: UWidth50,
                                                                                child: InkWell(
                                                                                  highlightColor: UTransParentColor,
                                                                                  splashColor: UTransParentColor,
                                                                                  onTap: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    imageAsset + 'close.png',
                                                                                    scale: UScale10,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                    UPdMg5,
                                                                    UZeroPixel,
                                                                    UPdMg5,
                                                                    UZeroPixel,
                                                                  ),
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        color:
                                                                            UScoreColor,
                                                                        width:
                                                                            0.75,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    subject
                                                                        .attendance_ps,
                                                                    style:
                                                                        const TextStyle(
                                                                      color:
                                                                          UScoreColor,
                                                                      fontSize:
                                                                          UTitleSize,
                                                                      fontWeight:
                                                                          UBodyWeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const VerticalDivider(
                                                              color: UGreyColor,
                                                              thickness: 0.5,
                                                              width: UZeroPixel,
                                                            ),
                                                            Container(
                                                              width: 65,
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical:
                                                                    UPdMg10,
                                                              ),
                                                              child: InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                splashColor: Colors
                                                                    .transparent,
                                                                onTap: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            5,
                                                                        backgroundColor:
                                                                            UBackgroundColor,
                                                                        insetPadding:
                                                                            const EdgeInsets.all(
                                                                          UPdMg10,
                                                                        ),
                                                                        shape:
                                                                            const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(
                                                                              URoundedLarge,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    padding: const EdgeInsets.all(
                                                                                      UPdMg10,
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
                                                                                    child: Container(
                                                                                      margin: const EdgeInsets.only(
                                                                                        right: 50,
                                                                                      ),
                                                                                      child: Text(
                                                                                        subject.name_en,
                                                                                        style: const TextStyle(
                                                                                          fontSize: UTitleSize,
                                                                                          fontWeight: UTitleWeight,
                                                                                          color: UPrimaryColor,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  buildHeight5(),
                                                                                  Container(
                                                                                    padding: const EdgeInsets.symmetric(
                                                                                      vertical: UPdMg5,
                                                                                      horizontal: UPdMg10,
                                                                                    ),
                                                                                    width: UFullWidth,
                                                                                    child: Container(
                                                                                      padding: const EdgeInsets.symmetric(
                                                                                        vertical: UPdMg5,
                                                                                      ),
                                                                                      child: Column(
                                                                                        children: subject.scores.asMap().entries.map((entry) {
                                                                                          final int index = entry.key;
                                                                                          final score = entry.value;
                                                                                          final double marginBottom = (index == subject.scores.length - 1) ? UPdMg5 : UPdMg15;
                                                                                          return IntrinsicHeight(
                                                                                            child: Column(
                                                                                              children: [
                                                                                                Container(
                                                                                                  alignment: Alignment.centerLeft,
                                                                                                  child: CustomPerformanceDiaglogTextThemeTitle(
                                                                                                    score.title,
                                                                                                    UTitleSize,
                                                                                                    UPrimaryColor,
                                                                                                  ),
                                                                                                ),
                                                                                                SingleChildScrollView(
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          CustomPerformanceDiaglogTextThemeTitle(
                                                                                                            'លក្ខណៈវិនិច្ឆ័យ'.tr,
                                                                                                            UTitleSize,
                                                                                                            UPrimaryColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            'វត្តមាន'.tr,
                                                                                                            UTitleSize,
                                                                                                            UTextColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            'កិច្ចការផ្ទះ និងស្រាវជ្រាវ'.tr,
                                                                                                            UTitleSize,
                                                                                                            UTextColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            'ប្រលងពាក់កណ្ដាលឆមាស'.tr,
                                                                                                            UTitleSize,
                                                                                                            UTextColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            'ប្រលងបញ្ចប់ឆមាស'.tr,
                                                                                                            UTitleSize,
                                                                                                            UTextColor,
                                                                                                          ),
                                                                                                          //Average Score Blank
                                                                                                          // CustomPerformanceDiaglogTextTheme(
                                                                                                          //   ''.tr,
                                                                                                          //   UTitleSize,
                                                                                                          //   UTextColor,
                                                                                                          // ),
                                                                                                          Container(
                                                                                                            margin: EdgeInsets.only(
                                                                                                              bottom: marginBottom,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      buildWidth15(),
                                                                                                      Column(
                                                                                                        children: [
                                                                                                          CustomPerformanceDiaglogTextThemeTitle(
                                                                                                            'ពិន្ទុជាក់ស្ដែង'.tr,
                                                                                                            UTitleSize,
                                                                                                            UPrimaryColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.number_attendance,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.number_assignment,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.number_mid_term,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.number_final,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          // Average Score Text
                                                                                                          // CustomPerformanceDiaglogTextThemeTitle(
                                                                                                          //   'ពិន្ទុសរុប'.tr,
                                                                                                          //   UTitleSize,
                                                                                                          //   UPrimaryColor,
                                                                                                          // ),
                                                                                                          Container(
                                                                                                            margin: EdgeInsets.only(
                                                                                                              bottom: marginBottom,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      buildWidth15(),
                                                                                                      Column(
                                                                                                        children: [
                                                                                                          CustomPerformanceDiaglogTextThemeTitle(
                                                                                                            'ពិន្ទុផ្លូវការ'.tr,
                                                                                                            UTitleSize,
                                                                                                            UPrimaryColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.score_attendance,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.score_assignment,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.score_mid_term,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          CustomPerformanceDiaglogTextTheme(
                                                                                                            score.score_final,
                                                                                                            UTitleSize,
                                                                                                            UScoreColor,
                                                                                                          ),
                                                                                                          // Average Score
                                                                                                          // CustomPerformanceDiaglogTextThemeTitle(
                                                                                                          //   subject.pscore_total.toString(),
                                                                                                          //   UTitleSize,
                                                                                                          //   UPrimaryColor,
                                                                                                          // ),
                                                                                                          Container(
                                                                                                            margin: EdgeInsets.only(
                                                                                                              bottom: marginBottom,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        }).toList(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Positioned(
                                                                                right: UZeroPixel,
                                                                                top: UZeroPixel,
                                                                                height: UHeight40,
                                                                                width: UWidth50,
                                                                                child: InkWell(
                                                                                  highlightColor: UTransParentColor,
                                                                                  splashColor: UTransParentColor,
                                                                                  onTap: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    imageAsset + 'close.png',
                                                                                    scale: UScale10,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                    UPdMg5,
                                                                    UZeroPixel,
                                                                    UPdMg5,
                                                                    UZeroPixel,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        color: pscore_total.toString() ==
                                                                                'N/A'
                                                                            ? UScoreColor
                                                                            : double.parse(pscore_total.toString()) > 49
                                                                                ? UScoreColor
                                                                                : URedColor,
                                                                        width:
                                                                            0.75,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    subject
                                                                        .pscore_total
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: pscore_total.toString() ==
                                                                              'N/A'
                                                                          ? UScoreColor
                                                                          : double.parse(pscore_total.toString()) > 49
                                                                              ? UScoreColor
                                                                              : URedColor,
                                                                      fontSize:
                                                                          UTitleSize,
                                                                      fontWeight:
                                                                          UBodyWeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
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
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            UPdMg10,
                                            UPdMg10,
                                            UPdMg10,
                                            UZeroPixel,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'មធ្យមភាគ'.tr,
                                                style: const TextStyle(
                                                  color: UPrimaryColor,
                                                  fontWeight: UTitleWeight,
                                                ),
                                              ),
                                              Container(
                                                width: 65,
                                                padding: const EdgeInsets.only(
                                                  right: UPdMg15,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  semester.average,
                                                  style: const TextStyle(
                                                    color: UPrimaryColor,
                                                    fontWeight: UTitleWeight,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            UPdMg10,
                                            UPdMg10,
                                            UPdMg10,
                                            UZeroPixel,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'ពិន្ទុមធ្យមភាគ'.tr,
                                                style: const TextStyle(
                                                  color: UPrimaryColor,
                                                  fontWeight: UTitleWeight,
                                                ),
                                              ),
                                              Container(
                                                width: 65,
                                                padding: const EdgeInsets.only(
                                                  right: UPdMg15,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  semester.gpa,
                                                  style: const TextStyle(
                                                    color: UPrimaryColor,
                                                    fontWeight: UTitleWeight,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            UPdMg10,
                                            UPdMg10,
                                            UPdMg10,
                                            UPdMg15,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'និទ្ទេស'.tr,
                                                style: const TextStyle(
                                                  color: UPrimaryColor,
                                                  fontWeight: UTitleWeight,
                                                ),
                                              ),
                                              Container(
                                                width: 65,
                                                padding: const EdgeInsets.only(
                                                  right: UPdMg15,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  semester.grade,
                                                  style: const TextStyle(
                                                    color: UPrimaryColor,
                                                    fontWeight: UTitleWeight,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          : buildFutureBuild()
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
