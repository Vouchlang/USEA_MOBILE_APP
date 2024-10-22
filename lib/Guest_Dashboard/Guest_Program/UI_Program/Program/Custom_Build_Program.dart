import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

// No Weight Title
Widget NoWeightTitleTheme(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UBodyWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}

// Program & Program ACCA
Widget buildMajorNav({
  required final Function() onTap,
  required final String majorName,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(URoundedMedium),
        border: Border.all(color: UBGLightBlue),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: UPdMg8,
        horizontal: UPdMg5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              majorName,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: UTitleSize,
                color: UTextColor,
                height: UTextHeight,
              ),
            ),
          ),
          buildWidth15(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: UPrimaryColor,
          )
        ],
      ),
    ),
  );
}

Widget buildProgramCard({
  required final ThemeData themeData,
  required final String facKey,
  facultyIcon,
  facultyName,
  required final dynamic dynamicData,
}) {
  return Card(
    color: UBackgroundColor,
    margin: const EdgeInsets.fromLTRB(
      UPdMg10,
      UPdMg10,
      UPdMg10,
      UZeroPixel,
    ),
    elevation: 1,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: UPdMg5),
      child: Theme(
        data: themeData,
        child: ExpansionTile(
          collapsedIconColor: UPrimaryColor,
          iconColor: UPrimaryColor,
          key: PageStorageKey(facKey),
          title: Row(
            children: [
              CachedNetworkImage(
                imageUrl: facultyIcon,
                scale: UScale6,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: URedColor,
                ),
              ),
              buildWidth10(),
              Expanded(
                child: Text(
                  facultyName.toString().tr,
                  style: const TextStyle(
                    height: UTextHeight,
                    fontWeight: UTitleWeight,
                    fontSize: UTitleSize,
                    color: UPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          children: dynamicData,
        ),
      ),
    ),
  );
}
