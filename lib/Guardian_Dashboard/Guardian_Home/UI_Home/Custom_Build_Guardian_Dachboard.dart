import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildDialogSignOut({
  required final String signOutTxtDes,
  required final Function() popBtn,
  signOutBtn,
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
            'ចាកចេញ'.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          buildHeight10(),
          Text(
            signOutTxtDes,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: UBodySize,
              height: UTextHeight,
            ),
          ),
          buildHeight15(),
          Container(
            height: UHeight40,
            padding: const EdgeInsets.all(UPdMg5),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: popBtn,
                  child: Text(
                    'បោះបង់'.tr,
                    style: const TextStyle(
                      color: UPrimaryColor,
                      fontSize: UBodySize,
                    ),
                  ),
                ),
                buildVerticalDividerAtt(),
                InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: signOutBtn,
                  child: Text(
                    'ចាកចេញ'.tr,
                    style: const TextStyle(
                      color: URedColor,
                      fontSize: UBodySize,
                    ),
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

Widget buildTopProfile({
  required final String pfImage,
  nameKh,
  nameEn,
  stId,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg10,
      horizontal: UPdMg20,
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(pfImage),
          radius: 50,
        ),
        buildWidth20(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeaderDetail(
                text: nameKh,
                font: UKFontFamily,
                size: UTitleSize16,
                fontWeight: UTitleWeight,
              ),
              buildHeaderDetail(
                text: nameEn,
                font: UEFontFamily,
                size: UTitleSize16,
                fontWeight: UBodyWeight,
              ),
              buildHeaderDetail(
                text: stId,
                font: UEFontFamily,
                size: UBodySize,
                fontWeight: UBodyWeight,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildBottomProfile({
  required final String year,
  semester,
  stage,
  term,
  academic_year,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildBodyDetail(
        text1: 'ឆ្នាំ',
        text2: year,
      ),
      buildVerticalDividerH_45(),
      buildBodyDetail(
        text1: 'ឆមាស',
        text2: semester,
      ),
      buildVerticalDividerH_45(),
      buildBodyDetail(
        text1: 'ជំនាន់',
        text2: stage,
      ),
      buildVerticalDividerH_45(),
      buildBodyDetail(
        text1: 'វគ្គ',
        text2: term,
      ),
      buildVerticalDividerH_45(),
      buildBodyDetail(
        text1: 'ឆ្នាំសិក្សា',
        text2: academic_year,
      ),
    ],
  );
}
