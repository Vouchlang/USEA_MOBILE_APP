import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Guest_API.dart';
import '../Class_ImageSlide/Class_ImageSlide.dart';
import '/Guest_Dashboard/Guest_ChangeLanguage/Change_Language.dart';
import '/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import '/theme_builder.dart';
import '../../Guest_Notification/UI_Notification/Notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Custom_Build_Guest_Home.dart';
import 'FullScreenImage.dart';

class Guest_Home extends StatefulWidget {
  const Guest_Home({Key? key}) : super(key: key);

  @override
  State<Guest_Home> createState() => _Guest_HomeState();
}

class _Guest_HomeState extends State<Guest_Home> {
  late bool hasInternet = true;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late bool isNoInternetBannerVisible = false;
  late Color bannerColor = UScoreColor;
  late List<Class_Image> image_slides = [];
  late int activeIndex = 0;
  late bool isLoading = true;
  late final LaunchUrl getLaunchUrl = LaunchUrl();

  @override
  void initState() {
    super.initState();
    getImageData();
    checkInternetConnection();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result != ConnectivityResult.none) {
          getImageData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUniversityName(UPrimaryColor),
            Row(
              children: [
                Card(
                  elevation: 1,
                  color: UBackgroundColor,
                  shadowColor: ULightGreyColor,
                  surfaceTintColor: UBtnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => Notifications(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 100),
                    ),
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: UBtnColor,
                      ),
                      child: const Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: UTransParentColor,
                            child: Icon(
                              Icons.notifications,
                              color: UPrimaryColor,
                              size: 20,
                            ),
                          ),
                          // Positioned(
                          //   top: UPdMg12,
                          //   right: UPdMg10,
                          //   child: Container(
                          //     height: UHeight5,
                          //     width: UHeight5,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(
                          //         50,
                          //       ),
                          //       color: URedColor,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
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
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              buildImageSlide(),
              buildHeight7(),
              buildIndicator(),
              buildHeight7(),
              buildGuestGrid(),
              buildHeight7(),
              buildSocialMediaCard(
                btnFb: BuildContainerSM(
                  onTap: () => getLaunchUrl.launchFacebookPage(),
                  imageName: imageAsset + 'SM_Facebook.png',
                ),
                btnInsta: BuildContainerSM(
                  onTap: () => getLaunchUrl.launchInstagram(),
                  imageName: imageAsset + 'SM_IG.png',
                ),
                btnYt: BuildContainerSM(
                  onTap: () => getLaunchUrl.launchYoutube(),
                  imageName: imageAsset + 'SM_Yt.png',
                ),
                btnTele: BuildContainerSM(
                  onTap: () => getLaunchUrl.launchTelegramGroup(),
                  imageName: imageAsset + 'SM_Telegram.png',
                ),
                btnWeb: BuildContainerSM(
                  onTap: () => launchUrlString(UrlWebsite),
                  imageName: imageAsset + 'SM_Website.png',
                ),
                btnTiktok: BuildContainerSM(
                  onTap: () => getLaunchUrl.launchTiktok(),
                  imageName: imageAsset + 'SM_TK.png',
                ),
              ),
              buildHeight15(),
            ],
          ),
          if (isNoInternetBannerVisible)
            buildPositionNoConnection(
              bannerColor: bannerColor.withOpacity(0.9),
              text: hasInternet ? 'អ៊ីនធឺណិតបានត្រឡប់មកវិញ...'.tr : 'គ្មានការតភ្ជាប់អ៊ីនធឺណិត...'.tr,
            ),
        ],
      ),
    );
  }

  Widget buildImageSlide() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.95,
      width: UFullWidth,
      padding: const EdgeInsets.symmetric(horizontal: UPdMg5),
      margin: const EdgeInsets.only(top: UPdMg10),
      child: isLoading
          ? FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 5),
              ),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: UPrimaryColor),
                  );
                } else {
                  return Column(
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
                  );
                }
              },
            )
          : CarouselSlider.builder(
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 10),
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                onPageChanged: ((index, reason) => setState(() => activeIndex = index)),
              ),
              itemCount: image_slides.length,
              itemBuilder: (context, index, realIndex) {
                if (index >= 0 && index < image_slides.length) {
                  final image_slide = image_slides[index].image_url;
                  return InkWell(
                    highlightColor: UTransParentColor,
                    splashColor: UTransParentColor,
                    onTap: () => Get.to(
                      () => FullScreenImage1(
                        imageUrls: image_slides.map((image) => image.image_url).toList(),
                        currentIndex: index,
                      ),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 100),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: UPdMg5),
                      width: UFullWidth,
                      height: UFullWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(URoundedLarge),
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
    );
  }

  Widget buildIndicator() {
    return image_slides.length > 0
        ? Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: image_slides.length,
              effect: const WormEffect(
                activeDotColor: UPrimaryColor,
                dotColor: UGreyColor,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget buildGuestGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 3.5,
      crossAxisSpacing: 3,
      childAspectRatio: 1.90,
      padding: const EdgeInsets.symmetric(horizontal: UPdMg7),
      children: List.generate(
        guest_home_screen.length,
        (index) => Card(
          elevation: 1.5,
          color: UBackgroundColor,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          child: buildGuestGridBtn(
            onTap: () {
              if (index.isEqual(8)) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => Change_Language(),
                );
              } else {
                Get.to(
                  () => guest_home_screen[index].screen,
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              }
            },
            image: guest_home_screen[index].img,
            name: guest_home_screen[index].name.tr,
          ),
        ),
      ),
    );
  }

  void checkInternetConnection() async {
    // Check initial connection
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      hasInternet = connectivityResult != ConnectivityResult.none;
      isNoInternetBannerVisible = !hasInternet;
      bannerColor = hasInternet ? UScoreColor : URedColor;
    });

    // Listen to connection changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          // Internet is lost
          if (hasInternet) {
            setState(() {
              hasInternet = false;
              isNoInternetBannerVisible = true;
              bannerColor = URedColor;
            });
          }
        } else if (result != ConnectivityResult.none) {
          // Internet is restored
          if (!hasInternet) {
            setState(() {
              hasInternet = true;
              isNoInternetBannerVisible = true;
              bannerColor = UScoreColor;
            });

            // Hide the banner after a short delay
            Timer(const Duration(seconds: 3), () {
              if (mounted) {
                setState(
                  () => isNoInternetBannerVisible = false,
                );
              }
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> getImageData() async {
    try {
      var res = await http.get(
        Uri.parse(APIGuestSlide),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        if (mounted) {
          setState(
            () => image_slides = r.map((e) => Class_Image.fromJson(e)).toList(),
          );
        }
      } else {
        if (mounted) {
          setState(
            () => image_slides = [Class_Image.fromJson(r)],
          );
        }
      }
    } catch (e) {
      print('Failed to fetch guest home: $e');
    } finally {
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }
}
