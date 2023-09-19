// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_Career/Class_Career.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Career extends StatefulWidget {
  const Career({Key? key}) : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  List<Class_Career> career = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? APIUrlGuest + "api/webapi.php?action=career_kh"
            : APIUrlGuest + "api/webapi.php?action=career_en"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        career = r.map((e) => Class_Career.fromJson(e)).toList();
      } else {
        career = [Class_Career.fromJson(r)];
      }
    } catch (e) {
      print('Error fetching data: $e');
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
      appBar: Custom_AppBar(title: 'មជ្ឈមណ្ឌលការងារ'.tr),
      body: Center(
        child: career.isEmpty
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
            : ListView.builder(
                padding:
                    EdgeInsets.symmetric(vertical: UPdMg_10, horizontal: 20),
                itemCount: career.length,
                itemBuilder: (context, index) {
                  final isFinalIndex = index == career.length - 1;
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: isFinalIndex ? UPdMg_10 : 0),
                    child: Container(
                      padding: EdgeInsets.only(top: UPdMg_5),
                      child: InkWell(
                        onTap: () {
                          void _launchCareerUrl() async {
                            if (await canLaunch(career[index].link)) {
                              await launch(career[index].link);
                            } else {
                              throw 'Could not launch ${career[index].link}';
                            }
                          }

                          _launchCareerUrl();
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 75,
                                    height: 75,
                                    child: Image.network(
                                      career[index].logo,
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextTheme(
                                        career[index].position,
                                        UTitleSize,
                                        UPrimaryColor,
                                        UTitleWeight,
                                      ),
                                      SizedBox(
                                        height: UHeight5,
                                      ),
                                      BodyTheme(
                                        career[index].organization,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (!isFinalIndex)
                              Divider(
                                thickness: 0.5,
                                height: 25,
                                color: UGreyColor,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
