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
              shrinkWrap: true,
              itemCount: recognition.length,
              padding: const EdgeInsets.only(
                top: UPdMg5,
              ),
              itemBuilder: (context, index) {
                final isFinalIndex = index == recognition.length - 1;
                return Card(
                  elevation: 1,
                  color: UBackgroundColor,
                  shadowColor: ULightGreyColor,
                  margin: EdgeInsets.fromLTRB(
                    UPdMg10,
                    UPdMg10,
                    UPdMg10,
                    isFinalIndex ? UPdMg15 : UZeroPixel,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(
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
                                ? imageAsset + 'Error_Image.jpg'
                                : recognition[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        buildWidth10(),
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
                                style: const TextStyle(
                                  fontSize: UTitleSize,
                                  fontWeight: UTitleWeight,
                                ),
                              ),
                              buildHeight10(),
                              Container(
                                alignment: Alignment.centerRight,
                                child: buildNavBtn(
                                  () {
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
                                  'អានបន្ថែម',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
