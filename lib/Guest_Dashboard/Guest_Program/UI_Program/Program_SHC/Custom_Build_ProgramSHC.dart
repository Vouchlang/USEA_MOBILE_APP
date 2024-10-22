import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../Program/Custom_Build_Program.dart';

Widget buildTitleSHC() {
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
        Container(
          alignment: Alignment.center,
          width: 55,
          child: TitleTheme('ក្រេឌីត'.tr),
        ),
      ],
    ),
  );
}

Widget buildRowData({
  required final String index,
  subjectName,
  credit,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: UPdMg5),
              child: NoWeightTitleTheme(index),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: UPdMg15),
                padding: const EdgeInsets.symmetric(vertical: UPdMg5),
                child: Text(
                  subjectName,
                  style: const TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UBodyWeight,
                    color: UTextColor,
                    height: UTextHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      buildWidth15(),
      Container(
        padding: const EdgeInsets.symmetric(vertical: UPdMg5),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(right: UPdMg15),
        child: NoWeightTitleTheme(credit),
      ),
    ],
  );
}

Widget buildTotalCredit(final String totalCredit) {
  return Container(
    padding: const EdgeInsets.fromLTRB(
      UPdMg5,
      UPdMg15,
      UPdMg5,
      UPdMg15,
    ),
    width: UFullWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTheme('សរុប'.tr),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: UPdMg15),
          child: TitleTheme(totalCredit),
        ),
      ],
    ),
  );
}
