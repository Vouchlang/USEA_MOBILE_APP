import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Guest_API.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import '../Class_VDO/Class_Video.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Custom_Build_Video.dart';
import 'Video_Display.dart';
import 'dart:math';

class Video_UI extends StatefulWidget {
  Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  late List<VDO_Class> vdo = [];
  late bool isLoading = true;
  late int currentPage = 0;
  late final int resultsPerPage = 10;
  late int startPage = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: vdo.isEmpty
          ? buildFutureBuilder()
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                UPdMg10,
                UPdMg10,
                UPdMg10,
                UPdMg20,
              ),
              physics: const BouncingScrollPhysics(),
              children: [
                buildTitleRow(
                  ontap: () => _launchYoutube(),
                  title1: 'វីដេអូពី Youtube'.tr,
                  title2: 'មើលទាំងអស់ '.tr,
                ),
                buildVdoCard(),
                vdo.length <= resultsPerPage ? const SizedBox.shrink() : buildpagination(),
              ],
            ),
    );
  }

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(APIGuestVideoKh),
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
          () => isLoading = false,
        );
      }
    }
  }

  void _launchYoutube() async {
    if (await canLaunchUrlString(UrlYt)) {
      await launchUrlString(UrlYt);
    } else {
      throw 'Could not launch $UrlYt';
    }
  }

  Widget buildVdoCard() {
    return Column(
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
            margin: const EdgeInsets.only(top: UPdMg10),
            child: InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: () => Get.to(
                () => Video_Display(
                  data: vdo[(currentPage * resultsPerPage) + i],
                  vdo: vdo,
                ),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 100),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImage(vdo[(currentPage * resultsPerPage) + i].youtube_thumbnail),
                  buildWidth10(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: UPdMg5,
                        right: UPdMg7,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildListText(
                            text: vdo[(currentPage * resultsPerPage) + i].title,
                            line: 2,
                            size: UTitleSize,
                            fontWeight: UTitleWeight,
                          ),
                          buildHeight5(),
                          buildListText(
                            text: vdo[(currentPage * resultsPerPage) + i].caption,
                            line: 2,
                            size: UBodySize,
                            fontWeight: UBodyWeight,
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
    );
  }

  Widget buildImage(final String thumbnail) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.165,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(URoundedLarge),
          bottomLeft: Radius.circular(URoundedLarge),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(thumbnail),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildpagination() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: UPdMg10),
      margin: const EdgeInsets.only(top: UPdMg15),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //first page button
          startPage > 0 && ((MediaQuery.of(context).size.width - 210) / 30).floor() < (vdo.length / resultsPerPage).ceil()
              ? InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () => setState(() {
                    startPage = 0;
                    currentPage = 0;
                  }),
                  child: const Icon(
                    Icons.first_page,
                    color: UPrimaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          //move backward button
          startPage > 0 && ((MediaQuery.of(context).size.width - 210) / 30).floor() < (vdo.length / resultsPerPage).ceil()
              ? InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () => setState(() {
                    currentPage--;
                    startPage--;
                  }),
                  child: const Icon(
                    Icons.navigate_before,
                    color: UPrimaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          //numbered page buttons
          for (int i = startPage; i < min((((MediaQuery.of(context).size.width - 210) / 30).floor() + startPage), (vdo.length / resultsPerPage).ceil()); i++)
            InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: () => setState(() => currentPage = i),
              child: CircleAvatar(
                backgroundColor: currentPage == i ? UPrimaryColor : UTransParentColor,
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(
                    color: currentPage == i ? UBackgroundColor : UPrimaryColor,
                    fontFamily: UEFontFamily,
                    fontSize: UTitleSize,
                  ),
                ),
              ),
            ),
          //move forward button
          (vdo.length / resultsPerPage).ceil() > ((MediaQuery.of(context).size.width - 210) / 30).floor() && ((vdo.length / resultsPerPage).ceil() - startPage) > ((MediaQuery.of(context).size.width - 210) / 30).floor()
              ? InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () => setState(() {
                    currentPage++;
                    startPage++;
                  }),
                  child: const Icon(
                    Icons.navigate_next,
                    color: UPrimaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          //last page button
          (vdo.length / resultsPerPage).ceil() > ((MediaQuery.of(context).size.width - 210) / 30).floor() && ((vdo.length / resultsPerPage).ceil() - startPage) > ((MediaQuery.of(context).size.width - 210) / 30).floor()
              ? InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () => setState(() {
                    startPage = (vdo.length / resultsPerPage).ceil() - ((MediaQuery.of(context).size.width - 210) / 30).floor();
                    currentPage = (vdo.length / resultsPerPage).ceil() - 1;
                  }),
                  child: const Icon(
                    Icons.last_page,
                    color: UPrimaryColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
