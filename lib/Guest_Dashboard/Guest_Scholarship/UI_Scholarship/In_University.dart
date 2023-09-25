// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_Scholarship/Class_Scholarship_In.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class In_University extends StatefulWidget {
  const In_University({Key? key}) : super(key: key);

  @override
  State<In_University> createState() => _In_UniversityState();
}

class _In_UniversityState extends State<In_University> {
  List<I_Scholarship> i_scholarship = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? APIUrlGuest + "api/webapi.php?action=scholarship_i_university_kh"
            : APIUrlGuest +
                "api/webapi.php?action=scholarship_i_university_en"),
      );
      var r = json.decode(res.body);
      if (mounted) {
        if (r is List<dynamic>) {
          i_scholarship = r
              .map(
                (e) => I_Scholarship.fromJson(e),
              )
              .toList();
        } else {
          i_scholarship = [
            I_Scholarship.fromJson(r),
          ];
        }
        setState(
          () {
            isLoading = false;
          },
        );
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
        child: i_scholarship.isEmpty
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
                itemCount: i_scholarship.length,
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
                                  i_scholarship[index].i_school_name.tr)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme(
                                  i_scholarship[index].i_educational_level)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipTitleTheme(
                                  i_scholarship[index].i_major)),
                          Container(
                              width: UFullWidth,
                              child:
                                  ScholarshipTitleTheme('ថ្ងៃផុតកំណត់៖ '.tr)),
                          Container(
                              width: UFullWidth,
                              child: ScholarshipBodyTheme(
                                  i_scholarship[index].i_expire_date)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: UPdMg_10),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: UPdMg_5, horizontal: UPdMg_10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(URoundedMedium),
                                  color: UBtnColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: UBtnColor,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    void _launchInUniUrl() async {
                                      if (await canLaunch(
                                          i_scholarship[index].i_link)) {
                                        await launch(
                                            i_scholarship[index].i_link);
                                      } else {
                                        throw 'Could not launch ${i_scholarship[index].i_link}';
                                      }
                                    }

                                    _launchInUniUrl();
                                  },
                                  child: CustomTextTheme(
                                    'អានបន្ថែម'.tr,
                                    UBodySize,
                                    UPrimaryColor,
                                    UTitleWeight,
                                  ),
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
      ),
    );
  }
}
