import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildAttList({
  required final String text,
  required final Color color,
}) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: UBodySize,
      ),
      buildWidth5(),
      Text(
        text.tr,
        style: const TextStyle(
          color: UTextColor,
          fontSize: UBodySize,
        ),
      ),
    ],
  );
}

Widget buildNumAtt({
  required final String text,
  required final Color color,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: UTitleSize,
      fontWeight: UBodyWeight,
      fontFamily: UEFontFamily,
    ),
  );
}

Widget buildAttListRow() {
  return Container(
    margin: const EdgeInsets.only(top: UPdMg15),
    padding: const EdgeInsets.fromLTRB(
      UPdMg5,
      UZeroPixel,
      UPdMg5,
      UPdMg10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildAttList(
          text: 'យឺត',
          color: UYellowColor,
        ),
        buildAttList(
          text: 'សុំច្បាប់',
          color: UOrangeColor,
        ),
        buildAttList(
          text: 'អវត្តមាន',
          color: URedColor,
        ),
        buildAttList(
          text: 'វត្តមាន\t',
          color: UScoreColor,
        ),
      ],
    ),
  );
}

Widget buildAttReadAllBtn(final Widget buildNavBtn) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: UPdMg10),
        child: buildNavBtn,
      )
    ],
  );
}

Widget buildAttListSubData({
  required final Function() onTap,
  required final String subName,
  required final Widget widgetCredit,
  widgetHour,
  widgetAl,
  widgetPm,
  widgetA,
  widgetPs,
}) {
  return Card(
    color: UBackgroundColor,
    surfaceTintColor: UBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    margin: const EdgeInsets.fromLTRB(
      UPdMg5,
      UZeroPixel,
      UPdMg5,
      UPdMg10,
    ),
    elevation: 1,
    shadowColor: ULightGreyColor,
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          UPdMg10,
          UPdMg15,
          UPdMg15,
          UPdMg15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 165,
                  child: Text(
                    subName,
                    style: const TextStyle(
                      height: UTextHeight,
                      fontSize: UTitleSize,
                      fontWeight: UTitleWeight,
                      color: UTextColor,
                    ),
                  ),
                ),
                buildHeight5(),
                Row(
                  children: [
                    widgetCredit,
                    buildCHText('\tក្រេឌីត\t'.tr),
                    widgetHour,
                    buildCHText('\tម៉ោង'.tr),
                  ],
                )
              ],
            ),
            buildWidth5(),
            widgetAl,
            buildDivider(),
            widgetPm,
            buildDivider(),
            widgetA,
            buildDivider(),
            widgetPs,
          ],
        ),
      ),
    ),
  );
}

Widget buildErrorAtt() => const Center(
      child: Text('No data available for attendance.'),
    );

Widget buildErrorAttSemester() => const Center(
      child: Text('No semesters in the last year.'),
    );

Widget buildErrorAttSubject() => const Center(
      child: Text('No subjects in the last semester of the last year.'),
    );
