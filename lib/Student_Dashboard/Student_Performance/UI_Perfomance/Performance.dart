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
    String apiUrl =
        'http://192.168.3.87/usea/api/apidata.php?action=study_performance';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
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
              Subject subjectObj = Subject(
                id: subjectData['id'] == null ? 'N/A' : subjectData['id'],
                name_en: subjectData['name_en'] == null
                    ? 'N/A'
                    : subjectData['name_en'],
                pscore_attendance: subjectData['pscore_attendance'] == null
                    ? 'N/A'
                    : subjectData['pscore_attendance'],
                pscore_assignment: subjectData['pscore_assignment'] == null
                    ? 'N/A'
                    : subjectData['pscore_assignment'],
                pscore_mid_term: subjectData['pscore_mid_term'] == null
                    ? 'N/A'
                    : subjectData['pscore_mid_term'],
                pscore_final: subjectData['pscore_final'] == null
                    ? 'N/A'
                    : subjectData['pscore_final'],
                pscore_total: subjectData['pscore_total'] == null
                    ? 'N/A'
                    : subjectData['pscore_total'],
                number_attendance: subjectData['number_attendance'] == null
                    ? 'N/A'
                    : subjectData['number_attendance'],
                number_assignment: subjectData['number_assignment'] == null
                    ? 'N/A'
                    : subjectData['number_assignment'],
                number_mid_term: subjectData['number_mid_term'] == null
                    ? 'N/A'
                    : subjectData['number_mid_term'],
                number_final: subjectData['number_final'] == null
                    ? 'N/A'
                    : subjectData['number_final'],
                attendance_a: subjectData['attendance_a'] == null
                    ? 'N/A'
                    : subjectData['attendance_a'],
                attendance_al: subjectData['attendance_al'] == null
                    ? 'N/A'
                    : subjectData['attendance_al'],
                attendance_pm: subjectData['attendance_pm'] == null
                    ? 'N/A'
                    : subjectData['attendance_pm'],
                attendance_ps: subjectData['attendance_ps'] == null
                    ? 'N/A'
                    : subjectData['attendance_ps'],
                attendance_all: subjectData['attendance_all'] == null
                    ? 'N/A'
                    : subjectData['attendance_all'],
              );

              subjects.add(subjectObj);
            });

            Semester semesterObj = Semester(
              semesterNo: semesterData['semester_no'] == null
                  ? 'N/A'
                  : semesterData['semester_no'],
              average: semesterData['average'] == null
                  ? 'N/A'
                  : semesterData['average'],
              gpa: semesterData['gpa'] == null ? 'N/A' : semesterData['gpa'],
              grade:
                  semesterData['grade'] == null ? 'N/A' : semesterData['grade'],
              meaning: semesterData['meaning'] == null
                  ? 'N/A'
                  : semesterData['meaning'],
              subjects: subjects,
            );

            semesters.add(semesterObj);
          });

          Performance_Class performance = Performance_Class(
            yearNo: yearData['year_no'] == null ? 'N/A' : yearData['year_no'],
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
      appBar: Custom_AppBar(title: 'ដំណើរការសិក្សា'.tr),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          alignment: Alignment.topCenter,
          child: performances.isEmpty
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 70,
                          width: UFullWidth,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: performances.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedYearIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: 70,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: selectedYearIndex == index
                                      ? UPrimaryColor
                                      : UBackgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(URoundedMedium),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: ULightGreyColor,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.all(UPdMg_5),
                                child: Center(
                                  child: Text(
                                    'ឆ្នាំទី​ '.tr +
                                        '${performances[index].yearNo}',
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      color: selectedYearIndex == index
                                          ? UBackgroundColor
                                          : UTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        performances[selectedYearIndex].semesters.isNotEmpty
                            ? Column(
                                children: performances[selectedYearIndex]
                                    .semesters
                                    .map((semester) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: UPdMg_5),
                                    child: Card(
                                      elevation: 1,
                                      shadowColor: ULightGreyColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: UBackgroundColor,
                                          width: 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            URoundedLarge),
                                      ),
                                      margin: EdgeInsets.all(UPdMg_10),
                                      color: UBackgroundColor,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: UPdMg_15,
                                              horizontal: UPdMg_10,
                                            ),
                                            width: UFullWidth,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    URoundedLarge),
                                                topRight: Radius.circular(
                                                    URoundedLarge),
                                                bottomRight:
                                                    Radius.circular(UZeroPixel),
                                                bottomLeft:
                                                    Radius.circular(UZeroPixel),
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
                                                        100,
                                                        'វត្តមាន'.tr,
                                                        Alignment.centerRight,
                                                      ),
                                                      VerticalDivider(
                                                        color: UGreyColor,
                                                        thickness: 0.5,
                                                      ),
                                                      buildTitleContainer(
                                                        50,
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
                                            padding: EdgeInsets.all(UPdMg_10),
                                            width: UFullWidth,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ...semester.subjects
                                                      .map((subject) {
                                                    return IntrinsicHeight(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 50,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          20),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                subject.name_en,
                                                                style:
                                                                    TextStyle(
                                                                  height: 1.5,
                                                                  color:
                                                                      UTextColor,
                                                                  fontSize:
                                                                      UTitleSize,
                                                                  fontFamily:
                                                                      UKFontFamily,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 50,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              5,
                                                                          backgroundColor:
                                                                              UBackgroundColor,
                                                                          insetPadding:
                                                                              EdgeInsets.all(UPdMg_10),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(URoundedLarge),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Container(
                                                                                      padding: EdgeInsets.all(UPdMg_10),
                                                                                      width: UFullWidth,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          topLeft: Radius.circular(URoundedLarge),
                                                                                          topRight: Radius.circular(URoundedLarge),
                                                                                        ),
                                                                                        color: UBGLightBlue,
                                                                                      ),
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(right: 50),
                                                                                        child: Text(
                                                                                          subject.name_en.tr,
                                                                                          style: TextStyle(
                                                                                            fontFamily: UKFontFamily,
                                                                                            fontSize: UTitleSize,
                                                                                            fontWeight: UTitleWeight,
                                                                                            color: UPrimaryColor,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 4,
                                                                                    ),
                                                                                    Container(
                                                                                      padding: EdgeInsets.all(UPdMg_8),
                                                                                      width: UFullWidth,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          IntrinsicHeight(
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    CustomTextTheme(
                                                                                                      text: 'យឺត'.tr,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UTextColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: 'អវត្តមានមានច្បាប់'.tr,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UTextColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: 'អវត្តមាន'.tr,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UTextColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: 'វត្តមាន'.tr,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UTextColor,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  children: [
                                                                                                    CustomTextTheme(
                                                                                                      text: subject.attendance_al,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UYellowColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: subject.attendance_pm,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UOrangeColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: subject.attendance_a,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: URedColor,
                                                                                                    ),
                                                                                                    CustomTextTheme(
                                                                                                      text: subject.attendance_ps,
                                                                                                      fontWeight: UBodyWeight,
                                                                                                      size: UTitleSize,
                                                                                                      color: UScoreColor,
                                                                                                    ),
                                                                                                  ],
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                right: 0,
                                                                                top: 0,
                                                                                height: 50,
                                                                                width: 50,
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    'assets/image/close.png',
                                                                                    scale: 10,
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
                                                                        height:
                                                                            1.5,
                                                                        color:
                                                                            UScoreColor,
                                                                        fontSize:
                                                                            UTitleSize,
                                                                        fontFamily:
                                                                            UKFontFamily,
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
                                                              ),
                                                              Container(
                                                                width: 50,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              5,
                                                                          backgroundColor:
                                                                              UBackgroundColor,
                                                                          insetPadding:
                                                                              EdgeInsets.all(UPdMg_10),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(URoundedLarge),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Container(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Container(
                                                                                      padding: EdgeInsets.all(UPdMg_10),
                                                                                      width: UFullWidth,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          topLeft: Radius.circular(URoundedLarge),
                                                                                          topRight: Radius.circular(URoundedLarge),
                                                                                        ),
                                                                                        color: UBGLightBlue,
                                                                                      ),
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(right: 50),
                                                                                        child: Text(
                                                                                          subject.name_en,
                                                                                          style: TextStyle(
                                                                                            fontFamily: UKFontFamily,
                                                                                            fontSize: UTitleSize,
                                                                                            fontWeight: UTitleWeight,
                                                                                            color: UPrimaryColor,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 4,
                                                                                    ),
                                                                                    Container(
                                                                                      padding: EdgeInsets.all(UPdMg_8),
                                                                                      width: UFullWidth,
                                                                                      child: Container(
                                                                                        padding: EdgeInsets.symmetric(vertical: UPdMg_5),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            IntrinsicHeight(
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CustomTextTheme(
                                                                                                        text: 'លក្ខណៈវិនិច្ឆ័យ'.tr,
                                                                                                        fontWeight: UBodyWeight,
                                                                                                        size: UTitleSize,
                                                                                                        color: UPrimaryColor,
                                                                                                      ),
                                                                                                      CustomTextTheme(
                                                                                                        text: 'វត្តមាន'.tr,
                                                                                                        fontWeight: UBodyWeight,
                                                                                                        size: UTitleSize,
                                                                                                        color: UTextColor,
                                                                                                      ),
                                                                                                      CustomTextTheme(
                                                                                                        text: 'លំហាត់'.tr,
                                                                                                        fontWeight: UBodyWeight,
                                                                                                        size: UTitleSize,
                                                                                                        color: UTextColor,
                                                                                                      ),
                                                                                                      CustomTextTheme(
                                                                                                        text: 'ពាក់កណ្ដាលឆមាស'.tr,
                                                                                                        fontWeight: UBodyWeight,
                                                                                                        size: UTitleSize,
                                                                                                        color: UTextColor,
                                                                                                      ),
                                                                                                      CustomTextTheme(
                                                                                                        text: 'ឆមាស'.tr,
                                                                                                        fontWeight: UBodyWeight,
                                                                                                        size: UTitleSize,
                                                                                                        color: UTextColor,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        children: [
                                                                                                          CustomTextTheme(
                                                                                                            text: 'ភាគរយ'.tr,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UPrimaryColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.pscore_attendance,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.pscore_assignment,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.pscore_mid_term,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.pscore_final,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 50,
                                                                                                      ),
                                                                                                      Column(
                                                                                                        children: [
                                                                                                          CustomTextTheme(
                                                                                                            text: 'ពិន្ទុ'.tr,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UPrimaryColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.number_attendance,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.number_assignment,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.number_mid_term,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                          CustomTextTheme(
                                                                                                            text: subject.number_final,
                                                                                                            fontWeight: UBodyWeight,
                                                                                                            size: UTitleSize,
                                                                                                            color: UScoreColor,
                                                                                                          ),
                                                                                                        ],
                                                                                                      )
                                                                                                    ],
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                right: 0,
                                                                                top: 0,
                                                                                height: 50,
                                                                                width: 50,
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    'assets/image/close.png',
                                                                                    scale: 10,
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
                                                                          .pscore_total
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        height:
                                                                            1.5,
                                                                        color:
                                                                            UScoreColor,
                                                                        fontSize:
                                                                            UTitleSize,
                                                                        fontFamily:
                                                                            UKFontFamily,
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
                                                  }).toList(),
                                                ]),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                UPdMg_10,
                                                UPdMg_10,
                                                UPdMg_10,
                                                0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'មធ្យមភាគៈ'.tr,
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 50,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.average,
                                                    style: TextStyle(
                                                        color: UPrimaryColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                UPdMg_10,
                                                UPdMg_10,
                                                UPdMg_10,
                                                0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'ពិន្ទុមធ្យមភាគៈ'.tr,
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 50,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.gpa,
                                                    style: TextStyle(
                                                        color: UPrimaryColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: UPdMg_10,
                                                horizontal: UPdMg_10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'និទ្ទេសៈ'.tr,
                                                  style: TextStyle(
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                                Container(
                                                  width: 50,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    semester.grade,
                                                    style: TextStyle(
                                                        color: UPrimaryColor),
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
                            : FutureBuilder(
                                future: Future.delayed(Duration(seconds: 3)),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
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
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
