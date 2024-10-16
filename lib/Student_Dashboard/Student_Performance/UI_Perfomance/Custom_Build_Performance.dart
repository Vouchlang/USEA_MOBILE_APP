import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildYearButton({
  required final Function() onTap,
  required final double width,
  required final Color boxColor,
  selectedColor,
  required final String yearName,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(
        horizontal: UPdMg5,
        vertical: UPdMg10,
      ),
      width: width,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(URoundedMedium),
        boxShadow: [
          const BoxShadow(
            blurRadius: 1,
            color: ULightGreyColor,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        yearName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: selectedColor,
        ),
      ),
    ),
  );
}

Widget buildBottomCard({
  required final String keyName,
  value,
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(
      UPdMg10,
      UZeroPixel,
      UPdMg10,
      UPdMg10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          keyName,
          style: const TextStyle(
            color: UPrimaryColor,
            fontWeight: UTitleWeight,
          ),
        ),
        Container(
          width: 65,
          padding: const EdgeInsets.only(right: UPdMg15),
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(
              color: UPrimaryColor,
              fontWeight: UTitleWeight,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildRowTitleCard({
  required final String semester,
  required final Widget attWidget,
  scoreWidget,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg15,
      horizontal: UPdMg10,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          URoundedLarge,
        ),
      ),
      color: UBGLightBlue,
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            semester,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: UPrimaryColor,
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          Row(
            children: [
              attWidget,
              const VerticalDivider(
                color: UGreyColor,
                thickness: 0.5,
                width: UZeroPixel,
              ),
              scoreWidget,
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildSubjectData(final String subjectName) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: UPdMg15),
      padding: const EdgeInsets.symmetric(vertical: UPdMg10),
      alignment: Alignment.topLeft,
      child: Text(
        subjectName,
        style: const TextStyle(
          color: UTextColor,
          fontSize: UTitleSize,
          height: UTextHeight,
        ),
      ),
    ),
  );
}

Widget buildAttData({
  required final Function() onTap,
  required final String attData,
}) {
  return Container(
    width: 50,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.symmetric(vertical: UPdMg10),
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: UPdMg5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: UScoreColor,
              width: 0.75,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          attData,
          style: const TextStyle(
            color: UScoreColor,
            fontSize: UTitleSize,
            fontWeight: UBodyWeight,
          ),
        ),
      ),
    ),
  );
}

Widget buildScoreData({
  required final Function() onTap,
  required final Color borderColor,
  scoreColor,
  required final String score,
}) {
  return Container(
    width: 55,
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.symmetric(vertical: UPdMg10),
    margin: const EdgeInsets.symmetric(horizontal: UPdMg5),
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: UPdMg5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: 0.75,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          score,
          style: TextStyle(
            color: scoreColor,
            fontSize: UTitleSize,
            fontWeight: UBodyWeight,
          ),
        ),
      ),
    ),
  );
}

Widget buildCloseImgPosition(final Function() onTap) {
  return Positioned(
    right: UZeroPixel,
    top: UPdMg5,
    height: UHeight40,
    width: UWidth50,
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Image.asset(
        imageAsset + 'close.png',
        scale: UScale10,
      ),
    ),
  );
}

Widget buildRowTitleContainer({
  required final double width,
  required final String text,
  required final Alignment align,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: UPdMg10),
    width: width,
    alignment: align,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}
