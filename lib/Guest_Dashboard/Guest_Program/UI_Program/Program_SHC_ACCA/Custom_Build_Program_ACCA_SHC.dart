import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../Program/Custom_Build_Program.dart';

Widget buildRowTitle() {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg15,
      horizontal: UPdMg10,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(UPdMg10),
      ),
      color: UBGLightBlue,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTheme('មុខវិជ្ជា'.tr),
        Row(
          children: [
            Container(
              width: 65,
              alignment: Alignment.centerRight,
              child: TitleTheme('សប្ដាហ៍'.tr),
            ),
            buildWidth5(),
            Container(
              width: Get.locale?.languageCode == 'km' ? 65 : 80,
              alignment: Alignment.centerRight,
              child: TitleTheme('ម៉ោងសរុប'.tr),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildSubWeekHour({
  required final String index,
  subjectName,
  subIndex,
  subHour,
  week,
  subTotalHour,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: UPdMg15),
          padding: const EdgeInsets.symmetric(vertical: UPdMg5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NoWeightTitleTheme(index),
                  Expanded(
                    child: Container(
                      child: Text(
                        subjectName,
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
                    subIndex,
                    style: const TextStyle(
                      fontWeight: UBodyWeight,
                      color: UTransParentColor,
                      fontFamily: UKFontFamily,
                    ),
                  ),
                  buildCHText(subHour)
                ],
              )
            ],
          ),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: UPdMg5),
            alignment: Alignment.center,
            width: 55,
            child: NoWeightTitleTheme(week),
          ),
          buildWidth15(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: UPdMg5),
            alignment: Alignment.center,
            width: Get.locale?.languageCode == 'km' ? UWidth30 : UWidth40,
            margin: const EdgeInsets.only(right: UPdMg10),
            child: NoWeightTitleTheme(subTotalHour),
          ),
        ],
      ),
    ],
  );
}

Widget buildCourseHour(final String courseHour) {
  return Container(
    padding: const EdgeInsets.fromLTRB(
      UPdMg5,
      UPdMg10,
      UPdMg20,
      UPdMg15,
    ),
    width: UFullWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTheme('សរុប'.tr),
        TitleTheme(courseHour),
      ],
    ),
  );
}
