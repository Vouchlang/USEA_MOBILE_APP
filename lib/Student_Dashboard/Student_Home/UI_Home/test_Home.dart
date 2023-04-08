import 'package:carousel_slider/carousel_slider.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_ChangeLanguage/Change_Language.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';
import '../../../Guest_Dashboard/Guest_AboutUS/UI_AboutUS/AboutUS.dart';
import '../../../Guest_Dashboard/Guest_Career/UI_Career/Career.dart';
import '../../../Guest_Dashboard/Guest_Contact/UI_Contact/Contact.dart';
// import '../../../Guest_Dashboard/Guest_FAQ/UI_FAQ/FAQ.dart';
import '../../../Guest_Dashboard/Guest_Notification/UI_Notification/Notifications.dart';
import '../../../Guest_Dashboard/Guest_Program/UI_Program/Program.dart';
import '../../../Guest_Dashboard/Guest_Registration/UI_Registration/Registration.dart';
import '../../../Guest_Dashboard/Guest_Scholarship/UI_Scholarship/Scholarship.dart';
import '../../../Guest_Dashboard/Guest_VDO/UI_VDO/Video.dart';

class Student_Home1 extends StatefulWidget {
  const Student_Home1({Key? key}) : super(key: key);

  @override
  State<Student_Home1> createState() => _Student_Home1State();
}

List<Home_Screen> home_screen = [
  Home_Screen(
    name: 'កាលវិភាគ',
    img: 'assets/image/stu_event.png',
    screen: New_Event(),
  ),
  Home_Screen(
    name: 'ដំណើរការសិក្សា',
    img: 'assets/image/stu_process.png',
    screen: Registration(),
  ),
  Home_Screen(
    name: 'វត្តមាន',
    img: 'assets/image/stu_attendance.png',
    screen: Program(),
  ),
  Home_Screen(
    name: 'ការបង់ប្រាក់',
    img: 'assets/image/stu_wallet.png',
    screen: Scholarship(),
  ),
  Home_Screen(
    name: 'ប្រវត្តិការងារ',
    img: 'assets/image/stu_history.png',
    screen: Career(),
  ),
  Home_Screen(
    name: 'ព័ត៍មានការសិក្សា',
    img: 'assets/image/stu_info.png',
    screen: Video_UI(),
  ),
  Home_Screen(
    name: 'មតិកែលម្អ',
    img: 'assets/image/stu_servay.png',
    screen: Contact(),
  ),
  Home_Screen(
    name: 'សម្មិទ្ធផល',
    img: 'assets/image/student_result.png',
    screen: AboutUS(),
  ),
];

class _Student_Home1State extends State<Student_Home1> {
  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");
  final Uri urlIg =
      Uri.parse("https://ww3.read-onepiece.net/manga/one-piece-chapter-1059/");
  final Uri urlYt =
      Uri.parse("https://www.youtube.com/@universityofsouth-eastasia8619");
  final Uri urlTel = Uri.parse("https://t.me/cpsteamsports");
  final Uri urlWeb = Uri.parse("http://www.usea.edu.kh/");

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final image_slides = [
      'assets/image/1.jpg',
      'assets/image/2.jpg',
      'assets/image/3.jpg',
      'assets/image/4.jpg',
      'assets/image/5.jpg',
    ];

    Widget buildImage(String image_slide, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          color: Colors.grey[200],
          width: double.infinity,
          child: Image.asset(
            image_slide,
            fit: BoxFit.cover,
          ),
        );

    Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: image_slides.length,
        effect: WormEffect(
            activeDotColor: Color(0xFF1A237E),
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8));

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
              // width: double.infinity,
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
            // Center(
            //   child: buildIndicator(),
            // ),
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
                        if (index.isEqual(8)) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Change_Language();
                            },
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
