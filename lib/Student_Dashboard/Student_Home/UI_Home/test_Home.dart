import 'package:carousel_slider/carousel_slider.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_ChangeLanguage/Change_Language.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Student_Dashboard/Student_Achievements/UI_Achievements/Achievements.dart';
import 'package:usea_app/Student_Dashboard/Student_Attendance/UI_Attendance/Attendance.dart';
import 'package:usea_app/Student_Dashboard/Student_JobHistory/UI_JobHistory/JosHistory.dart';
import 'package:usea_app/Student_Dashboard/Student_Payment/UI_Payment/Payment.dart';
import 'package:usea_app/Student_Dashboard/Student_Performance/UI_Perfomance/Performance.dart';
import 'package:usea_app/Student_Dashboard/Student_Schedule/Schedule.dart';
import 'package:usea_app/Student_Dashboard/Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';
import '../../../Guest_Dashboard/Guest_Contact/UI_Contact/Contact.dart';
import '../../../Guest_Dashboard/Guest_Notification/UI_Notification/Notifications.dart';

class Student_Home1 extends StatefulWidget {
  const Student_Home1({Key? key}) : super(key: key);

  @override
  State<Student_Home1> createState() => _Student_Home1State();
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
    screen: Job_History(),
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

class _Student_Home1State extends State<Student_Home1> {
  int activeIndex = 0;
  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: Colors.indigo[900],
                              fontSize: 11,
                              fontFamily: 'KhmerOSmuol'),
                        ),
                        Text('UNIVERSITY OF SOUTH-EAST ASIA',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200]),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Notifications(),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.indigo[900],
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 175,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DChartPie(
                      data: [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                        {'domain': 'Ionic', 'measure': 20},
                        {'domain': 'Cordova', 'measure': 15},
                      ],
                      fillColor: (pieData, index) =>
                          Color.fromARGB(255, 14, 31, 124),
                      donutWidth: 30,
                      labelColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: const Text('data one'),
                        ),
                        Container(
                          child: const Text('data two'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 7,
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
                            Text(home_screen[index].name.tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang'))
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
