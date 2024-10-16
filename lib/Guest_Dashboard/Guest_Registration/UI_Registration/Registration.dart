import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Guest_API.dart';
import '../Class_Registration/Class_Registration.dart';
import 'Custom_Build_Registration.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការចុះឈ្មោះ'.tr),
      body: educationDataList.isEmpty ? buildFutureBuilder() : buildCard(),
    );
  }

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(APIGuestRegistKh),
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
              List<EducationItem> educationItems = educationList.map((education) {
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

          setState(
            () => educationDataList = data,
          );
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch registration: $e');
    }
  }

  buildCard() {
    return ListView.builder(
      padding: const EdgeInsets.all(UPdMg10),
      physics: const BouncingScrollPhysics(),
      itemCount: educationDataList.length,
      itemBuilder: (context, index) {
        final educationData = educationDataList[index];
        return Card(
          elevation: 0.5,
          color: UBackgroundColor,
          margin: const EdgeInsets.symmetric(vertical: UPdMg5),
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          child: Container(
            padding: const EdgeInsets.all(UPdMg10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTitleReg(educationData.title),
                buildHeight5(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: educationData.details.length,
                  itemBuilder: (context, detailIndex) {
                    final details = educationData.details[detailIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDateTimeTitle(details.dateTitle),
                        buildHeight5(),
                        for (var educationItem in details.educationList)
                          Column(
                            children: [
                              buildEducationName(educationItem.educationName),
                              for (var info in educationItem.infoList) buildEducationInfo(info.info_text),
                            ],
                          ),
                        buildHeight5(),
                        buildDateTimeTitle(details.timeTitle),
                        buildHeight5(),
                        buildTimeDetail(details.timeDetail),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
