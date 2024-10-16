import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildTitleReg(final String title) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: UTitleSize16,
        fontFamily: UKFontFamily,
        fontWeight: UTitleWeight,
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildDateTimeTitle(final String title) {
  return Container(
    width: UFullWidth,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1),
          width: UWidth20,
          height: UHeight20,
          child: Image.asset(imageAsset + 'date_time.png'),
        ),
        buildWidth5(),
        Expanded(
          child: Text(
            title,
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
  );
}

Widget buildEducationName(final String educationName) {
  return Container(
    margin: const EdgeInsets.only(left: UPdMg15),
    width: UFullWidth,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: UWidth20,
          height: UHeight20,
          margin: const EdgeInsets.only(left: UPdMg5),
          child: Image.asset(
            imageAsset + 'detail.png',
            scale: 15,
          ),
        ),
        Expanded(
          child: Text(
            educationName,
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
  );
}

Widget buildEducationInfo(final String info) {
  return Container(
    margin: const EdgeInsets.only(
      top: UPdMg5,
      bottom: UPdMg5,
      left: 36,
    ),
    width: UFullWidth,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildWidth5(),
        Expanded(
          child: Text(
            info,
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
  );
}

Widget buildTimeDetail(final String timeDetail) {
  return Container(
    margin: const EdgeInsets.only(left: 3),
    width: UFullWidth,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildWidth5(),
        Expanded(
          child: Text(
            timeDetail,
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
  );
}
