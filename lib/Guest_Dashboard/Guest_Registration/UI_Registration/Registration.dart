import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Registration/Class_Registration.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<EducationData> educationDataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + 'api/webapi.php?action=registration_info'
              : APIUrlGuest + 'api/webapi.php?action=registration_info',
        ),
      );
      if (response.statusCode == 200) {
        if (mounted) {
          List<dynamic> jsonData = json.decode(response.body);
          List<EducationData> data = jsonData.map((item) {
            String title = item['title'];
            List<dynamic> details = item['details'];
            List<EducationDetail> educationDetails = details.map((detail) {
              String dateTitle = detail['date_title'];
              List<dynamic> educationList = detail['education_list'];
              List<EducationItem> educationItems =
                  educationList.map((education) {
                String educationName = education['education_name'];
                List<dynamic> infoList = education['list'];
                List<InfoList> infos = infoList.map((info) {
                  String info_text = info['info'];
                  return InfoList(
                    info_text: info_text,
                  );
                }).toList();
                return EducationItem(
                  educationName: educationName,
                  infoList: infos,
                );
              }).toList();
              String timeTitle = detail['time_title'];
              String timeDetail = detail['time_detail'];
              return EducationDetail(
                dateTitle: dateTitle,
                educationList: educationItems,
                timeTitle: timeTitle,
                timeDetail: timeDetail,
              );
            }).toList();
            return EducationData(
              title: title,
              details: educationDetails,
            );
          }).toList();

          setState(() {
            educationDataList = data;
          });
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ការចុះឈ្មោះ'.tr,
      ),
      body: educationDataList.isEmpty
          ? buildFutureBuild()
          : ListView.builder(
              padding: const EdgeInsets.all(
                UPdMg10,
              ),
              itemCount: educationDataList.length,
              itemBuilder: (context, index) {
                final educationData = educationDataList[index];
                return Card(
                  elevation: 1,
                  color: UBackgroundColor,
                  margin: const EdgeInsets.only(
                    bottom: UPdMg10,
                  ),
                  shadowColor: ULightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      URoundedLarge,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(
                      UPdMg10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            educationData.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: UTitleSize16,
                              fontFamily: UKFontFamily,
                              fontWeight: UTitleWeight,
                              height: UTextHeight,
                            ),
                          ),
                        ),
                        buildHeight5(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: educationData.details.length,
                          itemBuilder: (context, detailIndex) {
                            final details = educationData.details[detailIndex];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 1,
                                        ),
                                        width: UWidth20,
                                        height: UHeight20,
                                        child: Image.asset(
                                          imageAsset + 'date_time.png',
                                        ),
                                      ),
                                      buildWidth5(),
                                      Expanded(
                                        child: Text(
                                          details.dateTitle,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: UTitleSize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: UTitleWeight,
                                            height: UTextHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                for (var educationItem in details.educationList)
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: UPdMg15,
                                        ),
                                        width: UFullWidth,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: UWidth20,
                                              height: UHeight20,
                                              margin: const EdgeInsets.only(
                                                left: UPdMg5,
                                              ),
                                              child: Image.asset(
                                                imageAsset + 'detail.png',
                                                scale: 15,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                educationItem.educationName,
                                                style: const TextStyle(
                                                  fontSize: UTitleSize,
                                                  fontFamily: UKFontFamily,
                                                  fontWeight: UTitleWeight,
                                                  height: UTextHeight,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      for (var info in educationItem.infoList)
                                        Column(
                                          children: [
                                            buildHeight5(),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 36,
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  buildWidth5(),
                                                  Expanded(
                                                    child: Text(
                                                      info.info_text,
                                                      style: const TextStyle(
                                                        fontSize: UBodySize,
                                                        fontFamily:
                                                            UKFontFamily,
                                                        fontWeight: UBodyWeight,
                                                        height: UTextHeight,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            buildHeight5(),
                                          ],
                                        ),
                                    ],
                                  ),
                                buildHeight5(),
                                Container(
                                  width: UFullWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 1,
                                        ),
                                        width: UWidth20,
                                        height: UHeight20,
                                        child: Image.asset(
                                          imageAsset + 'date_time.png',
                                        ),
                                      ),
                                      buildWidth5(),
                                      Expanded(
                                        child: Text(
                                          details.timeTitle,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: UTitleSize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: UTitleWeight,
                                            height: UTextHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                buildHeight5(),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 36,
                                  ),
                                  width: UFullWidth,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildWidth5(),
                                      Expanded(
                                        child: Text(
                                          details.timeDetail,
                                          style: const TextStyle(
                                            fontSize: UBodySize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: UBodyWeight,
                                            height: UTextHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
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
