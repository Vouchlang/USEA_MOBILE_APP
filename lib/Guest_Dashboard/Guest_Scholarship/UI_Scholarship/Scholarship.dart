// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Scholarship/Class_Scholarship.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({super.key});

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  late List<Class_Scholarship> scholarships = [];
  int selectedScholarship = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + 'api/webapi.php?action=scholarship_kh'
              : APIUrlGuest + 'api/webapi.php?action=scholarship_en',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        List<Class_Scholarship> scholarshipList = [];

        data['scholarship']?.forEach((scholarshipData) {
          List<Scholarship_Data> scholarship_data = [];

          scholarshipData['scholarship_data']?.forEach((scholarshipDatas) {
            Scholarship_Data scholarship_DataObj = Scholarship_Data(
              school_name: scholarshipDatas['school_name'] ?? 'N/A',
              education_level: scholarshipDatas['education_level'] ?? 'N/A',
              major_name: scholarshipDatas['major_name'] ?? 'N/A',
              expire_date: scholarshipDatas['expire_date'] ?? 'N/A',
              link: scholarshipDatas['link'] ?? 'N/A',
            );

            scholarship_data.add(scholarship_DataObj);
          });

          Class_Scholarship scholarshipObj = Class_Scholarship(
            scholarship_name: scholarshipData['scholarship_name'] ?? 'N/A',
            scholarship_data: scholarship_data,
          );

          scholarshipList.add(scholarshipObj);
        });
        if (mounted) {
          setState(() {
            scholarships = scholarshipList;
          });
        }
      } else {
        // Handle error case
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch scholarship: $e');
    }
  }

  void selectScholarship(int index) {
    if (mounted) {
      setState(() {
        selectedScholarship = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'អាហារូបករណ៍'.tr,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: scholarships.isEmpty
            ? buildFutureBuild()
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: UHeight5,
                    ),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      width: UFullWidth,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: scholarships.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final isLastIndex =
                                index == scholarships.length - 1;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedScholarship = index;
                                });
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                margin: EdgeInsets.fromLTRB(
                                  UPdMg10,
                                  UPdMg10,
                                  isLastIndex ? UPdMg10 : UZeroPixel,
                                  UPdMg10,
                                ),
                                width: 165,
                                decoration: BoxDecoration(
                                  color: selectedScholarship == index
                                      ? UPrimaryColor
                                      : UBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    URoundedMedium,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: ULightGreyColor,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  scholarships[index].scholarship_name.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: UTitleSize,
                                    color: selectedScholarship == index
                                        ? UBackgroundColor
                                        : UTextColor,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    scholarships[selectedScholarship]
                            .scholarship_data
                            .isNotEmpty
                        ? Column(
                            children: scholarships[selectedScholarship]
                                .scholarship_data
                                .map(
                            (scholarship) {
                              return Container(
                                padding: EdgeInsets.fromLTRB(
                                  UPdMg10,
                                  UZeroPixel,
                                  UPdMg10,
                                  UZeroPixel,
                                ),
                                child: Card(
                                  elevation: 2,
                                  shadowColor: ULightGreyColor,
                                  margin: EdgeInsets.only(
                                    bottom: UPdMg10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      URoundedLarge,
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      UPdMg10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: UFullWidth,
                                          child: ScholarshipTitleTheme(
                                            scholarship.school_name,
                                          ),
                                        ),
                                        Container(
                                          width: UFullWidth,
                                          child: ScholarshipTitleTheme(
                                            scholarship.education_level,
                                          ),
                                        ),
                                        Container(
                                          width: UFullWidth,
                                          child: ScholarshipTitleTheme(
                                            scholarship.major_name,
                                          ),
                                        ),
                                        Container(
                                          width: UFullWidth,
                                          child: ScholarshipTitleTheme(
                                            'ថ្ងៃផុតកំណត់៖ '.tr,
                                          ),
                                        ),
                                        Container(
                                          width: UFullWidth,
                                          child: ScholarshipBodyTheme(
                                            scholarship.expire_date,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              highlightColor: UTransParentColor,
                                              splashColor: UTransParentColor,
                                              onTap: () {
                                                void _launchOutUniUrl() async {
                                                  if (await canLaunch(
                                                      scholarship.link)) {
                                                    await launch(
                                                      scholarship.link,
                                                    );
                                                  } else {
                                                    throw 'Could not launch ${scholarship.link}';
                                                  }
                                                }

                                                _launchOutUniUrl();
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  top: UPdMg10,
                                                ),
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                  vertical: UPdMg5,
                                                  horizontal: UPdMg10,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    URoundedMedium,
                                                  ),
                                                  color: UBtnColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: UBtnColor,
                                                    ),
                                                  ],
                                                ),
                                                child: ScholarshipButtonTheme(
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
                                ),
                              );
                            },
                          ).toList())
                        : buildFutureBuild()
                  ],
                ),
              ),
      ),
    );
  }
}
