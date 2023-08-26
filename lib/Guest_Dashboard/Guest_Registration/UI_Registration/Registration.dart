import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Custom_AppBar.dart';
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
    String apiUrl =
        'https://usea.edu.kh/api/webapi.php?action=registration_info';
    try {
      http.Response response = await http.get(Uri.parse(apiUrl));
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
                  return InfoList(info_text: info_text);
                }).toList();
                return EducationItem(
                    educationName: educationName, infoList: infos);
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
            return EducationData(title: title, details: educationDetails);
          }).toList();

          setState(() {
            educationDataList = data;
          });
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការចុះឈ្មោះ'.tr),
      body: educationDataList.isEmpty
          ? Center(
              child: FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? Text('គ្មានទិន្ន័យ'.tr)
                        : CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(UPdMg_10),
              itemCount: educationDataList.length,
              itemBuilder: (context, index) {
                final educationData = educationDataList[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: UPdMg_10),
                  shadowColor: ULightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(URoundedLarge),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(UPdMg_10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            educationData.title,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: UTitleSize16,
                              fontFamily: UKFontFamily,
                              fontWeight: UTitleWeight,
                            ),
                          ),
                        ),
                        SizedBox(height: UHeight5),
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
                                        margin: EdgeInsets.only(top: 2),
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            'assets/image/date_time.png'),
                                      ),
                                      SizedBox(width: UWidth5),
                                      Expanded(
                                        child: Text(
                                          details.dateTitle,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: UTitleSize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: UTitleWeight,
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
                                        margin: EdgeInsets.only(left: UPdMg_15),
                                        width: UFullWidth,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              child: Image.asset(
                                                'assets/image/detail.png',
                                                scale: 14,
                                              ),
                                            ),
                                            SizedBox(width: UWidth5),
                                            Expanded(
                                              child: Text(
                                                educationItem.educationName,
                                                style: TextStyle(
                                                  fontSize: UTitleSize,
                                                  fontFamily: UKFontFamily,
                                                  fontWeight: UTitleWeight,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      for (var info in educationItem.infoList)
                                        Column(
                                          children: [
                                            SizedBox(height: UHeight5),
                                            Container(
                                              margin: EdgeInsets.only(left: 35),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: UWidth5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      info.info_text,
                                                      style: TextStyle(
                                                        fontSize: UBodySize,
                                                        fontFamily:
                                                            UKFontFamily,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: UHeight5),
                                          ],
                                        ),
                                    ],
                                  ),
                                SizedBox(height: UHeight5),
                                Container(
                                  width: UFullWidth,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            'assets/image/date_time.png'),
                                      ),
                                      SizedBox(width: UWidth5),
                                      Expanded(
                                        child: Text(
                                          details.timeTitle,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: UTitleSize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: UTitleWeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: UHeight5),
                                Container(
                                  margin: EdgeInsets.only(left: 35),
                                  width: UFullWidth,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(width: UWidth5),
                                      Expanded(
                                        child: Text(
                                          details.timeDetail,
                                          style: TextStyle(
                                            fontSize: UBodySize,
                                            fontFamily: UKFontFamily,
                                            fontWeight: FontWeight.w400,
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
