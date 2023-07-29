import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Student_Dashboard/Student_Detail/UI_Detail/St_Detail.dart';
import 'package:usea_app/Student_Dashboard/Student_JobHistory/UI_JobHistory/St_JobHistory.dart';
import 'package:usea_app/theme_builder.dart';
import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Student_Other_Class/Class_Survey_Status.dart';
import '../../Student_Payment/UI_Payment/Payment.dart';
import '../../Student_Schedule/UI_Schedule/Schedule.dart';
import '../../Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';
import '../Class_Home/Class_St_Credit.dart';

class Student_Home extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  const Student_Home({
    Key? key,
    required this.data_studentUser,
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

  final Uri urlFb =
      Uri.parse("https://9anime.to/watch/fighting-spirit.lr3/ep-17");

  @override
  void initState() {
    super.initState();
    _dataStudentUser = widget.data_studentUser;
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response_stUser = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/login.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      var response_credit = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/apidata.php?action=study_credit'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      var response_survey = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/survey_success.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      var response_stDetail = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/student_detail_success.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response_stUser.statusCode == 200 &&
          response_credit.statusCode == 200 &&
          response_survey.statusCode == 200 &&
          response_stDetail.statusCode == 200) {
        var data_stUser = jsonDecode(response_stUser.body);
        var data_credit = jsonDecode(response_credit.body);
        var data_survey = jsonDecode(response_survey.body);
        var data_stDetail = jsonDecode(response_stDetail.body);

        setState(
          () {
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
            isLoading = false;
          },
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
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

  @override
  Widget build(BuildContext context) {
    double percentIndicator = calculatePercentIndicator();

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/image/usea_logo.png',
                    scale: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                          style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: 11,
                              fontFamily: 'KhmerOSmuol'),
                        ),
                        Text(
                          'UNIVERSITY OF SOUTH-EAST ASIA',
                          style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: 13,
                              fontFamily: UEFontFamily,
                              fontWeight: UBodyWeight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Student_Detail(
                        data_studentUser: _dataStudentUser,
                      ),
                    ),
                  );
                },
                child: _dataStDetail.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(_dataStDetail[0].profile_pic),
                        radius: 25,
                      )
                    : Icon(
                        Icons.account_circle,
                        size: 50,
                      )),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: UBackgroundColor,
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: (() {
          if (_dataSurvey.isNotEmpty) {
            if (_dataSurvey.length > 1) {
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    elevation: 1,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                10,
                              )),
                              child: Container(
                                margin: EdgeInsets.all(7),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: UBackgroundColor),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'ការវាយតម្លៃ'.tr,
                                      style: TextStyle(
                                        fontSize: UTitleSize,
                                        fontWeight: UTitleWeight,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'សូមជ្រើសរើសប្រភេទនៃការវាយតម្លៃ!!!'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: UBodySize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 70,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _dataSurvey.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                    UBGLightBlue,
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 75,
                                                  child: Text(
                                                    'សាស្ត្រាចារ្យ'.tr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: UPrimaryColor,
                                                      fontSize: UBodySize,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  launchUrl(Uri.parse(
                                                      _dataSurvey[index].link));
                                                },
                                              ),
                                              if (index !=
                                                  _dataSurvey.length - 1)
                                                VerticalDivider(
                                                  width: 20,
                                                  thickness: 0.5,
                                                  color: UGreyColor,
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
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'សូមជួយធ្វើការវាយតម្លៃ'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: UBodySize,
                            color: URedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 180,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 40.0,
                          percent: percentIndicator,
                          progressColor: Colors.indigo[900],
                          animateFromLastPercent: true,
                          animation: true,
                          animationDuration: 750,
                          backgroundColor: UYellowColor,
                          center: Text(
                            _dataCredit.isNotEmpty
                                ? '${_dataCredit[0].yourCredit} / ${_dataCredit[0].totalCredit}'
                                : 'N/A',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 20,
                                  color: UYellowColor,
                                ),
                                Text('\tចំនួនក្រឌីតសរុប'.tr),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 20,
                                  color: UPrimaryColor,
                                ),
                                Text(
                                  '\tចំនួនក្រឌីតបានបំពេញ'.tr,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.5,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1.90,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                      children: List.generate(
                        st_home_screen.length,
                        (index) => Card(
                          elevation: 2,
                          shadowColor: ULightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (index.isEqual(6)) {
                                launchUrl(urlFb);
                              } else if (index.isEqual(0)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Schedule(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(3)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Payment_UI(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(4)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Job_History(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(5)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Study_Info(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          st_home_screen[index].screen),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    st_home_screen[index].img,
                                    scale: 6,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    st_home_screen[index].name.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );
            } else if (_dataSurvey.length == 1) {
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    elevation: 1,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(_dataSurvey[0].link));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'សូមជួយវាយដម្លៃការបង្រៀនរបស់សាស្ត្រាចារ្យ'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: UBodySize,
                            color: URedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 180,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 40.0,
                          percent: percentIndicator,
                          progressColor: Colors.indigo[900],
                          animateFromLastPercent: true,
                          animation: true,
                          animationDuration: 750,
                          backgroundColor: UYellowColor,
                          center: Text(
                            _dataCredit.isNotEmpty
                                ? '${_dataCredit[0].yourCredit} / ${_dataCredit[0].totalCredit}'
                                : 'N/A',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 20,
                                  color: UYellowColor,
                                ),
                                Text('\tចំនួនក្រឌីតសរុប'.tr),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 20,
                                  color: UPrimaryColor,
                                ),
                                Text(
                                  '\tចំនួនក្រឌីតបានបំពេញ'.tr,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.5,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1.90,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                      children: List.generate(
                        st_home_screen.length,
                        (index) => Card(
                          elevation: 2,
                          shadowColor: ULightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (index.isEqual(6)) {
                                launchUrl(urlFb);
                              } else if (index.isEqual(0)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Schedule(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(3)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Payment_UI(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(4)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Job_History(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else if (index.isEqual(5)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Study_Info(
                                      data_studentUser: _dataStudentUser,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          st_home_screen[index].screen),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    st_home_screen[index].img,
                                    scale: 6,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    st_home_screen[index].name.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );
            }
          }
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 40.0,
                      percent: percentIndicator,
                      progressColor: Colors.indigo[900],
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration: 750,
                      backgroundColor: UYellowColor,
                      center: Text(
                        _dataCredit.isNotEmpty
                            ? '${_dataCredit[0].yourCredit} / ${_dataCredit[0].totalCredit}'
                            : 'N/A',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 20,
                              color: UYellowColor,
                            ),
                            Text('\tចំនួនក្រឌីតសរុប'.tr),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 20,
                              color: UPrimaryColor,
                            ),
                            Text(
                              '\tចំនួនក្រឌីតបានបំពេញ'.tr,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3.5,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.90,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                  children: List.generate(
                    st_home_screen.length,
                    (index) => Card(
                      elevation: 2,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (index.isEqual(6)) {
                            launchUrl(urlFb);
                          } else if (index.isEqual(0)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Schedule(
                                  data_studentUser: _dataStudentUser,
                                ),
                              ),
                            );
                          } else if (index.isEqual(3)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment_UI(
                                  data_studentUser: _dataStudentUser,
                                ),
                              ),
                            );
                          } else if (index.isEqual(4)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Job_History(
                                  data_studentUser: _dataStudentUser,
                                ),
                              ),
                            );
                          } else if (index.isEqual(5)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Study_Info(
                                  data_studentUser: _dataStudentUser,
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      st_home_screen[index].screen),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                st_home_screen[index].img,
                                scale: 6,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                st_home_screen[index].name.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
            ],
          );
        })(),
      ),
    );
  }
}
