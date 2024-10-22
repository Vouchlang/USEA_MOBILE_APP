import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

// University's Name Container
Widget buildUniversityCon(final String name) {
  return Container(
    width: UFullWidth,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    height: UHeight50,
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        color: UPrimaryColor,
        height: UTextHeight,
      ),
    ),
  );
}

// Scholarship Card
Widget buildScholarCard({
  required final Widget buildUniversityCon,
  buildScholarEducationLevel,
  buildScholarMajorName,
  buildScholarExpireDate,
  required final String scholarUrl,
}) {
  return Card(
    elevation: 0.5,
    shadowColor: ULightGreyColor,
    color: UBackgroundColor,
    margin: const EdgeInsets.only(bottom: UPdMg10),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: UBackgroundColor,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildUniversityCon,
        Padding(
          padding: const EdgeInsets.all(UPdMg10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScholarEducationLevel,
              buildScholarMajorName,
              ScholarshipTitleTheme('ថ្ងៃផុតកំណត់៖ '.tr),
              buildScholarExpireDate,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildNavBtn(
                    onTap: () {
                      void _launchOutUniUrl() async {
                        if (await canLaunchUrlString(scholarUrl)) {
                          await launchUrlString(scholarUrl);
                        } else {
                          throw 'Could not launch ${scholarUrl}';
                        }
                      }

                      _launchOutUniUrl();
                    },
                    text: 'អានបន្ថែម',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Scholarship Text
Widget ScholarshipTitleTheme(final String text) {
  return Container(
    height: UHeight30,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        color: UTextColor,
        height: UTextHeight,
      ),
    ),
  );
}

// Scholarship Body text
Widget ScholarshipBodyTheme(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      fontWeight: UBodyWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
