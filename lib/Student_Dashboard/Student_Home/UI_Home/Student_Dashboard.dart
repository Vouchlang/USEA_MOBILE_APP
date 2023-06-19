import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Student_Dashboard/Student_Detail/UI_Detail/St_Detail.dart';
import 'package:usea_app/Student_Dashboard/Student_JobHistory/UI_JobHistory/St_JobHistory.dart';
import 'package:usea_app/Student_Dashboard/Student_Other_Class/Class_Survey_Link.dart';
import 'package:usea_app/theme_builder.dart';
import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Student_Other_Class/Class_Survey_Status.dart';

class Student_Home extends StatefulWidget {
  // final dynamic dataDetail;
  final List<StudentUser> data_studentUser;
  final List<SurveyStatus> data_survey;
  final List<JobHistory> data_jobhistory;
  final List<StDetail> data_stdetail;
  const Student_Home(
      {Key? key,
      // required this.dataDetail,
      required this.data_jobhistory,
      required this.data_stdetail,
      required this.data_studentUser,
      required this.data_survey})
      : super(key: key);

  @override
  State<Student_Home> createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home> {
  int activeIndex = 0;
  bool isLoading = false;
  List<Class_Survey_Link> survey = [];
  late List<StudentUser> _dataStudentUser;
  late List<SurveyStatus> _dataSurvey;
  late List<JobHistory> _dataJobHistory;
  late List<StDetail> _dataStDetail;

  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");

  @override
  void initState() {
    super.initState();
    _dataStudentUser = widget.data_studentUser;
    _dataSurvey = widget.data_survey;
    _dataJobHistory = widget.data_jobhistory;
    _dataStDetail = widget.data_stdetail;
  }

  // Future<void> getData() async {
  //   try {
  //     var res = await http.get(
  //       Uri.parse("http://192.168.3.34/hosting_api/Student/student_survey.php"),
  //     );
  //     var r = json.decode(res.body);
  //     if (r is List<dynamic>) {
  //       survey = r.map((e) => Class_Survey_Link.fromJson(e)).toList();
  //     } else {
  //       survey = [
  //         Class_Survey_Link.fromJson(r),
  //       ];
  //     }
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/apidata.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          _dataStudentUser = List<StudentUser>.from(
              data['student_users'].map((data) => StudentUser.fromJson(data)));
          _dataSurvey = List<SurveyStatus>.from(
              data['survey_status'].map((data) => SurveyStatus.fromJson(data)));
          _dataJobHistory = List<JobHistory>.from(data['job_history_data']
              .map((data) => JobHistory.fromJson(data)));
          _dataStDetail = List<StDetail>.from(
              data['user_data'].map((data) => StDetail.fromJson(data)));
          isLoading = false;
        });
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

  @override
  Widget build(BuildContext context) {
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
                      data_Detail: _dataStDetail,
                      data_studentUser: _dataStudentUser,
                    ),
                  ),
                );
              },
              // child: Container(
              // height: 10,
              // width: 10,
              // color: Colors.amber,
              // ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  _dataStDetail[0].profile_pic,
                  // getImage(widget.data_stdetail[0].profile_pic),
                ),
                radius: 25,
              ),
            ),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: UBackgroundColor,
        elevation: 1,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView(
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
                        launchUrl(Uri.parse(survey[0].survey_link));
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
                  Container(
                    alignment: Alignment.center,
                    height: 175,
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: DChartPie(
                            data: [
                              {'domain': 'Flutter', 'measure': 10},
                              {'domain': 'React Native', 'measure': 10},
                              {'domain': 'React JS', 'measure': 10},
                              {'domain': 'Flutter1', 'measure': 10},
                              {'domain': 'React Native1', 'measure': 10},
                              {'domain': 'React JS2', 'measure': 10},
                              {'domain': 'Flutter2', 'measure': 10},
                              {'domain': 'React Native2', 'measure': 10},
                              {'domain': 'React JS3', 'measure': 10},
                              {'domain': 'React JS4', 'measure': 10},
                            ],
                            fillColor: (pieData, index) => UPrimaryColor,
                            donutWidth: 30,
                            labelColor: UBackgroundColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: UOrangeColor,
                                  ),
                                  Text('ចំនួនក្រឌីតសរុប'),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: UPrimaryColor,
                                  ),
                                  Text('ចំនួនក្រឌីតបានបំពេញ'),
                                ],
                              ),
                            ],
                          ),
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
                              } else if (index.isEqual(4)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Job_History(
                                      data_jobhistory: _dataJobHistory,
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
              )
              // : ListView(
              //     shrinkWrap: true,
              //     children: [
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         alignment: Alignment.center,
              //         height: 175,
              //         padding: EdgeInsets.symmetric(
              //           vertical: 0,
              //           horizontal: 5,
              //         ),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Expanded(
              //               child: DChartPie(
              //                 data: [
              //                   {'domain': 'Flutter', 'measure': 58},
              //                   {'domain': 'React Native', 'measure': 20},
              //                   {'domain': 'React JS', 'measure': 22},
              //                 ],
              //                 fillColor: (pieData, index) => UPrimaryColor,
              //                 donutWidth: 30,
              //                 labelColor: UBackgroundColor,
              //               ),
              //             ),
              //             Expanded(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.start,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.circle,
              //                         color: UOrangeColor,
              //                       ),
              //                       Text('ចំនួនក្រឌីតសរុប'),
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.start,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.circle,
              //                         color: UPrimaryColor,
              //                       ),
              //                       Text('ចំនួនក្រឌីតបានបំពេញ'),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Expanded(
              //         child: GridView.count(
              //           shrinkWrap: true,
              //           physics: ScrollPhysics(),
              //           crossAxisCount: 2,
              //           mainAxisSpacing: 3.5,
              //           crossAxisSpacing: 3,
              //           childAspectRatio: 1.90,
              //           padding: EdgeInsets.symmetric(
              //               vertical: 0, horizontal: 7),
              //           children: List.generate(
              //             st_home_screen.length,
              //             (index) => Card(
              //               elevation: 2,
              //               shadowColor: ULightGreyColor,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: InkWell(
              //                 onTap: () {
              //                   if (index.isEqual(6)) {
              //                     launchUrl(urlFb);
              //                   } else if (index.isEqual(4)) {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) => Job_History(
              //                           data_jobhistory: _dataJobHistory,
              //                           data_studentUser: _dataStudentUser,
              //                         ),
              //                       ),
              //                     );
              //                   } else {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) =>
              //                               st_home_screen[index].screen),
              //                     );
              //                   }
              //                 },
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 15),
              //                   child: Column(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.center,
              //                     crossAxisAlignment:
              //                         CrossAxisAlignment.start,
              //                     children: [
              //                       Image.asset(
              //                         st_home_screen[index].img,
              //                         scale: 6,
              //                       ),
              //                       SizedBox(
              //                         height: 7,
              //                       ),
              //                       Text(
              //                         st_home_screen[index].name.tr,
              //                         style: TextStyle(
              //                           fontSize: 14,
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 7,
              //       ),
              //     ],
              //   ),
              ),
    );
  }
}
