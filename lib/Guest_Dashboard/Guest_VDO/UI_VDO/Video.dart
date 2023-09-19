import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Custom_Widget/CustomText.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import '../Class_VDO/Class_Video.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Video_Display_Second.dart';

class Video_UI extends StatefulWidget {
  Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  List<VDO_Class> vdo = [];
  bool isLoading = true;
  final Uri urlYt =
      Uri.parse("https://youtube.com/@usea-edu-kh?si=O-C7zB1vDD6KjP0z");

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? APIUrlGuest + "api/webapi.php?action=yt_video"
            : APIUrlGuest + "api/webapi.php?action=yt_video"),
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
      print('Error fetching data: $e');
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
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: vdo.isEmpty
          ? Center(
              child: FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 10)),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? Text('គ្មានទិន្ន័យ'.tr)
                        : CircularProgressIndicator(
                            color: UPrimaryColor,
                          ),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(UPdMg_10),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: UPdMg_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: UPdMg_5,
                              horizontal: UPdMg_10,
                            ),
                            child: Text(
                              'វីដេអូពី Youtube'.tr,
                              style: TextStyle(
                                fontSize: UTitleSize16,
                                fontWeight: UTitleWeight,
                                color: UPrimaryColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              void _launchOutUniUrl() async {
                                if (await launchUrl(urlYt)) {
                                  await launchUrl(urlYt);
                                } else {
                                  throw 'Could not launch ${urlYt}';
                                }
                              }

                              _launchOutUniUrl();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    vertical: UPdMg_5,
                                  ),
                                  child: Text(
                                    'មើលទាំងអស់ '.tr,
                                    style: TextStyle(
                                      fontSize: UBodySize,
                                      fontWeight: UBodyWeight,
                                      color: UPrimaryColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 1),
                                  child: Icon(
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
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: vdo.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => Video_Display(
                                data: vdo[index],
                                vdo: vdo,
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: UPdMg_10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(UPdMg_10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            vdo[index].youtube_thumbnail,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: UWidth10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          buildListText(vdo[index].title, 2,
                                              UTitleSize, UTitleWeight),
                                          SizedBox(
                                            height: UHeight5,
                                          ),
                                          buildListText(vdo[index].caption, 2,
                                              UBodySize10, UBodyWeight),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
