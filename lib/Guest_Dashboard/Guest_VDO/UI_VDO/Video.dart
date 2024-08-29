import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_Widget/CustomText.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import '../Class_VDO/Class_Video.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Video_Display.dart';
import 'dart:math';

class Video_UI extends StatefulWidget {
  Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  late List<VDO_Class> vdo = [];
  bool isLoading = true;
  int currentPage = 0;
  final int resultsPerPage = 5;
  int startPage = 0;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + "api/webapi.php?action=yt_video"
              : APIUrlGuest + "api/webapi.php?action=yt_video",
        ),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        vdo = r.map((e) => VDO_Class.fromJson(e)).toList();
      } else {
        vdo = [
          VDO_Class.fromJson(r),
        ];
      }
    } catch (e) {
      print('Failed to fetch video: $e');
    } finally {
      if (mounted) {
        setState(
          () {
            isLoading = false;
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _launchYoutube() async {
    final String urlYt = "https://youtube.com/@usea-edu-kh?si=O-C7zB1vDD6KjP0z";

    if (await canLaunchUrlString(urlYt)) {
      await launchUrlString(urlYt);
    } else {
      throw 'Could not launch $urlYt';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'វីដេអូ'.tr,
      ),
      body: vdo.isEmpty
          ? buildFutureBuild()
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                UPdMg10,
                UPdMg10,
                UPdMg10,
                UPdMg20,
              ),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: UPdMg5,
                      ),
                      child: Text(
                        'វីដេអូពី Youtube'.tr,
                        style: const TextStyle(
                          fontSize: UTitleSize16,
                          fontWeight: UTitleWeight,
                          color: UPrimaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: UTransParentColor,
                      splashColor: UTransParentColor,
                      onTap: () {
                        _launchYoutube();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'មើលទាំងអស់ '.tr,
                              style: const TextStyle(
                                fontSize: UBodySize,
                                fontWeight: UBodyWeight,
                                color: UPrimaryColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 2,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: UBodySize,
                              color: UPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    for (int i = 0;
                        i <
                            min(
                              resultsPerPage,
                              (vdo.length - (currentPage * resultsPerPage)),
                            );
                        i++)
                      Card(
                        elevation: 1.5,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        margin: const EdgeInsets.only(
                          top: UPdMg10,
                        ),
                        child: InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            Get.to(
                              () => Video_Display(
                                data: vdo[(currentPage * resultsPerPage) + i],
                                vdo: vdo,
                              ),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(
                                milliseconds: 100,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.165,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      URoundedLarge,
                                    ),
                                    bottomLeft: Radius.circular(
                                      URoundedLarge,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          vdo[(currentPage * resultsPerPage) +
                                                  i]
                                              .youtube_thumbnail,
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              buildWidth10(),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: UPdMg5,
                                    right: UPdMg7,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildListText(
                                        vdo[(currentPage * resultsPerPage) + i]
                                            .title,
                                        2,
                                        UTitleSize,
                                        UTitleWeight,
                                      ),
                                      buildHeight5(),
                                      buildListText(
                                        vdo[(currentPage * resultsPerPage) + i]
                                            .caption,
                                        2,
                                        UBodySize,
                                        UBodyWeight,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    UPdMg10,
                    UZeroPixel,
                    UPdMg10,
                    UPdMg10,
                  ),
                  margin: const EdgeInsets.only(
                    top: UPdMg15,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //first page button
                      startPage > 0 &&
                              ((MediaQuery.of(context).size.width - 210) / 30)
                                      .floor() <
                                  (vdo.length / resultsPerPage).ceil()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  startPage = 0;
                                  currentPage = 0;
                                });
                              },
                              child: const Icon(
                                Icons.first_page,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                      //move backward button
                      startPage > 0 &&
                              ((MediaQuery.of(context).size.width - 210) / 30)
                                      .floor() <
                                  (vdo.length / resultsPerPage).ceil()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  currentPage--;
                                  startPage--;
                                });
                              },
                              child: const Icon(
                                Icons.navigate_before,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                      //numbered page buttons
                      for (int i = startPage;
                          i <
                              min(
                                  (((MediaQuery.of(context).size.width - 210) /
                                              30)
                                          .floor() +
                                      startPage),
                                  (vdo.length / resultsPerPage).ceil());
                          i++)
                        InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            setState(() {
                              currentPage = i;
                            });
                          },
                          child: Container(
                            width: UWidth30,
                            height: UHeight30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                              color: currentPage == i
                                  ? UPrimaryColor
                                  : UTransParentColor,
                            ),
                            child: Text(
                              (i + 1).toString(),
                              style: TextStyle(
                                color: currentPage == i
                                    ? UBackgroundColor
                                    : UPrimaryColor,
                                fontFamily: UEFontFamily,
                                fontSize: UTitleSize,
                              ),
                            ),
                          ),
                        ),
                      //move forward button
                      (vdo.length / resultsPerPage).ceil() >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor() &&
                              ((vdo.length / resultsPerPage).ceil() -
                                      startPage) >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  currentPage++;
                                  startPage++;
                                });
                              },
                              child: const Icon(
                                Icons.navigate_next,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                      //last page button
                      (vdo.length / resultsPerPage).ceil() >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor() &&
                              ((vdo.length / resultsPerPage).ceil() -
                                      startPage) >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  startPage =
                                      (vdo.length / resultsPerPage).ceil() -
                                          ((MediaQuery.of(context).size.width -
                                                      210) /
                                                  30)
                                              .floor();
                                  currentPage =
                                      (vdo.length / resultsPerPage).ceil() - 1;
                                });
                              },
                              child: const Icon(
                                Icons.last_page,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
