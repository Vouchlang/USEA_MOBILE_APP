// ignore_for_file: file_names, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme_builder.dart';

// *@ Divider
Widget buildDivider() {
  return Container(
    width: 0.5,
    height: 15,
    color: Colors.grey,
    margin: EdgeInsets.only(right: 5, left: 5),
  );
}

Widget buildDividerAtt() {
  return Container(
    child: Divider(
      thickness: 0.5,
      color: UGreyColor,
    ),
  );
}

Widget buildVerticalDividerAtt() {
  return Container(
    child: VerticalDivider(
      thickness: 0.5,
      color: UGreyColor,
    ),
  );
}

Widget buildVerticalDividerW_5() {
  return Container(
    child: VerticalDivider(
      thickness: 0.5,
      width: 5,
      color: UGreyColor,
    ),
  );
}

Widget buildVerticalDividerW_2() {
  return Container(
    child: VerticalDivider(
      thickness: 0.5,
      width: 2,
      color: UGreyColor,
    ),
  );
}

// *@  End Divider

// *@ Title
class TitleTheme extends StatelessWidget {
  final String text;

  const TitleTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        color: UPrimaryColor,
      ),
    );
  }
}

// *@ Normal Title
class NormalTitleTheme extends StatelessWidget {
  final String text;

  const NormalTitleTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: UTextColor,
          fontFamily: UFontFamily,
        ),
      ),
    );
  }
}

// *@ Normal Title 16px UTextColor
class TitleSize16_Theme extends StatelessWidget {
  final String text;

  const TitleSize16_Theme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: UTitleSize16,
          fontWeight: UTitleWeight,
          color: UTextColor,
          fontFamily: UFontFamily,
        ),
      ),
    );
  }
}

// *@ Normal Title 16px UPrimaryColor
class PriColorTitleSize16Theme extends StatelessWidget {
  final String text;

  const PriColorTitleSize16Theme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: UTitleSize16,
          fontWeight: UTitleWeight,
          color: UPrimaryColor,
          fontFamily: UFontFamily,
        ),
      ),
    );
  }
}

// *@ Center Title Pri_color
class NormalTitleCenterTheme extends StatelessWidget {
  final String text;

  const NormalTitleCenterTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: UTextColor,
        ),
      ),
    );
  }
}

// *@ Body text
class BodyTheme extends StatelessWidget {
  final String text;

  const BodyTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: UBodySize,
        color: UTextColor,
        fontFamily: 'KhmerOSbattambang',
      ),
    );
  }
}

// *@ General custom text
class CustomTextTheme extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CustomTextTheme({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

// *@ Screen_Performance widget
Widget buildTitleContainer(double width, String text, Alignment align) {
  return Container(
    width: width,
    alignment: align,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

// *@ ScoreTotal
Widget buildScoreTotal(String text) {
  return Container(
    width: 50,
    alignment: Alignment.centerRight,
    child: Text(
      text,
      style: TextStyle(color: UPrimaryColor),
    ),
  );
}

// *@ Attendance score
class BuildAttScore extends StatelessWidget {
  String text;
  Widget customDialog;
  BuildAttScore({
    super.key,
    required this.text,
    required this.customDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => customDialog,
          );
        },
        child: Text(
          text.tr,
          style: TextStyle(
            color: UScoreColor,
            fontSize: UTitleSize,
            fontFamily: UFontFamily,
            fontWeight: UTitleWeight,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

// *@ Attendance Score Type
Widget buildAttList(String text, Color color) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: UBodySize,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        text.tr,
        style: TextStyle(
          color: UTextColor,
          fontSize: UBodySize,
        ),
      ),
    ],
  );
}

// *@ Card Attendance
Widget buildCHText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 10,
    ),
  );
}

Widget buildNum(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: UTitleSize,
    ),
  );
}

Widget buildHeader(String text) {
  return Container(
    width: 75,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildTextBody(String text, Color color) {
  return Container(
    width: 75,
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

// *@ End Card Attendance

// *@ Payments
Widget buildTitle(String text, Widget widget) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Container(
          child: Text(
            text.tr,
            style: TextStyle(
              color: UPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      SizedBox(
        child: widget,
      ),
    ],
  );
}

Widget buildHeaderTitle(double num, String text) {
  return SizedBox(
    width: num,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: UPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget buildBody(double num, String text, Color color) {
  return SizedBox(
    width: num,
    child: Text(
      textAlign: TextAlign.center,
      text.tr,
      style: TextStyle(
        fontSize: 12,
        color: color,
      ),
    ),
  );
}
// *@ End Payments