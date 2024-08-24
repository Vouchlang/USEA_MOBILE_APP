// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
// import '../../../Student_Dashboard/Student_Notification/UI_Notification/Student_Notification.dart';
import '../../../Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import '../../Student_Attendance/UI_Attendance/Attendance.dart';
import '../../Student_Detail/UI_Detail/St_Detail.dart';
import '../../Student_JobHistory/UI_JobHistory/St_JobHistory.dart';
import '../../../theme_builder.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Student_Achievements/UI_Achievements/Achievements.dart';
import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_Other_Class/Class_Feedback.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Student_Other_Class/Class_Survey_Status.dart';
import '../../Student_Payment/UI_Payment/Payment.dart';
import '../../Student_Performance/UI_Perfomance/Performance.dart';
import '../../Student_Schedule/UI_Schedule/Schedule.dart';
import '../../Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';
import '../../Student_Other_Class/Class_St_Credit.dart';

class Student_Home extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  const Student_Home({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
  }) : super(key: key);

  @override
  State<Student_Home> createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home> {
  int activeIndex = 0;
  bool isLoading = false;
  late List<StudentUser> _dataStudentUser;
  late List<Credit_Class> _dataCredit = [];
  late List<SurveyStatus> _dataSurvey = [];
  late List<StDetail> _dataStDetail = [];
  late List<FeedbackClass> _dataFeedback = [];

  @override
  void initState() {
    super.initState();
    _dataStudentUser = widget.data_studentUser;
    _refreshData();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: UBackgroundColor,
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response_stUser = await http.post(
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

      var response_credit = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=study_credit',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );

      var response_survey = await http.post(
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

      var response_stDetail = await http.post(
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

      var response_feedback = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=feedback',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );

      if (response_stUser.statusCode == 200 &&
          response_credit.statusCode == 200 &&
          response_survey.statusCode == 200 &&
          response_stDetail.statusCode == 200 &&
          response_feedback.statusCode == 200) {
        var data_stUser = jsonDecode(response_stUser.body);
        var data_credit = jsonDecode(response_credit.body);
        var data_survey = jsonDecode(response_survey.body);
        var data_stDetail = jsonDecode(response_stDetail.body);
        var data_feedback = jsonDecode(response_feedback.body);

        if (mounted) {
          setState(() {
            _dataStudentUser = List<StudentUser>.from(
              data_stUser['student_users'].map(
                (data_stUser) => StudentUser.fromJson(data_stUser),
              ),
            );
            _dataCredit = List<Credit_Class>.from(
              data_credit['credit_data'].map(
                (data_credit) => Credit_Class.fromJson(data_credit),
              ),
            );
            _dataSurvey = List<SurveyStatus>.from(
              data_survey['survey_status'].map(
                (data_survey) => SurveyStatus.fromJson(data_survey),
              ),
            );
            _dataStDetail = List<StDetail>.from(
              data_stDetail['user_data'].map(
                (data_stDetail) => StDetail.fromJson(data_stDetail),
              ),
            );
            _dataFeedback = List<FeedbackClass>.from(
              data_feedback['feedback_data'].map(
                (data_feedback) => FeedbackClass.fromJson(data_feedback),
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
      print('Failed to fetch data: $error');
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

  double calculatePercentIndicator() {
    if (_dataCredit.isEmpty || _dataCredit[0].totalCredit == "0") {
      return 0; // Avoid division by zero error
    }

    double yourCredit = double.parse(_dataCredit[0].yourCredit);
    double totalCredit = double.parse(_dataCredit[0].totalCredit);

    double percentIndicator = yourCredit / totalCredit;
    return percentIndicator;
  }

  void _launchFeedback() async {
    if (await canLaunch(_dataFeedback[0].feedback)) {
      await launch(_dataFeedback[0].feedback);
    } else {
      throw 'Could not launch ${_dataFeedback[0].feedback}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentIndicator = calculatePercentIndicator();

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildUniversityName(
              UBackgroundColor,
            ),
            Row(
              children: [
                InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () {
                    Get.to(
                      () => Student_Detail(
                        data_studentUser: _dataStudentUser,
                        sourceScreen: widget.sourceScreen,
                      ),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: UBackgroundColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: _dataStDetail.isNotEmpty
                        ? ClipOval(
                            child: Container(
                              width: UWidth40,
                              height: UHeight40,
                              child: CachedNetworkImage(
                                imageUrl: _dataStDetail[0].profile_pic,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          )
                        : const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/image/no_images.png',
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
              ],
            ),
          ],
        ),
        titleSpacing: 5,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: UPrimaryColor,
        elevation: 0,
      ),
      body: _dataStDetail.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          color: UPrimaryColor,
                          height: 70,
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                      ),
                      Card(
                        elevation: 1.5,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            UPdMg10,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          left: UPdMg12,
                          right: UPdMg12,
                          top: UPdMg15,
                          bottom: UPdMg5,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(
                            UPdMg15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                arcType: ArcType.FULL,
                                arcBackgroundColor: UBGChartColor,
                                radius: 70.0,
                                lineWidth: UWidth20,
                                percent: percentIndicator,
                                progressColor: _dataCredit[0].yourCredit ==
                                        _dataCredit[0].totalCredit
                                    ? UScoreColor
                                    : UPrimaryColor,
                                animateFromLastPercent: true,
                                animation: true,
                                curve: Curves.decelerate,
                                circularStrokeCap: CircularStrokeCap.round,
                                animationDuration: 1000,
                                center: Text(
                                  _dataCredit.isNotEmpty
                                      ? '${_dataCredit[0].yourCredit} / ${_dataCredit[0].totalCredit}'
                                      : 'N/A',
                                  style: const TextStyle(
                                    fontSize: UTitleSize16,
                                    fontWeight: UTitleWeight,
                                    fontFamily: UEFontFamily,
                                    color: UPrimaryColor,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildTotalCredit(
                                    '\tចំនួនក្រឌីតសរុប',
                                    UBGChartColor,
                                  ),
                                  buildHeight10(),
                                  buildTotalCredit(
                                    '\tចំនួនក្រឌីតបានបំពេញ',
                                    UPrimaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _dataSurvey.isNotEmpty ? UHeight7 : UZeroPixel,
                  ),
                  (() {
                    if (_dataSurvey.isNotEmpty && _dataSurvey.length > 1) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: UPdMg10,
                        ),
                        elevation: 1.5,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            URoundedLarge,
                          ),
                        ),
                        color: UBackgroundColor,
                        child: InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      URoundedLarge,
                                    ),
                                  ),
                                  backgroundColor: UBackgroundColor,
                                  child: Container(
                                    margin: const EdgeInsets.all(
                                      UPdMg7,
                                    ),
                                    padding: const EdgeInsets.all(
                                      UPdMg10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        URoundedLarge,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'ការវាយតម្លៃ'.tr,
                                          style: const TextStyle(
                                            fontSize: UTitleSize,
                                            fontWeight: UTitleWeight,
                                          ),
                                        ),
                                        buildHeight5(),
                                        Text(
                                          'សូមជ្រើសរើសប្រភេទនៃការវាយតម្លៃ!!!'
                                              .tr,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: UBodySize,
                                          ),
                                        ),
                                        buildHeight5(),
                                        Container(
                                          height: 70,
                                          padding: const EdgeInsets.all(
                                            UPdMg5,
                                          ),
                                          alignment: Alignment.center,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _dataSurvey.length,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          URoundedMedium,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          UBGLightBlue,
                                                    ),
                                                    child: Container(
                                                      width: 80,
                                                      child: Text(
                                                        'ការវាយតម្លៃទី ${_dataSurvey[index].times}'
                                                            .tr,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color: UPrimaryColor,
                                                          fontSize: UBodySize,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      void
                                                          _launchSurvey() async {
                                                        if (await canLaunch(
                                                            _dataSurvey[index]
                                                                .link)) {
                                                          await launch(
                                                              _dataSurvey[index]
                                                                  .link);
                                                        } else {
                                                          throw 'Could not launch ${_dataSurvey[index].link}';
                                                        }
                                                      }

                                                      _launchSurvey();
                                                    },
                                                  ),
                                                  if (index !=
                                                      _dataSurvey.length - 1)
                                                    const VerticalDivider(
                                                      width: UWidth10,
                                                      color: UTransParentColor,
                                                      thickness: UZeroPixel,
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(
                              UPdMg10,
                            ),
                            child: Text(
                              'សូមជួយធ្វើការវាយតម្លៃ'.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: UBodySize,
                                color: URedColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (_dataSurvey.isNotEmpty &&
                        _dataSurvey.length == 1) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: UPdMg10,
                        ),
                        elevation: 1.5,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            URoundedLarge,
                          ),
                        ),
                        child: InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            void _launchSurvey() async {
                              if (await canLaunch(_dataSurvey[0].link)) {
                                await launch(_dataSurvey[0].link);
                              } else {
                                throw 'Could not launch ${_dataSurvey[0].link}';
                              }
                            }

                            _launchSurvey();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(
                              UPdMg10,
                            ),
                            child: Text(
                              'សូមជួយធ្វើការវាយតម្លៃ'.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: UBodySize,
                                color: URedColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  })(),
                  SizedBox(
                    height: _dataSurvey.isNotEmpty ? UHeight7 : UHeight5,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 3.5,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1.90,
                    padding: const EdgeInsets.symmetric(
                      horizontal: UPdMg7,
                    ),
                    children: List.generate(
                      st_home_screen.length,
                      (index) => Card(
                        elevation: 1.5,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            UPdMg10,
                          ),
                        ),
                        child: InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            if (index.isEqual(6)) {
                              if (widget.sourceScreen == st_sourceScreen) {
                                _dataFeedback[0].feedback.isEmpty
                                    ? showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                URoundedLarge,
                                              ),
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.all(
                                                UPdMg7,
                                              ),
                                              padding: const EdgeInsets.all(
                                                UPdMg10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                                color: UBackgroundColor,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'សូមអធ្យាស្រ័យ'.tr,
                                                    style: const TextStyle(
                                                      fontSize: UTitleSize,
                                                      fontWeight: UTitleWeight,
                                                    ),
                                                  ),
                                                  buildHeight5(),
                                                  Text(
                                                    'សូមអធ្យាស្រ័យលោកអ្នកមិនទាន់អាចធ្វើការ Feedback បាននៅឡើយទេ!!!'
                                                        .tr,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: UBodySize,
                                                    ),
                                                  ),
                                                  buildHeight5(),
                                                  Container(
                                                    height: UHeight50,
                                                    padding:
                                                        const EdgeInsets.all(
                                                      UPdMg5,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: TextButton(
                                                      child: Text(
                                                        'បោះបង់'.tr,
                                                        style: const TextStyle(
                                                          color: UPrimaryColor,
                                                          fontSize: UBodySize,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : _launchFeedback();
                              } else {
                                Get.back();
                              }
                            } else if (index.isEqual(0)) {
                              Get.to(
                                () => Schedule(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(1)) {
                              Get.to(
                                () => Performance(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(2)) {
                              Get.to(
                                () => Attendance(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(3)) {
                              Get.to(
                                () => Payment_UI(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(4)) {
                              Get.to(
                                () => Job_History(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(5)) {
                              Get.to(
                                () => Study_Info(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else if (index.isEqual(7)) {
                              Get.to(
                                () => Achievements(
                                  data_studentUser: _dataStudentUser,
                                  sourceScreen: widget.sourceScreen,
                                ),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            } else {
                              Get.to(
                                () => st_home_screen[index].screen,
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                              );
                            }
                          },
                          child: index.isEqual(6) &&
                                  widget.sourceScreen == guardian_sourceScreen
                              ? Container(
                                  padding: const EdgeInsets.only(
                                    left: UPdMg15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imageAsset + 'Acc_Guardian.png',
                                        scale: UScale6,
                                      ),
                                      buildHeight7(),
                                      Text(
                                        'គណនីអាណាព្យាបាល'.tr,
                                        style: const TextStyle(
                                          fontSize: UTitleSize,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(
                                    left: UPdMg15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        st_home_screen[index].img,
                                        scale: UScale6,
                                      ),
                                      buildHeight7(),
                                      Text(
                                        st_home_screen[index].name.tr,
                                        style: const TextStyle(
                                          fontSize: UTitleSize,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  buildHeight15(),
                ],
              ),
            ),
      // floatingActionButton: Container(
      //   width: UWidth40,
      //   height: UHeight40,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(
      //       50,
      //     ),
      //     color: UPrimaryColor,
      //   ),
      //   child: Center(
      //     child: IconButton(
      //       highlightColor: UTransParentColor,
      //       splashColor: UTransParentColor,
      //       onPressed: () {
      //         setState(
      //           () {
      //             Get.to(
      //               () => Students_Notifications(),
      //               transition: Transition.rightToLeftWithFade,
      //               duration: const Duration(
      //                 milliseconds: 100,
      //               ),
      //             );
      //           },
      //         );
      //       },
      //       icon: const Icon(
      //         Icons.qr_code_scanner,
      //         color: UBackgroundColor,
      //         size: 25,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
