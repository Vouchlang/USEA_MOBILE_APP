// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/Custom_Widget/CustomText.dart';
import '/Guest_Dashboard/Guest_Scholarship/Class_Scholarship/Class_Scholarship_Out.dart';
import '/theme_builder.dart';

class Out_University extends StatefulWidget {
  const Out_University({Key? key}) : super(key: key);

  @override
  State<Out_University> createState() => _Out_UniversityState();
}

class _Out_UniversityState extends State<Out_University> {
  List<O_Scholarship> o_scholarship = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? "https://usea.edu.kh/api/webapi.php?action=scholarship_o_university_kh"
            : "https://usea.edu.kh/api/webapi.php?action=scholarship_o_university_en"),
      );
      var r = json.decode(res.body);
      if (mounted) {
        if (r is List<dynamic>) {
          o_scholarship = r.map((e) => O_Scholarship.fromJson(e)).toList();
        } else {
          o_scholarship = [O_Scholarship.fromJson(r)];
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
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
      body: Center(
        child: o_scholarship.isEmpty
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
                padding: EdgeInsets.fromLTRB(
                  UPdMg_10,
                  UZeroPixel,
                  UPdMg_10,
                  UZeroPixel,
                ),
                itemCount: o_scholarship.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shadowColor: ULightGreyColor,
                    margin: EdgeInsets.only(bottom: UPdMg_10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(UPdMg_10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme(
                                  o_scholarship[index].o_school_name)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme(
                                  o_scholarship[index].o_educational_level)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme(
                                  o_scholarship[index].o_major)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme('ថ្ងៃផុតកំណត់៖'.tr)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipBodyTheme(
                                  o_scholarship[index].o_expire_date)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: UPdMg_10),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  vertical: UPdMg_5,
                                  horizontal: UPdMg_10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(URoundedMedium),
                                  color: UBtnColor,
                                  boxShadow: [
                                    BoxShadow(color: UBtnColor),
                                  ],
                                ),
                                child: InkWell(
                                    onTap: () {
                                      void _launchOutUniUrl() async {
                                        if (await canLaunch(
                                            o_scholarship[index].o_link)) {
                                          await launch(
                                              o_scholarship[index].o_link);
                                        } else {
                                          throw 'Could not launch ${o_scholarship[index].o_link}';
                                        }
                                      }

                                      _launchOutUniUrl();
                                    },
                                    child: CustomTextTheme(
                                      'អានបន្ថែម'.tr,
                                      UBodySize,
                                      UPrimaryColor,
                                      UTitleWeight,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
