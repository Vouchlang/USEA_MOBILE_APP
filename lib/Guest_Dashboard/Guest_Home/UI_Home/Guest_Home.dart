// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../Class_ImageSlide/Class_ImageSlide.dart';
import '/Guest_Dashboard/Guest_ChangeLanguage/Change_Language.dart';
import '/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import '/theme_builder.dart';
import '../../Guest_Notification/UI_Notification/Notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Guest_Home extends StatefulWidget {
  const Guest_Home({Key? key}) : super(key: key);

  @override
  State<Guest_Home> createState() => _Guest_HomeState();
}

class _Guest_HomeState extends State<Guest_Home> {
  final Uri urlYt =
      Uri.parse("https://youtube.com/@usea-edu-kh?si=O-C7zB1vDD6KjP0z");
  final Uri urlWeb = Uri.parse("https://www.usea.edu.kh/en/Pages/index.php");

  late List<Class_Image> image_slides = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getImageData();
  }

  Future<void> getImageData() async {
    try {
      var res = await http.get(
        Uri.parse("https://usea.edu.kh/api/webapi.php?action=slide_home"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        if (mounted) {
          setState(() {
            image_slides = r.map((e) => Class_Image.fromJson(e)).toList();
          });
        }
      } else {
        if (mounted) {
          setState(() {
            image_slides = [Class_Image.fromJson(r)];
          });
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  int activeIndex = 0;

  void _launchFacebookPage() async {
    final String facebookPageUrl = "https://www.facebook.com/usea.edu.kh";
    if (await canLaunch(facebookPageUrl)) {
      await launch(facebookPageUrl);
    } else {
      throw 'Could not launch $facebookPageUrl';
    }
  }

  void _launchInstagram() async {
    final String instagramUrl =
        'https://www.instagram.com/university_of_south_east_asia/';

    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  void openTelegramGroup() async {
    final String telegramUrl = "https://t.me/university_of_south_east_asia";

    if (await canLaunch(telegramUrl)) {
      await launch(telegramUrl);
    } else {
      throw 'Could not launch $telegramUrl';
    }
  }

  void openTiktok() async {
    final String tiktokUrl = "https://www.tiktok.com/@university.of.sou";

    if (await canLaunch(tiktokUrl)) {
      await launch(tiktokUrl);
    } else {
      throw 'Could not launch $tiktokUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String image_slide, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: UPdMg_5),
          width: UFullWidth,
          height: UFullWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(URoundedLarge),
            child: Image.network(
              image_slide,
              fit: BoxFit.fill,
            ),
          ),
        );

    Widget buildIndicator() => AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: image_slides.length,
          effect: WormEffect(
            activeDotColor: UPrimaryColor,
            dotColor: UGreyColor,
            dotHeight: 8,
            dotWidth: 8,
          ),
        );

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
                    width: UWidth5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: UBodySize10,
                              fontFamily: 'KhmerOSmuol'),
                        ),
                        Text(
                          'UNIVERSITY OF SOUTH-EAST ASIA',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: UBodySize,
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
                    Icons.notifications,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: USecondaryColor,
        elevation: 1,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: UHeight10,
            ),
            Container(
              height: 175,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: UPdMg_5),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: UPrimaryColor,
                    )
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                        height: double.infinity,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 10),
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        onPageChanged: ((index, reason) =>
                            setState(() => activeIndex = index)),
                      ),
                      itemCount: image_slides.length,
                      itemBuilder: (context, index, realIndex) {
                        if (index >= 0 && index < image_slides.length) {
                          final image_slide = image_slides[index].image_url;
                          return buildImage(image_slide, index);
                        } else {
                          return Image.asset(
                            "assets/image/Error_Image.jpg",
                            fit: BoxFit.fill,
                          );
                        }
                      },
                    ),
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
            GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 3.5,
              crossAxisSpacing: 3,
              childAspectRatio: 1.90,
              padding: EdgeInsets.symmetric(horizontal: 7),
              children: List.generate(
                guest_home_screen.length,
                (index) => Card(
                  elevation: 2,
                  shadowColor: ULightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (index.isEqual(8)) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Change_Language();
                          },
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  guest_home_screen[index].screen),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: UPdMg_15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            guest_home_screen[index].img,
                            scale: 6,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            guest_home_screen[index].name.tr,
                            style: TextStyle(
                              fontSize: UTitleSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              elevation: 2,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(URoundedLarge),
              ),
              margin: EdgeInsets.fromLTRB(UPdMg_10, 0, UPdMg_10, UPdMg_10),
              child: Padding(
                padding: EdgeInsets.all(UPdMg_10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildContainerSM(
                      () => _launchFacebookPage(),
                      'assets/image/SM_Facebook.png',
                    ),
                    BuildContainerSM(
                      () => _launchInstagram(),
                      'assets/image/SM_IG.png',
                    ),
                    BuildContainerSM(
                      () => launchUrl(urlYt),
                      'assets/image/SM_Yt.png',
                    ),
                    BuildContainerSM(
                      () => openTelegramGroup(),
                      'assets/image/SM_Telegram.png',
                    ),
                    BuildContainerSM(
                      () => launchUrl(urlWeb),
                      'assets/image/SM_Website.png',
                    ),
                    BuildContainerSM(
                      () => openTiktok(),
                      'assets/image/SM_TK.png',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
