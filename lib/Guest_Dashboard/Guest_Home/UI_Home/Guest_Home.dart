import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_ChangeLanguage/Change_Language.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';
import '../../Guest_AboutUS/UI_AboutUS/AboutUS.dart';
import '../../Guest_Career/UI_Career/Career.dart';
import '../../Guest_Contact/UI_Contact/Contact.dart';
import '../../Guest_FAQ/UI_FAQ/FAQ.dart';
import '../../Guest_Notification/UI_Notification/Notifications.dart';
import '../../Guest_Program/UI_Program/Program.dart';
import '../../Guest_Registration/UI_Registration/Registration.dart';
import '../../Guest_Scholarship/UI_Scholarship/Scholarship.dart';
import '../../Guest_VDO/UI_VDO/Video.dart';

class Guest_Home extends StatefulWidget {
  const Guest_Home({Key? key}) : super(key: key);

  @override
  State<Guest_Home> createState() => _Guest_HomeState();
}

List<Home_Screen> home_screen = [
  Home_Screen(
    name: 'ព្រឹត្តិការណ៍',
    img: 'assets/image/Guest_News.png',
    screen: New_Event(),
  ),
  Home_Screen(
    name: 'ការចុះឈ្មោះ',
    img: 'assets/image/Guest_Regis.png',
    screen: Registration(),
  ),
  Home_Screen(
    name: 'កម្មវិធីសិក្សា',
    img: 'assets/image/Guest_Program.png',
    screen: Program(),
  ),
  Home_Screen(
    name: 'អាហារូបករណ៍',
    img: 'assets/image/Guest_Scholarship.png',
    screen: Scholarship(),
  ),
  Home_Screen(
    name: 'ព័ត៌មានការងារ',
    img: 'assets/image/Guest_Career.png',
    screen: Career(),
  ),
  Home_Screen(
    name: 'វីដេអូ',
    img: 'assets/image/Guest_VDO.png',
    screen: Video_UI(),
  ),
  Home_Screen(
    name: 'ទំនាក់ទំនង',
    img: 'assets/image/Guest_Contact.png',
    screen: Contact(),
  ),
  Home_Screen(
    name: 'អំពីយើង',
    img: 'assets/image/Guest_About.png',
    screen: AboutUS(),
  ),
  Home_Screen(
    name: 'ផ្លាស់ប្ដូរភាសា',
    img: 'assets/image/Guest_Language.png',
    screen: Change_Language(),
  ),
  Home_Screen(
    name: 'FAQ',
    img: 'assets/image/Guest_QA.png',
    screen: FAQ(),
  ),
];

class _Guest_HomeState extends State<Guest_Home> {
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
            Row(
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
                Column(
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
              ],
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
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => Notifications()));
                        });
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.indigo[900],
                        size: 20,
                      )),
                )),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
          child: ListView(shrinkWrap: true, children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 175,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Flexible(
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: double.infinity,
                        // autoPlay: true,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
                        // viewportFraction: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        onPageChanged: ((index, reason) =>
                            setState(() => activeIndex = index)),
                      ),
                      itemCount: image_slides.length,
                      itemBuilder: (context, index, realIndex) {
                        final image_slide = image_slides[index];
                        return buildImage(image_slide, index);
                      }),
                ),
              )),
        ),
        SizedBox(
          height: 7,
        ),
        Center(
          child: buildIndicator(),
        ),
        SizedBox(
          height: 7,
        ),
        Container(
          child: Expanded(
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              childAspectRatio: 1.90,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return home_screen[index].screen;
                                });
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
                      )),
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  launchUrl(urlFb);
                },
                icon: Image.asset('assets/image/SM_Facebook.png'),
              ),
              IconButton(
                onPressed: () {
                  launchUrl(urlIg);
                },
                icon: Image.asset('assets/image/SM_IG.png'),
              ),
              IconButton(
                onPressed: () {
                  launchUrl(urlYt);
                },
                icon: Image.asset('assets/image/SM_Yt.png'),
              ),
              IconButton(
                onPressed: () {
                  launchUrl(urlTel);
                },
                icon: Image.asset('assets/image/SM_Telegram.png'),
              ),
              IconButton(
                onPressed: () {
                  launchUrl(urlWeb);
                },
                icon: Image.asset('assets/image/SM_Website.png'),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}

// child: ImageSlideshow(
//   children: [
//     Image.asset(
//       'assets/image/1.jpg',
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       'assets/image/2.jpg',
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       'assets/image/3.jpg',
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       'assets/image/4.jpg',
//       fit: BoxFit.cover,
//     ),
//   ],
// ),
