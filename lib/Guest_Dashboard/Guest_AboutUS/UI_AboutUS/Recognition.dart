// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Class_AboutUS/Class_Recognition.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Recognition extends StatefulWidget {
  const Recognition({Key? key}) : super(key: key);

  @override
  State<Recognition> createState() => _RecognitionState();
}

class _RecognitionState extends State<Recognition> {
  List<Class_Recognition> recognition = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + "api/webapi.php?action=recognition_kh"
              : APIUrlGuest + "api/webapi.php?action=recognition_en",
        ),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        recognition = r.map((e) => Class_Recognition.fromJson(e)).toList();
      } else {
        recognition = [Class_Recognition.fromJson(r)];
      }
    } catch (e) {
      print('Failed to fetch recognition: $e');
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
        title: 'ការទទួលស្គាល់'.tr,
      ),
      body: recognition.isEmpty
          ? buildFutureBuild()
          : ListView.builder(
              itemCount: recognition.length,
              itemBuilder: (context, index) {
                final isFinalIndex = index == recognition.length - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: isFinalIndex ? UPdMg10 : UZeroPixel,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(
                          UPdMg10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 175,
                              width: 125,
                              child: Image.network(
                                recognition[index].image.isEmpty
                                    ? 'assets/image/Error_Image.jpg'
                                    : recognition[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: UWidth10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recognition[index].title.isEmpty
                                        ? 'N/A'
                                        : recognition[index].title,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                    ),
                                  ),
                                  SizedBox(
                                    height: UHeight10,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        void _launchRecognitionUrl() async {
                                          if (await canLaunch(
                                            recognition[index].link,
                                          )) {
                                            await launch(
                                              recognition[index].link,
                                            );
                                          } else {
                                            throw 'Could not launch ${recognition[index].link}';
                                          }
                                        }

                                        _launchRecognitionUrl();
                                      },
                                      child: Container(
                                        width: 80,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(
                                          UPdMg5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            URoundedMedium,
                                          ),
                                          color: UBtnColor,
                                        ),
                                        child: Text(
                                          'អានបន្ថែម'.tr,
                                          style: TextStyle(
                                            fontSize: UBodySize,
                                            fontWeight: UBodyWeight,
                                            color: UPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isFinalIndex) buildDividerAtt(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
