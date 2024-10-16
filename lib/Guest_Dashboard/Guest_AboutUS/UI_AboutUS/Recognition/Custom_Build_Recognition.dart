import 'package:flutter/material.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildRecognitionCard({
  required final Widget image,
  required final String title,
  required final Widget btnNav,
}) {
  return Card(
    elevation: 0.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        URoundedLarge,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(URoundedLarge),
          ),
          child: image,
        ),
        buildWidth10(),
        Padding(
          padding: const EdgeInsets.all(UPdMg10),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: UTitleSize,
                  fontWeight: UTitleWeight,
                ),
              ),
              buildHeight10(),
              Container(
                alignment: Alignment.center,
                child: btnNav,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
