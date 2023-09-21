import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme_builder.dart';

String APIUrlGuest = 'https://usea.edu.kh/';

// Local Server
// String APIUrlStudent = 'http://192.168.1.182/api/apidata.php?';
// String APIUrlStudentEn = 'http://192.168.1.182/api/apidata_en.php?';

// Public Server
String APIUrlStudent = 'http://116.212.155.149:9999/api/apidata.php?';
String APIUrlStudentEn = 'http://116.212.155.149:9999/api/apidata_en.php?';

// *@ Divider
Widget buildDivider() {
  return Container(
    width: 0.5,
    height: UHeight15,
    color: UGreyColor,
    margin: EdgeInsets.symmetric(horizontal: UPdMg_5),
  );
}

Widget buildDividerAtt() {
  return Divider(
    thickness: 0.5,
    height: UHeight10,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerAtt() {
  return VerticalDivider(
    thickness: 0.5,
    color: UGreyColor,
  );
}

Widget buildDividerStDetail() {
  return Divider(
    thickness: 0.5,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerW_5() {
  return VerticalDivider(
    thickness: 0.5,
    width: UWidth5,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerW_2() {
  return VerticalDivider(
    thickness: 0.5,
    width: 2,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerH_45() {
  return Container(
    width: 1,
    height: 45,
    color: UGreyColor,
  );
}
// *@  End Divider

// *@ Title
Widget TitleTheme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UPrimaryColor,
    ),
  );
}
// *@  End Title

// *@ Normal Title Attendance UTextColor
Widget TitleAttendance_Theme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize16,
      fontWeight: UTitleWeight,
      color: UTextColor,
    ),
  );
}
// *@ End Normal Title 16px UTextColor

// *@ Normal Date Study Info
Widget NormalDateStudyInfo(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
    ),
  );
}
// *@ End Normal Date Study Info

// *@ Normal Data Study Info
Widget RowDataStudyInfo(String title, tData) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title.tr,
        style: TextStyle(
          fontSize: UBodySize,
          color: UTextColor,
        ),
      ),
      Container(
        width: 200,
        alignment: Alignment.centerLeft,
        child: Text(
          tData,
          style: TextStyle(
            fontSize: UBodySize,
            color: UTextColor,
          ),
        ),
      ),
    ],
  );
}
// *@ End Normal Data Study Info

//*@ Data Study Info Assignment Row
Widget buildStudyDataAssign(
  String textTitle,
  textValue,
) {
  return IntrinsicHeight(
    child: Row(
      children: [
        Container(
          width: 75,
          child: Text(
            textTitle.tr,
            style: TextStyle(fontSize: UTitleSize),
          ),
        ),
        // buildVerticalDividerAtt(),
        Expanded(
          child: Text(
            textValue,
            style: TextStyle(
              fontSize: UTitleSize,
              fontWeight: UBodyWeight,
              color: UTextColor,
              // fontFamily: UKFontFamily,
            ),
          ),
        ),
      ],
    ),
  );
}
// *@ End Data Study Info Assignment Row

// *@ No Weight Title
Widget NoWeightTitleTheme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize,
      fontWeight: UBodyWeight,
      color: UTextColor,
      // fontFamily: UKFontFamily,
    ),
  );
}
// *@ End No Weight Title

// *@ Scholarship Text
Widget ScholarshipTitleTheme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
    ),
  );
}
// *@ End Scholarship Text

// *@ Scholarship Body text
Widget ScholarshipBodyTheme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
    ),
  );
}
// *@ End Scholarship Body text

Widget buildTextContact(
  String text,
  double size,
  FontWeight fontWeight,
) {
  return SelectableText(
    text,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
    ),
  );
}

// *@ Date Schedule
Widget ScheduleDate(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
    ),
  );
}
// *@ End Date Scredule

// *@ Schedule Title
Widget ScheduleTitle(
  String text,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UTitleSize16,
      fontWeight: UTitleWeight,
      color: UTextColor,
    ),
  );
}
// *@ End Schedule Title

// *@ Schedule Body
Widget ScheduleBody(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
    ),
  );
}
// *@ End Schedule Body

//*@ Event Date
Widget buildEventDate(
  String text,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UBodySize10,
      fontWeight: UBodyWeight,
      fontFamily: UKFontFamily,
      color: UPrimaryColor,
    ),
  );
}
// *@ End Event Date

//*@ Career Card Row
Widget buildCareerCardRow(
  String textTitle,
  textValue,
) {
  return Row(
    children: [
      Container(
        width: 125,
        child: Text(
          textTitle.tr,
          style: TextStyle(fontSize: UTitleSize),
        ),
      ),
      Expanded(
        child: Text(
          textValue,
          style: TextStyle(
            fontSize: UTitleSize,
            fontWeight: UBodyWeight,
            color: UTextColor,
            fontFamily: UKFontFamily,
          ),
        ),
      ),
    ],
  );
}
// *@ End Career Card Row

// *@ Body text
Widget BodyTheme(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      fontFamily: UKFontFamily,
    ),
  );
}
// *@ End Body text

// *@ General custom text
Widget CustomTextTheme(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: UKFontFamily),
  );
}

Widget CustomPerformanceDiaglogTextTheme(
    String text, double size, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: UBodyWeight,
      color: color,
    ),
  );
}

