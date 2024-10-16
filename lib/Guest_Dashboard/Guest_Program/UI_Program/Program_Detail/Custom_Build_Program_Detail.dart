import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildYearNameCard({
  required final Function() onTap,
  required final String yearName,
}) {
  return Card(
    elevation: 1.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(UPdMg10),
        alignment: Alignment.center,
        child: Text(
          yearName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: UTitleSize,
            fontWeight: UTitleWeight,
            color: UTextColor,
            height: UTextHeight,
          ),
        ),
      ),
    ),
  );
}

Widget buildYearNameDialog() {
  return Dialog(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: Container(
      margin: const EdgeInsets.all(UPdMg7),
      padding: const EdgeInsets.all(UPdMg10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'សូមអធ្យាស្រ័យ'.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          buildHeight5(),
          Text(
            'គ្មានទិន្ន័យ'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: UBodySize,
            ),
          ),
          buildHeight5(),
          Container(
            height: UHeight50,
            padding: const EdgeInsets.all(UPdMg5),
            alignment: Alignment.center,
            child: TextButton(
              child: Text(
                'បោះបង់'.tr,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UBodySize,
                ),
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSubjectName(final String subjectName) {
  return Expanded(
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
  );
}
