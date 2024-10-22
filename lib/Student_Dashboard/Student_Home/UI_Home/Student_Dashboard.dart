import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import '../../../Student_Dashboard/Student_Notification/UI_Notification/Student_Notification.dart';
import '../../../Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import '../../Users_API.dart';
import '../../Student_Attendance/UI_Attendance/Attendance/Attendance.dart';
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
import 'Custom_Build_Student_Dashboard.dart';

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
  late bool isLoading = false;
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
      SystemUiOverlayStyle(statusBarColor: UBackgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    late final double percentIndicator = calculatePercentIndicator();

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildUniversityName(UBackgroundColor),
            Row(
              children: [
                buildProfileImage(
                  onTap: () => Get.to(
                    () => Student_Detail(
                      data_studentUser: _dataStudentUser,
                      sourceScreen: widget.sourceScreen,
                    ),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 100),
                  ),
                  buildImageUrl: _dataStDetail.isNotEmpty
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
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(imageAsset + 'no_images.png'),
                        ),
                ),
                const SizedBox(width: 3),
              ],
            ),
          ],
        ),
        titleSpacing: UWidth5,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: UPrimaryColor,
        elevation: 0,
      ),
      body: _dataStDetail.isEmpty
          ? buildFutureBuilder()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      buildPositionWidget(MediaQuery.of(context).size.width),
                      buildTotalCreditCard(
                        percentIndicator: percentIndicator,
                        progressColor: _dataCredit[0].yourCredit == _dataCredit[0].totalCredit ? UScoreColor : UPrimaryColor,
                        credit: _dataCredit.isNotEmpty ? '${_dataCredit[0].yourCredit} / ${_dataCredit[0].totalCredit}' : 'N/A',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _dataSurvey.isNotEmpty ? UHeight7 : UZeroPixel,
                  ),
                  buildSurveryCard(),
                  SizedBox(
                    height: _dataSurvey.isNotEmpty ? UHeight7 : UHeight5,
                  ),
                  buildGridview(),
                  buildHeight15(),
                ],
              ),
            ),
    );
  }

  Widget buildSurveryCard() {
    return (() {
      if (_dataSurvey.isNotEmpty && _dataSurvey.length > 1) {
        return buildSurveyCard(
          () => showDialog(
            context: context,
            builder: (BuildContext context) => buildListSurvey(buildListSurveyData()),
          ),
        );
      } else if (_dataSurvey.isNotEmpty && _dataSurvey.length == 1) {
        return buildSurveyCard(
          () {
            void _launchSurvey() async {
              if (await canLaunchUrlString(_dataSurvey[0].link)) {
                await launchUrlString(_dataSurvey[0].link);
              } else {
                throw 'Could not launch ${_dataSurvey[0].link}';
              }
            }

            _launchSurvey();
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    })();
  }

  Widget buildListSurveyData() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: _dataSurvey.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            buildBtnDialog(
              containerWidth: 115,
              text: 'ការវាយតម្លៃទី ${_dataSurvey[index].times}',
              onTap: () {
                _launchSurvey() async {
                  if (await canLaunchUrlString(_dataSurvey[index].link)) {
                    await launchUrlString(_dataSurvey[index].link);
                  } else {
                    throw 'Could not launch ${_dataSurvey[index].link}';
                  }
                }

                _launchSurvey();
              },
            ),
            if (index != _dataSurvey.length - 1)
              const VerticalDivider(
                width: UWidth10,
                color: UTransParentColor,
                thickness: UZeroPixel,
              ),
          ],
        );
      },
    );
  }

  Widget buildGridview() {
    return GridView.count(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 3.5,
      crossAxisSpacing: 3,
      childAspectRatio: 1.90,
      padding: const EdgeInsets.symmetric(horizontal: UPdMg7),
      children: List.generate(
        st_home_screen.length,
        (index) => Card(
          elevation: 1.5,
          color: UBackgroundColor,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UPdMg10),
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
                            return buildErrorDialog(
                              txtTitle: 'សូមអធ្យាស្រ័យ'.tr,
                              txtDescription: 'សូមអធ្យាស្រ័យលោកអ្នកមិនទាន់អាចធ្វើការ Feedback បាននៅឡើយទេ!!!'.tr,
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
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(1)) {
                Get.to(
                  () => Performance(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(2)) {
                Get.to(
                  () => Attendance(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(3)) {
                Get.to(
                  () => Payment_UI(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(4)) {
                Get.to(
                  () => Job_History(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(5)) {
                Get.to(
                  () => Study_Info(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else if (index.isEqual(7)) {
                Get.to(
                  () => Achievements(
                    data_studentUser: _dataStudentUser,
                    sourceScreen: widget.sourceScreen,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else {
                Get.to(
                  () => st_home_screen[index].screen,
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              }
            },
            child: index.isEqual(6) && widget.sourceScreen == guardian_sourceScreen
                ? buildCustomCard(
                    image: imageAsset + 'Acc_Guardian.png',
                    name: 'គណនីអាណាព្យាបាល'.tr,
                  )
                : buildCustomCard(
                    image: st_home_screen[index].img,
                    name: st_home_screen[index].name.tr,
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(
      () => isLoading = true,
    );

    try {
      var response_stUser = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      var response_credit = await http.post(
        Uri.parse(APIStCredit),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      var response_survey = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      var response_stDetail = await http.post(
        Uri.parse(APIStLoginKh),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      var response_feedback = await http.post(
        Uri.parse(APIStFeedback),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

      if (response_stUser.statusCode == 200 && response_credit.statusCode == 200 && response_survey.statusCode == 200 && response_stDetail.statusCode == 200 && response_feedback.statusCode == 200) {
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
          setState(
            () => isLoading = false,
          );
        }
      }
    } catch (error) {
      print('Failed to fetch data: $error');
      if (mounted) {
        setState(
          () => isLoading = false,
        );
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

    late final double yourCredit = double.parse(_dataCredit[0].yourCredit);
    late final double totalCredit = double.parse(_dataCredit[0].totalCredit);

    late final double percentIndicator = yourCredit / totalCredit;
    return percentIndicator;
  }

  void _launchFeedback() async {
    if (await canLaunchUrlString(_dataFeedback[0].feedback)) {
      await launchUrlString(_dataFeedback[0].feedback);
    } else {
      throw 'Could not launch ${_dataFeedback[0].feedback}';
    }
  }
}
