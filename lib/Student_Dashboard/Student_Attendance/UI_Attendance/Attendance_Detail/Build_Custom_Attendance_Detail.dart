import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildAttDetailHeader({
  required final double width,
  required final String text,
  required final Color textColor,
}) {
  return Container(
    width: width,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildAttTextBody({
  required final double width,
  required final String text,
  required final Color color,
}) {
  return Container(
    width: width,
    margin: const EdgeInsets.symmetric(vertical: UPdMg5),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: UBodySize,
        color: color,
      ),
    ),
  );
}

Widget CustomAttTextTheme({
  required final String text,
  required final double size,
  required final Color color,
  required final FontWeight fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget buildSubName(final String subName) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg15,
      horizontal: UPdMg10,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    child: CustomAttTextTheme(
      text: subName,
      size: UTitleSize,
      color: UPrimaryColor,
      fontWeight: UTitleWeight,
    ),
  );
}

Widget buildSubDataNA() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(UPdMg8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildHeader('កាលបរិច្ឆេទ'.tr),
              buildVerticalDividerAtt(),
              buildHeader('ម៉ោងសិក្សា'.tr),
              buildVerticalDividerAtt(),
              buildHeader('វត្តមាន'.tr),
            ],
          ),
        ),
      ),
      buildDividerAtt(),
      IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(UPdMg8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildAttDetailHeader(
                width: 75,
                text: 'N/A',
                textColor: UTextColor,
              ),
              buildVerticalDividerAtt(),
              buildAttDetailHeader(
                width: 75,
                text: 'N/A',
                textColor: UTextColor,
              ),
              buildVerticalDividerAtt(),
              buildAttDetailHeader(
                width: 75,
                text: 'N/A',
                textColor: UTextColor,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
