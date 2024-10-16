import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../Student_Dashboard/Student_LogIn/Login/Student_LogIn.dart';
import '../../../Student_Dashboard/Student_LogIn/Login_QR_Code/Student_Login_QR.dart';
import '../../../theme_builder.dart';

Widget buildAccGridBtn({
  required final Function() onTap,
  required final String image,
  name,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          scale: UScale6,
        ),
        buildHeight7(),
        Text(
          name,
          style: const TextStyle(fontSize: UTitleSize),
        ),
      ],
    ),
  );
}

Widget buildUseaLogo({
  required final double conHeight,
  conWidth,
  imageHeight,
}) {
  return Container(
    height: conHeight,
    width: conWidth,
    decoration: const BoxDecoration(
      color: UPrimaryColor,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageAsset + 'new_usea_logo.png',
          fit: BoxFit.cover,
          height: imageHeight,
        ),
        buildHeight15(),
        const Text(
          'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
          style: TextStyle(
            fontSize: UTitleSize,
            fontFamily: 'KhmerOSmuol',
            color: UBackgroundColor,
          ),
        ),
        const Text(
          'UNIVERSITY OF SOUTH-EAST ASIA',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 15,
            color: UBackgroundColor,
            fontWeight: UBodyWeight,
            fontFamily: UEFontFamily,
            wordSpacing: 2.2,
            letterSpacing: 0.8,
          ),
        ),
      ],
    ),
  );
}

Widget buildStudentLoginOptionDialog() {
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
            'ជម្រើសក្នុងការចូលគណនី'.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          buildHeight10(),
          Text(
            'សូមជ្រើសរើសវិធីសាស្ត្រណាមួយដើម្បីចូលគណនី'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: UBodySize,
              height: UTextHeight,
            ),
          ),
          buildHeight15(),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: UPdMg5),
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                buildBtnDialog(
                  containerWidth: 115,
                  text: 'បញ្ចូលអត្តលេខ \nនិងលេខសម្ងាត់',
                  onTap: () => Get.to(
                    () => Student_LogIn(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 100),
                  ),
                ),
                buildWidth10(),
                buildBtnDialog(
                  containerWidth: 115,
                  text: 'ស្កេន \nQR Code',
                  onTap: () => Get.to(
                    () => const QRLoginScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
