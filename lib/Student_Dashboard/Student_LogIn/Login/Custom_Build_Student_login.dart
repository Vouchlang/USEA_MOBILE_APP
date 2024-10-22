import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildUniversityColumn({required final double imageHeight}) {
  return Column(
    children: [
      Image.asset(
        imageAsset + 'usea_logo.png',
        fit: BoxFit.cover,
        height: imageHeight,
      ),
      buildHeight15(),
      const Text(
        'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
        style: TextStyle(
          fontSize: UTitleSize,
          fontFamily: 'KhmerOSmuol',
          color: UPrimaryColor,
        ),
      ),
      const Text(
        'UNIVERSITY OF SOUTH-EAST ASIA',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 15,
          color: UPrimaryColor,
          fontWeight: UBodyWeight,
          fontFamily: UEFontFamily,
          wordSpacing: 2.2,
          letterSpacing: 0.8,
        ),
      ),
    ],
  );
}

// Input User and Password Form
Widget buildForm({
  required final Key formKey,
  required final String accName,
  inputHint,
  required final TextEditingController textControllerUserName,
  textControllerUserPsw,
  required final bool obscureText,
  required final Function() onPressed,
}) {
  return Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            accName,
            style: const TextStyle(
              fontSize: UBodySize,
              fontWeight: UTitleWeight,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: UPdMg10,
            horizontal: 30,
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: textControllerUserName,
            cursorColor: UGreyColor,
            cursorWidth: 1,
            style: const TextStyle(fontFamily: UEFontFamily),
            cursorHeight: UHeight30,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(UPdMg10),
              hintText: inputHint,
              hintStyle: TextStyle(
                fontSize: UBodySize10,
                color: UGreyColor,
                fontFamily: Get.locale?.languageCode == 'km' ? UKFontFamily : UEFontFamily,
              ),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () => textControllerUserName.clear(),
                icon: const Icon(
                  Icons.clear,
                  size: 15,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UGreyColor),
              ),
              suffixIconColor: UGreyColor,
              errorStyle: const TextStyle(
                fontSize: UBodySize10,
                fontFamily: UKFontFamily,
              ),
            ),
          ),
        ),
        buildHeight5(),
        Container(
          padding: const EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            'ពាក្យសម្ងាត់'.tr,
            style: const TextStyle(
              fontSize: UBodySize,
              fontWeight: UTitleWeight,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: UPdMg10,
            horizontal: 30,
          ),
          alignment: Alignment.center,
          child: TextFormField(
            obscureText: obscureText,
            controller: textControllerUserPsw,
            cursorColor: UGreyColor,
            cursorWidth: 1,
            style: const TextStyle(fontFamily: UEFontFamily),
            cursorHeight: UHeight30,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(UPdMg10),
              hintText: '\t\tបញ្ចូលពាក្យសម្ងាត់'.tr,
              hintStyle: TextStyle(
                fontSize: UBodySize10,
                color: UGreyColor,
                fontFamily: Get.locale?.languageCode == 'km' ? UKFontFamily : UEFontFamily,
              ),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 15,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UGreyColor),
              ),
              suffixIconColor: UGreyColor,
              errorStyle: const TextStyle(
                fontSize: UBodySize10,
                fontFamily: UKFontFamily,
              ),
            ),
          ),
        ),
        buildHeight10(),
      ],
    ),
  );
}

Widget buildSubmitButton(final Function() submitForm) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: submitForm,
    child: Container(
      width: 100,
      height: UHeight40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UPdMg5),
        color: UPrimaryColor,
      ),
      child: Text(
        'ចូល'.tr,
        style: const TextStyle(
          color: UBackgroundColor,
          fontSize: UTitleSize,
        ),
      ),
    ),
  );
}
