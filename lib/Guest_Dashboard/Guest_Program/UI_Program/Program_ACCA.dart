import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Program/Class_Program_ACCA.dart';

class Program_ACCA extends StatelessWidget {
  String major_name;
  List<Subject_Data> subject_data;
  Program_ACCA(
      {super.key, required this.major_name, required this.subject_data});

  @override
  Widget build(BuildContext context) {
    double totalHour = 0;
    subject_data.forEach((subject) {
      // double hoursPerWeek = double.tryParse(subject.hour_per_week) ?? 0.0;
      // double weeks = double.tryParse(subject.weeks) ?? 0.0;
      double weeks = double.tryParse(subject.total_hour) ?? 0.0;

      totalHour += weeks;
    });

    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: major_name.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: UPdMg_8),
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
                              width: 65,
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
                        children: subject_data.map((subject) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: UPdMg_15),
                              padding: EdgeInsets.symmetric(vertical: UPdMg_5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.subject.toString().tr,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontWeight: UBodyWeight,
                                      color: UTextColor,
                                    ),
                                  ),
                                  buildCHText(
                                      subject.hour_per_week.toString().tr +
                                          ' ម៉ោងក្នុង១សប្ដាហ៍')
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
                                    alignment: Alignment.center,
                                    width: 55,
                                    child: NoWeightTitleTheme(
                                        subject.weeks.toString()),
                                  ),
                                  SizedBox(width: UWidth15),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    margin: EdgeInsets.only(right: UPdMg_10),
                                    child: NoWeightTitleTheme(
                                        subject.total_hour.toString()),
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
                              totalHour.toStringAsFixed(0),
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
