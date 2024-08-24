// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
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
import 'FullScreenImage.dart';

class Guest_Home extends StatefulWidget {
  const Guest_Home({Key? key}) : super(key: key);

  @override
  State<Guest_Home> createState() => _Guest_HomeState();
}

class _Guest_HomeState extends State<Guest_Home> {
  final Uri urlWeb = Uri.parse(APIUrlGuest + "en/Pages/index.php");
  late List<Class_Image> image_slides = [];
  int activeIndex = 0;

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
          APIUrlGuest + "api/webapi.php?action=slide_home",
        ),
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
      print('Failed to fetch guest home: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

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

  void _launchYoutube() async {
    final String urlYt = "https://youtube.com/@usea-edu-kh?si=O-C7zB1vDD6KjP0z";

    if (await canLaunch(urlYt)) {
      await launch(urlYt);
    } else {
      throw 'Could not launch $urlYt';
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
    final String tiktokUrl = "https://www.tiktok.com/@usea_siemreap";

    if (await canLaunch(tiktokUrl)) {
      await launch(tiktokUrl);
    } else {
      throw 'Could not launch $tiktokUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildIndicator() {
      return image_slides.length > 0
          ? Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: image_slides.length,
                effect: WormEffect(
                  activeDotColor: UPrimaryColor,
                  dotColor: UGreyColor,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            )
          : SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildUniversityName(
              UPrimaryColor,
            ),
            Row(
              children: [
                Card(
                  elevation: 1,
                  color: UBackgroundColor,
                  shadowColor: ULightGreyColor,
                  surfaceTintColor: UBtnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: UBtnColor,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: IconButton(
                            highlightColor: UTransParentColor,
                            splashColor: UTransParentColor,
                            onPressed: () {
                              setState(
                                () {
                                  Get.to(
                                    () => Notifications(),
                                    transition: Transition.rightToLeftWithFade,
                                    duration: const Duration(
                                      milliseconds: 100,
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
                        Positioned(
                          top: UPdMg12,
                          right: UPdMg10,
                          child: Container(
                            height: UHeight5,
                            width: UHeight5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                              color: UTransParentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildWidth5(),
              ],
            ),
          ],
        ),
        titleSpacing: UWidth5,
        toolbarHeight: 75,
        centerTitle: false,
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 175,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: UPdMg5,
              ),
              margin: const EdgeInsets.only(
                top: UPdMg10,
              ),
              child: isLoading
                  ? FutureBuilder(
                      future: Future.delayed(
                        const Duration(
                          seconds: 5,
                        ),
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: const CircularProgressIndicator(
                              color: UPrimaryColor,
                            ),
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  imageAsset + 'no_data.png',
                                  scale: 4,
                                ),
                                buildHeight10(),
                                Text(
                                  'គ្មានទិន្ន័យ'.tr,
                                  style: const TextStyle(
                                    color: UPrimaryColor,
                                    fontSize: UTitleSize,
                                    fontWeight: UTitleWeight,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    )
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 175,
                        autoPlayInterval: const Duration(
                          seconds: 10,
                        ),
                        autoPlay: true,
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
                          return InkWell(
                            highlightColor: UTransParentColor,
                            splashColor: UTransParentColor,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage1(
                                    imageUrls: image_slides
                                        .map((image) => image.image_url)
                                        .toList(),
                                    currentIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: UPdMg5,
                              ),
                              width: UFullWidth,
                              height: UFullWidth,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  URoundedLarge,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: image_slide,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Image.asset(
                            imageAsset + "Error_Image.jpg",
                            fit: BoxFit.cover,
                          );
                        }
                      },
                    ),
            ),
            buildHeight7(),
            buildIndicator(),
            buildHeight7(),
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
                guest_home_screen.length,
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
                      if (index.isEqual(8)) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Change_Language();
                          },
                        );
                      } else {
                        Get.to(
                          () => guest_home_screen[index].screen,
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(
                            milliseconds: 100,
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: UPdMg15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            guest_home_screen[index].img,
                            scale: UScale6,
                          ),
                          const SizedBox(
                            height: UHeight7,
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
            buildHeight7(),
            Card(
              elevation: 1.5,
              color: UBackgroundColor,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  URoundedLarge,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(
                UPdMg10,
                UZeroPixel,
                UPdMg10,
                UPdMg5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  UPdMg10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildContainerSM(
                      () => _launchFacebookPage(),
                      imageAsset + 'SM_Facebook.png',
                    ),
                    BuildContainerSM(
                      () => _launchInstagram(),
                      imageAsset + 'SM_IG.png',
                    ),
                    BuildContainerSM(
                      () => _launchYoutube(),
                      imageAsset + 'SM_Yt.png',
                    ),
                    BuildContainerSM(
                      () => openTelegramGroup(),
                      imageAsset + 'SM_Telegram.png',
                    ),
                    BuildContainerSM(
                      () => launchUrl(urlWeb),
                      imageAsset + 'SM_Website.png',
                    ),
                    BuildContainerSM(
                      () => openTiktok(),
                      imageAsset + 'SM_TK.png',
                    )
                  ],
                ),
              ),
            ),
            buildHeight15(),
          ],
        ),
      ),
    );
  }
}