// *@ Attendance custom text
Widget CustomAttTextTheme(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
// *@ End Attendance custom text

// *@ Screen_Performance widget
Widget buildTitleContainer(
  double width,
  String text,
  Alignment align,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: UPdMg_10),
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
// *@ End ScoreTotal

// *@ Attendance Score Type
Widget buildAttList(
  String text,
  Color color,
) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: UBodySize,
      ),
      SizedBox(
        width: UWidth5,
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
// *@ End Attendance Score Type

// *@ Card Attendance
Widget buildCHText(
  String text,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: UBodySize10,
    ),
  );
}

Widget buildNum(
  String text,
  Color color,
) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: UTitleSize,
    ),
  );
}

Widget buildHeaderNA(
  String text,
) {
  return Container(
    width: 75,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: UTextColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildHeader(
  String text,
) {
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

Widget buildAttDetailHeader(
  String text,
) {
  return Container(
    width: 100,
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

Widget buildTextBody(
  String text,
  Color color,
) {
  return Container(
    width: 75,
    margin: EdgeInsets.symmetric(vertical: UPdMg_5),
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

Widget buildAttTextBody(
  String text,
  Color color,
) {
  return Container(
    width: 100,
    margin: EdgeInsets.symmetric(vertical: UPdMg_5),
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

Widget buildTextTitle(
  String text,
  Color color,
) {
  return Container(
    width: 75,
    margin: EdgeInsets.symmetric(vertical: UPdMg_5),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: UTitleSize,
        color: color,
      ),
    ),
  );
}
// *@ End Card Attendance

// *@ Payments
Widget buildTitle(
  String text,
  Widget widget,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(UPdMg_10, UPdMg_10, UPdMg_10, UPdMg_5),
        child: Text(
          text.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: UBodySize,
            fontWeight: UTitleWeight,
          ),
        ),
      ),
      SizedBox(
        child: widget,
      ),
    ],
  );
}

Widget buildHeaderTitle(
  double num,
  String text,
) {
  return SizedBox(
    width: num,
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

Widget buildBody(
  double num,
  String text,
  Color color,
) {
  return Container(
    width: num,
    child: Text(
      textAlign: TextAlign.center,
      text.tr,
      style: TextStyle(
        fontSize: UBodySize,
        color: color,
      ),
    ),
  );
}
// *@ End Payments

// *@ Student Detail
Widget buildHeaderDetail(
  String text,
  font,
  double size,
  FontWeight fontWeight,
) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: UPrimaryColor,
        fontFamily: font,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    ),
  );
}

Widget buildBodyDetail(
  String text1,
  text2,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text1.tr,
        style: TextStyle(
          fontSize: UBodySize,
          color: UPrimaryColor,
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Text(
        text2,
        style: TextStyle(
          fontFamily: UEFontFamily,
          fontSize: UTitleSize,
        ),
      )
    ],
  );
}

Widget buildTailDetail(
  String image,
  title,
  text,
) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        image,
        scale: 5,
      ),
      SizedBox(
        width: UWidth10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: UPrimaryColor,
                fontSize: UBodySize,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: UTitleSize,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
// *@ End Student Detail

// *@ VDO
Widget buildListText(
  String text,
  int line,
  double size,
  FontWeight fontWeight,
) {
  return Text(
    text,
    textAlign: TextAlign.justify,
    maxLines: line,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      height: 1.7,
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
    ),
  );
}

Widget buildTitleBody(
  String text,
  double size,
  FontWeight fontWeight,
) {
  return Text(
    text,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
    ),
  );
}
// *@ End VDO

// *@ AboutUS
Widget buildHistory(
  String text,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Image.asset(
          'assets/image/dot.png',
          width: UWidth5,
        ),
        margin: EdgeInsets.only(top: UPdMg_10),
      ),
      SizedBox(
        width: UWidth5,
      ),
      Expanded(
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: UTitleSize,
            fontFamily: UEFontFamily,
          ),
        ),
      ),
    ],
  );
}
// *@ End AboutUS

// *@ Vision
Widget buildTitleVision(
  String text1,
  text2,
) {
  return Container(
    margin: EdgeInsets.fromLTRB(UPdMg_10, UPdMg_10, UPdMg_10, UZeroPixel),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: UTitleSize,
              color: UPrimaryColor,
              fontFamily: UEFontFamily,
              fontWeight: UBodyWeight),
        ),
        Container(
          margin: EdgeInsets.only(left: UPdMg_12),
          child: Text(
            text2,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: UTitleSize,
              fontFamily: UEFontFamily,
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildTopBodyVision(
  String text,
) {
  return Text(
    text,
    style: TextStyle(
        fontSize: UTitleSize,
        color: UPrimaryColor,
        fontFamily: UEFontFamily,
        fontWeight: UBodyWeight),
  );
}

Widget buildLowBodyVision(
  String text,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: UPdMg_10),
        child: Image.asset(
          'assets/image/dot.png',
          width: 4,
        ),
      ),
      SizedBox(
        width: UWidth5,
      ),
      Expanded(
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: UTitleSize,
            fontFamily: UEFontFamily,
          ),
        ),
      )
    ],
  );
}

// *@ FAQ
Widget buildFAQ(
  String text,
  TextAlign align,
) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
      fontSize: UTitleSize16,
      color: UTextColor,
    ),
  );
}
// *@ End FAQ

// *@ PresidentMessage
Widget buildPresidentMessage(
  String text,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: UPdMg_10),
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: UTitleSize, fontFamily: UEFontFamily),
    ),
  );
}
// *@ End PresidentMessage

//@ Custom InkWell Social Media
Widget BuildContainerSM(Function()? onTap, String imageName) {
  return InkWell(
    onTap: onTap,
    child: Image.asset(
      imageName,
      scale: UPdMg_5,
    ),
  );
}
