import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme_builder.dart';

late final String st_sourceScreen = 'studentScreen';
late final String guardian_sourceScreen = 'guardianScreen';
late final String screenNav = 'presidentScreen';
late final String imageAsset = 'assets/image/';

// Coming Soon
Widget buildComingSoon() {
  return Center(
    child: Text(
      'មកដល់ឆាប់ៗនេះ!!!'.tr,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize16,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

// Divider
Widget buildDivider() {
  return Container(
    width: 0.5,
    height: UHeight15,
    color: UGreyColor,
    margin: const EdgeInsets.symmetric(horizontal: UPdMg5),
  );
}

Widget buildDividerAtt() {
  return const Divider(
    thickness: 0.5,
    height: UHeight10,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerAtt() {
  return const VerticalDivider(
    thickness: 0.5,
    color: UGreyColor,
  );
}

Widget buildDividerStDetail() {
  return const Divider(
    thickness: 0.5,
    color: UGreyColor,
    height: UHeight30,
  );
}

Widget buildVerticalDivider(final double num) {
  return VerticalDivider(
    width: num,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerW_5() {
  return const VerticalDivider(
    thickness: 0.5,
    width: UWidth5,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerW_2() {
  return const VerticalDivider(
    thickness: 0.5,
    width: 1,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerH_45() {
  return Container(
    width: 0.5,
    height: UHeight35,
    color: UGreyColor,
  );
}

// Width
Widget buildWidth5() {
  return const SizedBox(width: UWidth5);
}

Widget buildWidth7() {
  return const SizedBox(width: UWidth7);
}

Widget buildWidth10() {
  return const SizedBox(width: UWidth10);
}

Widget buildWidth15() {
  return const SizedBox(width: UWidth15);
}

Widget buildWidth20() {
  return const SizedBox(width: UWidth20);
}

// Height
Widget buildHeight5() {
  return const SizedBox(height: UHeight5);
}

Widget buildHeight7() {
  return const SizedBox(height: UHeight7);
}

Widget buildHeight10() {
  return const SizedBox(height: UHeight10);
}

Widget buildHeight15() {
  return const SizedBox(height: UHeight15);
}

Widget buildHeight20() {
  return const SizedBox(height: UHeight20);
}

// Title
Widget TitleTheme(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UPrimaryColor,
    ),
  );
}

// General custom text
Widget CustomTextTheme({
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
      fontFamily: UKFontFamily,
      height: UTextHeight,
    ),
  );
}

// Attendance
Widget buildCHText(final String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: UBodySize10),
  );
}

Widget buildHeader(final String text) {
  return Container(
    width: 80,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

// Payments
Widget buildTitle({
  required final String text,
  required final Widget widget,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(
          UPdMg10,
          UPdMg10,
          UPdMg10,
          UPdMg5,
        ),
        child: Text(
          text.tr,
          style: const TextStyle(
            color: UPrimaryColor,
            fontSize: UTitleSize,
            fontWeight: UTitleWeight,
          ),
        ),
      ),
      SizedBox(child: widget),
    ],
  );
}

Widget buildBody({
  required final double width,
  required final String text,
  required final Color color,
}) {
  return Container(
    width: width,
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

// Student Detail
Widget buildHeaderDetail({
  required final String text,
  font,
  required final double size,
  required final FontWeight fontWeight,
}) {
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
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildBodyDetail({
  required final String text1,
  text2,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text1.tr,
        style: const TextStyle(
          fontSize: UBodySize,
          color: UPrimaryColor,
          fontWeight: UTitleWeight,
        ),
      ),
      const SizedBox(height: 2),
      Text(
        text2,
        style: const TextStyle(
          fontFamily: UEFontFamily,
          fontSize: UTitleSize,
        ),
      )
    ],
  );
}

// Build Loading
Widget buildFutureBuilder() {
  return FutureBuilder(
    future: Future.delayed(
      const Duration(seconds: 5),
    ),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: const CircularProgressIndicator(
            color: UPrimaryColor,
            backgroundColor: UBackgroundColor,
          ),
        );
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset + 'no_data.png',
                scale: 3,
              ),
              buildHeight10(),
              Text(
                'គ្មានទិន្ន័យ'.tr,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UTitleSize,
                  fontWeight: UTitleWeight,
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}

// University Name
Widget buildUniversityName(final Color uniNameCol) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildWidth5(),
        Image.asset(
          imageAsset + 'new_usea_logo.png',
          scale: 8,
        ),
        buildWidth5(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                style: TextStyle(
                  color: uniNameCol,
                  fontSize: 11,
                  fontFamily: 'KhmerOSmuol',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'UNIVERSITY OF SOUTH-EAST ASIA',
                style: TextStyle(
                  color: uniNameCol,
                  fontSize: 12,
                  fontFamily: UEFontFamily,
                  fontWeight: UBodyWeight,
                  wordSpacing: 2.2,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Back Button
Widget buildBackBtn(final Function() onPressed) {
  return Stack(
    children: [
      Positioned(
        top: UHeight5,
        right: 1,
        child: IconButton(
          highlightColor: UTransParentColor,
          splashColor: UTransParentColor,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: onPressed,
        ),
      ),
      IconButton(
        padding: const EdgeInsets.only(
          top: UPdMg8,
          left: 14,
        ),
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: onPressed,
      ),
    ],
  );
}

// Navigate Button
Widget buildNavBtn({
  required final Function() onTap,
  required final String text,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Card(
      elevation: 0.5,
      color: UBackgroundColor,
      shadowColor: UGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(URoundedMedium),
      ),
      child: Container(
        width: 100,
        height: UHeight35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(URoundedMedium),
          color: UBtnColor,
        ),
        child: CustomTextTheme(
          text: text.tr,
          size: UBodySize,
          color: UPrimaryColor,
          fontWeight: UTitleWeight,
        ),
      ),
    ),
  );
}

// Button in Dialog
Widget buildBtnDialog({
  required final double containerWidth,
  required final String text,
  required final Function() onTap,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Container(
      width: containerWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: UBtnColor,
        borderRadius: BorderRadius.circular(URoundedMedium),
      ),
      child: Text(
        text.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: UPrimaryColor,
          fontSize: UBodySize,
          height: UTextHeight,
        ),
      ),
    ),
  );
}

// Error Dialog
Widget buildErrorDialog({
  required final String txtTitle,
  txtDescription,
}) {
  return Dialog(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    backgroundColor: UBackgroundColor,
    child: Container(
      margin: const EdgeInsets.all(UPdMg7),
      padding: const EdgeInsets.all(UPdMg10),
      decoration: const BoxDecoration(color: UBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            txtTitle,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          buildHeight10(),
          Text(
            txtDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: UBodySize,
              height: UTextHeight,
            ),
          ),
          buildHeight15(),
          InkWell(
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            onTap: () => Get.back(),
            child: Container(
              height: UHeight40,
              padding: const EdgeInsets.all(UPdMg5),
              alignment: Alignment.center,
              child: Text(
                'បោះបង់'.tr,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UBodySize,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
