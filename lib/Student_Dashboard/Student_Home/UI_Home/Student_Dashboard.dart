import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Student_Dashboard/Student_Achievements/UI_Achievements/Achievements.dart';
import 'package:usea_app/Student_Dashboard/Student_Attendance/UI_Attendance/Attendance.dart';
import 'package:usea_app/Student_Dashboard/Student_Detail/UI_Detail/St_Detail.dart';
import 'package:usea_app/Student_Dashboard/Student_JobHistory/UI_JobHistory/St_JobHistory.dart';
import 'package:usea_app/Student_Dashboard/Student_Payment/UI_Payment/Payment.dart';
import 'package:usea_app/Student_Dashboard/Student_Performance/UI_Perfomance/Performance.dart';
import 'package:usea_app/Student_Dashboard/Student_Schedule/UI_Schedule/Schedule.dart';
import 'package:usea_app/Student_Dashboard/Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';

import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';

class Student_Home extends StatefulWidget {
  final dynamic dataDetail;
  final List<JobHistory> data_jobhistory;
  final List<StDetail> data_stdetail;
  Student_Home(
      {Key? key,
      required this.dataDetail,
      required this.data_jobhistory,
      required this.data_stdetail})
      : super(key: key);

  @override
  State<Student_Home> createState() => _Student_HomeState();
}

List<Home_Screen> home_screen = [
  Home_Screen(
    name: 'កាលវិភាគ',
    img: 'assets/image/Stu_Schedule.png',
    screen: Schedule(),
  ),
  Home_Screen(
    name: 'ដំណើរការសិក្សា',
    img: 'assets/image/Stu_Performance.png',
    screen: Performance(),
  ),
  Home_Screen(
    name: 'វត្តមាន',
    img: 'assets/image/Stu_Attendance.png',
    screen: Attendance(),
  ),
  Home_Screen(
    name: 'ការបង់ប្រាក់',
    img: 'assets/image/Stu_Payment.png',
    screen: Payment(),
  ),
  Home_Screen(
    name: 'ប្រវត្តិការងារ',
    img: 'assets/image/Stu_Job_History.png',
    screen: InkWell(
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ព័ត៌មានការសិក្សា',
    img: 'assets/image/Stu_Study_Info.png',
    screen: Study_Info(),
  ),
  Home_Screen(
    name: 'មតិកែលម្អ',
    img: 'assets/image/Stu_Survey.png',
    screen: InkWell(
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'សម្មិទ្ធផល',
    img: 'assets/image/Stu_Achievement.png',
    screen: Achievements(),
  ),
];

class _Student_HomeState extends State<Student_Home> {
  int activeIndex = 0;

  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");

  String getImage(String image) {
    return 'http://192.168.3.34/hosting_api/Student/profile_pic/$image';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/image/usea_logo.png',
                      scale: 30,
                    ),
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
                              color: Theme.of(context).primaryColor,
                              fontSize: 11,
                              fontFamily: 'KhmerOSmuol'),
                        ),
                        Text(
                          'UNIVERSITY OF SOUTH-EAST ASIA',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
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
                      dataDetail: widget.data_stdetail,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  getImage(widget.data_stdetail[0].profile_pic),
                ),
                radius: 25,
              ),
            ),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 175,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 58},
                        {'domain': 'React Native', 'measure': 20},
                        {'domain': 'React JS', 'measure': 22},
                      ],
                      fillColor: (pieData, index) =>
                          Theme.of(context).copyWith().primaryColor,
                      donutWidth: 30,
                      labelColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.circle,
                                color: Colors.orange,
                              ),
                            ),
                            Text('ចំនួនក្រឌីតសរុប'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.circle,
                                color: Colors.blue[900],
                              ),
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
                  home_screen.length,
                  (index) => Card(
                    elevation: 3,
                    shadowColor: Colors.grey[200],
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
                                  data_jobhistory: widget.data_jobhistory),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    home_screen[index].screen),
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
                              home_screen[index].img,
                              scale: 6,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              home_screen[index].name.tr,
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
        ),
      ),
    );
  }
}