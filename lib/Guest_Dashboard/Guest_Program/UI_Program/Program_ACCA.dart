import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Program/Class_Program_ACCA.dart';

class Program_ACCA extends StatelessWidget {
  String majorName;
  String course_hour;

  List<Subject_Data> educationNames;
  Program_ACCA(
      {super.key,
      required this.majorName,
      required this.course_hour,
      required this.educationNames});

  @override
  Widget build(BuildContext context) {
    double totalHour = 0;
    late String formattedTotal;
    educationNames.forEach((subject) {
      double weeks = double.tryParse(subject.total_hour) ?? 0.0;
      totalHour += weeks;
      formattedTotal = totalHour
          .toStringAsFixed(totalHour.truncateToDouble() == totalHour ? 0 : 1);
    });

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: majorName.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UPdMg_8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 2,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(URoundedLarge),
              ),
              color: UBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: UPdMg_15,
                      horizontal: UPdMg_5,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(UPdMg_10),
                      ),
                      color: UBGLightBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleTheme(
                          'មុខវិជ្ជា'.tr,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 65,
                              alignment: Alignment.centerRight,
                              child: TitleTheme(
                                'សប្ដាហ៍'.tr,
                              ),
                            ),
                            SizedBox(width: UWidth10),
                            Container(
                              width: Get.locale?.languageCode == 'km' ? 65 : 75,
                              alignment: Alignment.center,
                              child: TitleTheme(
                                'ម៉ោងសរុប'.tr,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        UPdMg_5, UPdMg_10, UPdMg_5, UZeroPixel),
                    child: Column(
                        children: educationNames.map((subject) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: UPdMg_15),
                              padding: EdgeInsets.symmetric(vertical: UPdMg_5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NoWeightTitleTheme(
                                          subject.no.toString() + '.\t'),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            subject.subject
                                                        .toString()
                                                        .isEmpty ||
                                                    subject.subject
                                                            .toString() ==
                                                        null
                                                ? 'N/A'
                                                : subject.subject.toString().tr,
                                            style: TextStyle(
                                              fontSize: UTitleSize,
                                              fontWeight: UBodyWeight,
                                              color: UTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        subject.no.isEmpty || subject.no == null
                                            ? 'N/A'
                                            : subject.no.toString() + '.\t',
                                        style: TextStyle(
                                          fontWeight: UBodyWeight,
                                          color: Colors.transparent,
                                          fontFamily: UKFontFamily,
                                        ),
                                      ),
                                      buildCHText(
                                          subject.hour_per_week.isEmpty ||
                                                  subject.hour_per_week == null
                                              ? 'N/A'
                                              : subject.hour_per_week
                                                      .toString()
                                                      .tr +
                                                  '\tម៉ោង/សប្ដាហ៍'.tr)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: UPdMg_5),
                                    alignment: Alignment.center,
                                    width: 55,
                                    child: NoWeightTitleTheme(
                                        subject.weeks.isEmpty ||
                                                subject.weeks == null
                                            ? 'N/A'
                                            : subject.weeks.toString()),
                                  ),
                                  SizedBox(width: UWidth15),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: UPdMg_5),
                                    alignment: Alignment.center,
                                    width: Get.locale?.languageCode == 'km'
                                        ? 30
                                        : 40,
                                    margin: EdgeInsets.only(right: UPdMg_10),
                                    child: NoWeightTitleTheme(
                                        subject.total_hour.isEmpty ||
                                                subject.total_hour == null
                                            ? 'N/A'
                                            : subject.total_hour.toString()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }).toList()),
                  ),
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(UPdMg_5, UPdMg_10, 20, UPdMg_15),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleTheme(
                          'សរុប'.tr,
                        ),
                        Row(
                          children: [
                            TitleTheme(
                              course_hour.isEmpty || course_hour == null
                                  ? 'N/A'
                                  : course_hour,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}