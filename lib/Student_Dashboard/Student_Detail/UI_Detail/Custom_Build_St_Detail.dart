import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildTopStDetail1({
  required final Function() imageBtn,
  required final Widget qrCode,
  required final String imageUrl,
  nameKh,
  nameEn,
  stId,
  year,
  semester,
  stage,
  term,
  academic,
}) {
  return Card(
    margin: const EdgeInsets.only(
      left: UPdMg12,
      right: UPdMg12,
      top: UPdMg15,
      bottom: UPdMg5,
    ),
    elevation: 0.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UPdMg10),
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            UPdMg10,
            UPdMg10,
            UPdMg10,
            UZeroPixel,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  InkWell(
                    highlightColor: UTransParentColor,
                    splashColor: UTransParentColor,
                    onTap: imageBtn,
                    child: ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  qrCode,
                ],
              ),
              buildWidth15(),
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
                      fontWeight: UTitleWeight,
                    ),
                    buildHeaderDetail(
                      text: stId,
                      font: UEFontFamily,
                      size: UTitleSize,
                      fontWeight: UTitleWeight,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        buildDividerStDetail(),
        Container(
          padding: const EdgeInsets.only(bottom: UPdMg10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBodyDetail(
                text1: 'ឆ្នាំ',
                text2: year,
              ),
              buildBodyDetail(
                text1: 'ឆមាស',
                text2: semester,
              ),
              buildBodyDetail(
                text1: 'ជំនាន់',
                text2: stage,
              ),
              buildBodyDetail(
                text1: 'វគ្គ',
                text2: term,
              ),
              buildBodyDetail(
                text1: 'ឆ្នាំសិក្សា',
                text2: academic,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildBottomDetail({
  required final String facName,
  degreeName,
  majorName,
  roomName,
  shiftName,
  statusName,
  dob,
  phone,
  job,
  workplace,
}) {
  return Card(
    margin: const EdgeInsets.only(
      left: UPdMg12,
      right: UPdMg12,
      top: UPdMg7,
      bottom: UPdMg15,
    ),
    elevation: 0.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UPdMg10),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: UPdMg15),
      child: Column(
        children: [
          buildTailDetail(
            image: imageAsset + 'Stu_Faculty.png',
            title: 'មហាវិទ្យាល័យ'.tr,
            text: facName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Degree.png',
            title: 'កម្រិតសិក្សា'.tr,
            text: degreeName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Major.png',
            title: 'មុខជំនាញ'.tr,
            text: majorName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Room.png',
            title: 'បន្ទប់សិក្សា'.tr,
            text: roomName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Shift.png',
            title: 'វេនសិក្សា'.tr,
            text: shiftName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Status.png',
            title: 'ស្ថានភាពសិក្សា'.tr,
            text: statusName,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_DOB.png',
            title: 'ថ្ងៃកំណើត'.tr,
            text: dob,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Tel.png',
            title: 'លេខទូរស័ព្ទ'.tr,
            text: phone,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Job.png',
            title: 'មុខតំណែង'.tr,
            text: job,
          ),
          buildDividerStDetail(),
          buildTailDetail(
            image: imageAsset + 'Stu_Workplace.png',
            title: 'ស្ថាប័ន'.tr,
            text: workplace,
          ),
        ],
      ),
    ),
  );
}

Widget buildTailDetail({
  required String image,
  title,
  text,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: UPdMg10),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          scale: UScale5,
        ),
        buildWidth10(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UBodySize,
                  fontWeight: UTitleWeight,
                ),
              ),
              buildHeight5(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: UTitleSize,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
