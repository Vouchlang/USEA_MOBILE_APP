import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Program/Class_Program_ACCA.dart';

class Program_ACCA extends StatelessWidget {
  final String majorName;
  final String course_hour;
  final List<Subject_Data> educationNames;
  Program_ACCA({
    super.key,
    required this.majorName,
    required this.course_hour,
    required this.educationNames,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: majorName.tr,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          UPdMg5,
          UPdMg15,
          UPdMg5,
          UPdMg15,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Card(
            elevation: 0.5,
            shadowColor: ULightGreyColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: UBackgroundColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(
                URoundedLarge,
              ),
            ),
            color: UBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: UPdMg15,
                    horizontal: UPdMg10,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        UPdMg10,
                      ),
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
                          buildWidth5(),
                          Container(
                            width: Get.locale?.languageCode == 'km' ? 65 : 80,
                            alignment: Alignment.centerRight,
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
                  padding: const EdgeInsets.fromLTRB(
                    UPdMg5,
                    UPdMg10,
                    UPdMg5,
                    UZeroPixel,
                  ),
                  child: Column(
                      children: educationNames.map((subject) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: UPdMg15,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: UPdMg5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NoWeightTitleTheme(
                                        subject.no.toString() + '.\t'),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          subject.subject.toString().isEmpty
                                              ? 'N/A'
                                              : subject.subject.toString().tr,
                                          style: const TextStyle(
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
                                      subject.no.isEmpty
                                          ? 'N/A'
                                          : subject.no.toString() + '.\t',
                                      style: const TextStyle(
                                        fontWeight: UBodyWeight,
                                        color: UTransParentColor,
                                        fontFamily: UKFontFamily,
                                      ),
                                    ),
                                    buildCHText(
                                      subject.hour_per_week.isEmpty
                                          ? 'N/A'
                                          : subject.hour_per_week
                                                  .toString()
                                                  .tr +
                                              '\tម៉ោង/សប្ដាហ៍'.tr,
                                    )
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: UPdMg5,
                                  ),
                                  alignment: Alignment.center,
                                  width: 55,
                                  child: NoWeightTitleTheme(
                                    subject.weeks.isEmpty
                                        ? 'N/A'
                                        : subject.weeks.toString(),
                                  ),
                                ),
                                buildWidth15(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: UPdMg5,
                                  ),
                                  alignment: Alignment.center,
                                  width: Get.locale?.languageCode == 'km'
                                      ? UWidth30
                                      : UWidth40,
                                  margin: const EdgeInsets.only(
                                    right: UPdMg10,
                                  ),
                                  child: NoWeightTitleTheme(
                                    subject.total_hour.isEmpty
                                        ? 'N/A'
                                        : subject.total_hour.toString(),
                                  ),
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
                  padding: const EdgeInsets.fromLTRB(
                    UPdMg5,
                    UPdMg10,
                    UPdMg20,
                    UPdMg15,
                  ),
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
                            course_hour.isEmpty ? 'N/A' : course_hour,
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
    );
  }
}
