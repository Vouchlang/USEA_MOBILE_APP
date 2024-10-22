import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

// Widget CustomPerformanceDiaglogTextTheme({
//   required final String text,
//   required final double size,
//   required final FontWeight fontWeight,
//   required final Color color,
// }) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: UPdMg5),
//     child: Text(
//       text,
//       style: TextStyle(
//         fontSize: size,
//         fontWeight: fontWeight,
//         color: color,
//       ),
//     ),
//   );
// }

Widget CustomPerformanceDiaglogTextTheme({
  required final String text,
  required final double size,
  required final FontWeight fontWeight,
  required final Color color,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: UPdMg5),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    ),
  );
}

Widget CustomPerformanceDiaglogTextThemeBold({
  required final String text,
  required final double size,
  required final Color color,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: UPdMg5),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: UBodyWeight,
        color: color,
        fontFamily: UEFontFamily,
      ),
    ),
  );
}

Widget buildDialogSubjectName(final String subjectName) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: UPdMg10,
      vertical: UPdMg15,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    child: Container(
      margin: const EdgeInsets.only(right: 50),
      child: Text(
        subjectName,
        style: const TextStyle(
          color: UPrimaryColor,
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
        ),
      ),
    ),
  );
}

Widget buildAttDialogData({
  required final String attTitle,
  required final Widget attAl,
  attPm,
  attAb,
  attPs,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: CustomPerformanceDiaglogTextTheme(
          text: attTitle,
          size: UTitleSize,
          fontWeight: UTitleWeight,
          color: UPrimaryColor,
        ),
      ),
      IntrinsicHeight(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPerformanceDiaglogTextTheme(
                  text: 'យឺត'.tr,
                  size: UTitleSize,
                  fontWeight: UBodyWeight,
                  color: UTextColor,
                ),
                attAl,
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPerformanceDiaglogTextTheme(
                  text: 'សុំច្បាប់'.tr,
                  size: UTitleSize,
                  fontWeight: UBodyWeight,
                  color: UTextColor,
                ),
                attPm,
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPerformanceDiaglogTextTheme(
                  text: 'អវត្តមាន'.tr,
                  size: UTitleSize,
                  fontWeight: UBodyWeight,
                  color: UTextColor,
                ),
                attAb,
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPerformanceDiaglogTextTheme(
                  text: 'វត្តមាន'.tr,
                  size: UTitleSize,
                  fontWeight: UBodyWeight,
                  color: UTextColor,
                ),
                attPs,
              ],
            ),
            buildHeight5(),
          ],
        ),
      ),
    ],
  );
}

Widget buildScoreDialogData({
  required final String scoreTitle,
  required final double marginBottom,
  required final Widget numAtt,
  numAssign,
  numMid,
  numFinal,
  scoreAtt,
  scoreAssign,
  scoreMid,
  scoreFinal,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: CustomPerformanceDiaglogTextTheme(
          text: scoreTitle,
          size: UTitleSize,
          fontWeight: UTitleWeight,
          color: UPrimaryColor,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPerformanceDiaglogTextTheme(
                text: 'លក្ខណៈវិនិច្ឆ័យ'.tr,
                size: UTitleSize,
                fontWeight: UTitleWeight,
                color: UPrimaryColor,
              ),
              CustomPerformanceDiaglogTextTheme(
                text: 'វត្តមាន'.tr,
                size: UTitleSize,
                fontWeight: UBodyWeight,
                color: UTextColor,
              ),
              CustomPerformanceDiaglogTextTheme(
                text: 'កិច្ចការផ្ទះ និងស្រាវជ្រាវ'.tr,
                size: UTitleSize,
                fontWeight: UBodyWeight,
                color: UTextColor,
              ),
              CustomPerformanceDiaglogTextTheme(
                text: 'ប្រលងពាក់កណ្ដាលឆមាស'.tr,
                size: UTitleSize,
                fontWeight: UBodyWeight,
                color: UTextColor,
              ),
              CustomPerformanceDiaglogTextTheme(
                text: 'ប្រលងបញ្ចប់ឆមាស'.tr,
                size: UTitleSize,
                fontWeight: UBodyWeight,
                color: UTextColor,
              ),
              //Average Score Blank
              // CustomPerformanceDiaglogTextTheme(
              //   ''.tr,
              //   UTitleSize,
              //   UTextColor,
              // ),
              Container(
                margin: EdgeInsets.only(bottom: marginBottom),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomPerformanceDiaglogTextTheme(
                    text: 'ពិន្ទុជាក់ស្ដែង'.tr,
                    size: UTitleSize,
                    fontWeight: UTitleWeight,
                    color: UPrimaryColor,
                  ),
                  numAtt,
                  numAssign,
                  numMid,
                  numFinal,
                  // Average Score Text
                  // CustomPerformanceDiaglogTextTheme(
                  //   'ពិន្ទុសរុប'.tr,
                  //   UTitleSize,
                  //   UPrimaryColor,
                  // ),
                  Container(
                    margin: EdgeInsets.only(bottom: marginBottom),
                  ),
                ],
              ),
              buildWidth5(),
              Column(
                children: [
                  CustomPerformanceDiaglogTextTheme(
                    text: 'ពិន្ទុផ្លូវការ'.tr,
                    size: UTitleSize,
                    fontWeight: UTitleWeight,
                    color: UPrimaryColor,
                  ),
                  scoreAtt,
                  scoreAssign,
                  scoreMid,
                  scoreFinal,
                  Container(
                    margin: EdgeInsets.only(bottom: marginBottom),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
