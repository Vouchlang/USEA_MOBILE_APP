import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_Career/Class_Career.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Career extends StatefulWidget {
  const Career({Key? key}) : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  List<Class_Career> career = [];
  bool isLoading = true;
  int currentPage = 0;
  final int resultsPerPage = 10;
  int startPage = 0;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + "api/webapi.php?action=career_kh"
              : APIUrlGuest + "api/webapi.php?action=career_en",
        ),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        career = r.map((e) => Class_Career.fromJson(e)).toList();
      } else {
        career = [Class_Career.fromJson(r)];
      }
    } catch (e) {
      print('Failed to fetch career: $e');
      // handle the error here
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'មជ្ឈមណ្ឌលការងារ'.tr,
      ),
      body: career.isEmpty
          ? buildFutureBuild()
          : ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: UPdMg10,
                    horizontal: UPdMg7,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (int i = 0;
                        i <
                            min(
                              resultsPerPage,
                              (career.length - (currentPage * resultsPerPage)),
                            );
                        i++)
                      Card(
                        elevation: 1.5,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            UPdMg10,
                          ),
                          child: InkWell(
                            highlightColor: UTransParentColor,
                            splashColor: UTransParentColor,
                            onTap: () {
                              void _launchCareerUrl() async {
                                if (await canLaunchUrlString(
                                    career[(currentPage * resultsPerPage) + i]
                                        .link)) {
                                  await launchUrlString(
                                      career[(currentPage * resultsPerPage) + i]
                                          .link);
                                } else {
                                  throw 'Could not launch ${career[(currentPage * resultsPerPage) + i].link}';
                                }
                              }

                              _launchCareerUrl();
                            },
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 75,
                                      child: career[(currentPage *
                                                      resultsPerPage) +
                                                  i]
                                              .logo
                                              .isEmpty
                                          ? Image.asset(
                                              imageAsset + 'Error_Image.jpg',
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: career[(currentPage *
                                                          resultsPerPage) +
                                                      i]
                                                  .logo,
                                            ),
                                    ),
                                    buildWidth15(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextTheme(
                                            career[(currentPage *
                                                            resultsPerPage) +
                                                        i]
                                                    .position
                                                    .isEmpty
                                                ? 'N/A'
                                                : career[(currentPage *
                                                            resultsPerPage) +
                                                        i]
                                                    .position,
                                            UTitleSize,
                                            UPrimaryColor,
                                            UTitleWeight,
                                          ),
                                          buildHeight5(),
                                          CareerBody(
                                            career[(currentPage *
                                                            resultsPerPage) +
                                                        i]
                                                    .organization
                                                    .isEmpty
                                                ? 'N/A'
                                                : career[(currentPage *
                                                            resultsPerPage) +
                                                        i]
                                                    .organization,
                                          ),
                                          buildHeight5(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                imageAsset + 'Event_Date.png',
                                                scale: 12,
                                              ),
                                              buildWidth5(),
                                              Expanded(
                                                child: CareerBody(
                                                  career[(currentPage *
                                                                  resultsPerPage) +
                                                              i]
                                                          .expired_date
                                                          .isEmpty
                                                      ? 'N/A'
                                                      : career[(currentPage *
                                                                  resultsPerPage) +
                                                              i]
                                                          .expired_date,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                buildHeight5(),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    UPdMg10,
                    UZeroPixel,
                    UPdMg10,
                    UPdMg15,
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
                                  (career.length / resultsPerPage).ceil()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  startPage = 0;
                                  currentPage = 0;
                                });
                              },
                              child: Icon(
                                Icons.first_page,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                      //move backward button
                      startPage > 0 &&
                              ((MediaQuery.of(context).size.width - 210) / 30)
                                      .floor() <
                                  (career.length / resultsPerPage).ceil()
                          ? InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  currentPage--;
                                  startPage--;
                                });
                              },
                              child: Icon(
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
                                  (career.length / resultsPerPage).ceil());
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
                            width: 30,
                            height: 30,
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
                      (career.length / resultsPerPage).ceil() >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor() &&
                              ((career.length / resultsPerPage).ceil() -
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
                              child: Icon(
                                Icons.navigate_next,
                                color: UPrimaryColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                      //last page button
                      (career.length / resultsPerPage).ceil() >
                                  ((MediaQuery.of(context).size.width - 210) /
                                          30)
                                      .floor() &&
                              ((career.length / resultsPerPage).ceil() -
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
                                      (career.length / resultsPerPage).ceil() -
                                          ((MediaQuery.of(context).size.width -
                                                      210) /
                                                  30)
                                              .floor();
                                  currentPage =
                                      (career.length / resultsPerPage).ceil() -
                                          1;
                                });
                              },
                              child: Icon(
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
