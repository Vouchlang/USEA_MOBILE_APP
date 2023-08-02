import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");
  final Uri urlIg =
      Uri.parse("https://www.instagram.com/university_of_south_east_asia/");
  final Uri urlYt = Uri.parse("https://www.youtube.com/@usea-edu-kh");
  final Uri urlTel = Uri.parse("https://t.me/university_of_south_east_asia");
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
        Uri.parse(
            "http://192.168.1.51/hosting_api/Guest/fetch_guest_image_slideshow.php"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        setState(() {
          image_slides = r.map((e) => Class_Image.fromJson(e)).toList();
        });
      } else {
        setState(() {
          image_slides = [Class_Image.fromJson(r)];
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String image_slide, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: UFullWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image_slide,
              fit: BoxFit.cover,
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
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: isLoading
                  ? CircularProgressIndicator() // Show a loading indicator while fetching data
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                        height: double.infinity,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
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
                          return buildImage("fallback_image_path", index);
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
                  guest_home_screen.length,
                  (index) => Card(
                    elevation: 2,
                    shadowColor: ULightGreyColor,
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
                                    guest_home_screen[index].screen),
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
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              elevation: 2,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(urlFb);
                      },
                      child: Image.asset(
                        'assets/image/SM_Facebook.png',
                        scale: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(urlIg);
                      },
                      child: Image.asset(
                        'assets/image/SM_IG.png',
                        scale: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(urlYt);
                      },
                      child: Image.asset(
                        'assets/image/SM_Yt.png',
                        scale: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(urlTel);
                      },
                      child: Image.asset(
                        'assets/image/SM_Telegram.png',
                        scale: 5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(urlWeb);
                      },
                      child: Image.asset(
                        'assets/image/SM_Website.png',
                        scale: 5,
                      ),
                    ),
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
