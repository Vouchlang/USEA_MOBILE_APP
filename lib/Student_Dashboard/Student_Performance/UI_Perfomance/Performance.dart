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

  Performance({required this.data_studentUser});

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
      print('Error1: $e');
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: UHeight5,
                        ),
                        Container(
                          height: 70,
                          alignment: Alignment.center,
                          width: UFullWidth,
                          padding: EdgeInsets.symmetric(
                            horizontal: UPdMg5,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
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
                                      'ឆ្នាំទី​ ${performances[index].yearNo}'
                                          .tr,
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
                        performances[selectedYearIndex].semesters.isNotEmpty
                            ? Column(
                                children: performances[selectedYearIndex]
                                    .semesters
                                    .map((semester) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: UPdMg5,
                                    ),
                                    child: Card(
                                      elevation: 1,
                                      shadowColor: ULightGreyColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: UBackgroundColor,
                                          width: 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          URoundedLarge,
                                        ),
                                      ),
                                      margin: EdgeInsets.all(
                                        UPdMg10,
                                      ),
                                      color: UBackgroundColor,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: UPdMg15,
                                              horizontal: UPdMg10,
                                            ),
                                            width: UFullWidth,
                                            decoration: BoxDecoration(
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
                                                    style: TextStyle(
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
                                                      VerticalDivider(
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
                                            padding: EdgeInsets.all(
                                              UPdMg10,
                                            ),
                                            width: UFullWidth,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ...semester.subjects.map(
                                                  (subject) {
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
                                                              margin: EdgeInsets
                                                                  .only(
                                                                right: UPdMg15,
                                                              ),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    UPdMg10,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                Get.locale
                                                                            ?.languageCode ==
                                                                        'km'
                                                                    ? subject
                                                                        .name_kh
                                                                    : subject
                                                                        .name_en,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      UTextColor,
                                                                  fontSize:
                                                                      UTitleSize,
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
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      UPdMg10,
                                                                ),
                                                                child: InkWell(
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
                                                                              EdgeInsets.all(
                                                                            UPdMg10,
                                                                          ),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(
                                                                                URoundedLarge,
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                                    decoration: BoxDecoration(
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
                                                                                      margin: EdgeInsets.only(
                                                                                        right: 50,
                                                                                      ),
                                                                                      child: Text(
                                                                                        subject.name_en.tr,
                                                                                        style: TextStyle(
                                                                                          fontSize: UTitleSize,
                                                                                          fontWeight: UTitleWeight,
                                                                                          color: UPrimaryColor,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: UHeight5,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(
                                                                                      UPdMg10,
                                                                                    ),
                                                                                    width: UFullWidth,
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: subject.attendances.asMap().entries.map((att) {
                                                                                        final int index = att.key;
                                                                                        final attendance = att.value;
                                                                                        final double marginBottom = (index == subject.attendances.length - 1) ? UPdMg5 : UPdMg15;

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
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'យឺត'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'សុំច្បាប់'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'អវត្តមាន'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        'វត្តមាន'.tr,
                                                                                                        UTitleSize,
                                                                                                        UTextColor,
                                                                                                      ),
                                                                                                      Container(
                                                                                                        margin: EdgeInsets.only(
                                                                                                          bottom: marginBottom,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    children: [
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        attendance.attendance_al,
                                                                                                        UTitleSize,
                                                                                                        UYellowColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        attendance.attendance_pm,
                                                                                                        UTitleSize,
                                                                                                        UOrangeColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        attendance.attendance_a,
                                                                                                        UTitleSize,
                                                                                                        URedColor,
                                                                                                      ),
                                                                                                      CustomPerformanceDiaglogTextTheme(
                                                                                                        attendance.attendance_ps,
                                                                                                        UTitleSize,
                                                                                                        UScoreColor,
                                                                                                      ),
                                                                                                    ],
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
                                                                                height: UHeight50,
                                                                                width: UWidth50,
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    'assets/image/close.png',
                                                                                    scale: UScale10,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border(
                                                                        bottom:
                                                                            BorderSide(
                                                                          color:
                                                                              UScoreColor,
                                                                          width:
                                                                              0.75,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      subject
                                                                          .attendance_ps,
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            UScoreColor,
                                                                        fontSize:
                                                                            UTitleSize,
                                                                        fontWeight:
                                                                            UTitleWeight,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                color:
                                                                    UGreyColor,
                                                                thickness: 0.5,
                                                                width:
                                                                    UZeroPixel,
                                                              ),
                                                              Container(
                                                                width: 65,
                                                                alignment:
                                                                    Alignment
                                                                        .topCenter,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      UPdMg10,
                                                                ),
                                                                child: InkWell(
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
                                                                              EdgeInsets.all(
                                                                            UPdMg10,
                                                                          ),
                                                                          shape:
                                                                              RoundedRectangleBorder(
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
                                                                                Container(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Container(
                                                                                        padding: EdgeInsets.all(
                                                                                          UPdMg10,
                                                                                        ),
                                                                                        width: UFullWidth,
                                                                                        decoration: BoxDecoration(
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
                                                                                          margin: EdgeInsets.only(
                                                                                            right: 50,
                                                                                          ),
                                                                                          child: Text(
                                                                                            subject.name_en,
                                                                                            style: TextStyle(
                                                                                              fontSize: UTitleSize,
                                                                                              fontWeight: UTitleWeight,
                                                                                              color: UPrimaryColor,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: UHeight5,
                                                                                      ),
                                                                                      Container(
                                                                                        padding: EdgeInsets.symmetric(
                                                                                          vertical: UPdMg5,
                                                                                          horizontal: UPdMg10,
                                                                                        ),
                                                                                        width: UFullWidth,
                                                                                        child: Container(
                                                                                          padding: EdgeInsets.symmetric(
                                                                                            vertical: UPdMg5,
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
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
                                                                                                    Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                              'កិច្ចការផ្ទះ និងស្រាវជ្រាវ\t'.tr,
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
                                                                                                            Container(
                                                                                                              margin: EdgeInsets.only(
                                                                                                                bottom: marginBottom,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          children: [
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
                                                                                                              ],
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              width: Get.locale?.languageCode == 'km' ? UWidth15 : UWidth5,
                                                                                                            ),
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
                                                                                                              ],
                                                                                                            )
                                                                                                          ],
                                                                                                        )
                                                                                                      ],
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
                                                                                ),
                                                                                Positioned(
                                                                                  right: UZeroPixel,
                                                                                  top: UZeroPixel,
                                                                                  height: UHeight50,
                                                                                  width: UWidth50,
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                    child: Image.asset(
                                                                                      'assets/image/close.png',
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
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border(
                                                                        bottom:
                                                                            BorderSide(
                                                                          color:
                                                                              UScoreColor,
                                                                          width:
                                                                              0.75,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      subject
                                                                          .pscore_total
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            UScoreColor,
                                                                        fontSize:
                                                                            UTitleSize,
                                                                        fontWeight:
                                                                            UTitleWeight,
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
                                            padding: EdgeInsets.fromLTRB(
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
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 65,
                                                  padding: EdgeInsets.only(
                                                    right: UPdMg15,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.average,
                                                    style: TextStyle(
                                                      color: UPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
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
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 65,
                                                  padding: EdgeInsets.only(
                                                    right: UPdMg15,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.gpa,
                                                    style: TextStyle(
                                                      color: UPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
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
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 65,
                                                  padding: EdgeInsets.only(
                                                    right: UPdMg15,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.grade,
                                                    style: TextStyle(
                                                      color: UPrimaryColor,
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
      ),
    );
  }
}
