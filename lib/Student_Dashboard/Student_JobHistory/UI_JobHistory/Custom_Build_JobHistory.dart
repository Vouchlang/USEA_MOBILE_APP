import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme_builder.dart';

Widget buildJobHistoryData({
  required final String textTitle,
  textValue,
}) {
  return Container(
    padding: const EdgeInsets.all(UPdMg10),
    child: Row(
      children: [
        Container(
          width: 125,
          child: Text(
            textTitle.tr,
            style: const TextStyle(fontSize: UTitleSize),
          ),
        ),
        Expanded(
          child: Text(
            textValue,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UBodyWeight,
              color: UTextColor,
              fontFamily: UKFontFamily,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildJobHistoryNoData() {
  return FutureBuilder(
    future: Future.delayed(
      const Duration(seconds: 5),
    ),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(color: UPrimaryColor),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(UPdMg5),
          child: Card(
            elevation: 0.5,
            shadowColor: ULightGreyColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: UBackgroundColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            margin: const EdgeInsets.all(UPdMg10),
            color: UBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: UPdMg15,
                    horizontal: UPdMg10,
                  ),
                  width: UFullWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(URoundedLarge),
                    ),
                    color: UBGLightBlue,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr + 'N/A',
                        style: const TextStyle(
                          fontSize: UTitleSize,
                          fontWeight: UTitleWeight,
                          color: UPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                buildJobHistoryData(
                  textTitle: 'ស្ថានភាពការងារ',
                  textValue: 'N/A',
                ),
                buildJobHistoryData(
                  textTitle: 'ស្ថាប័ន',
                  textValue: 'N/A',
                ),
                buildJobHistoryData(
                  textTitle: 'មុខតំណែង',
                  textValue: 'N/A',
                ),
                buildJobHistoryData(
                  textTitle: 'ប្រាក់បៀវត្ស',
                  textValue: 'N/A',
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}

Widget buildJobHistoryDataCard({
  required final double lastIndex,
  required final String startDate,
  required final Widget widgetStatus,
  widgetWorkplace,
  widgetPosition,
  widgetSalary,
}) {
  return Card(
    elevation: 0.5,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: UBackgroundColor,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    margin: EdgeInsets.fromLTRB(
      UPdMg10,
      UPdMg15,
      UPdMg10,
      lastIndex,
    ),
    color: UBackgroundColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: UPdMg15,
            horizontal: UPdMg10,
          ),
          width: UFullWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(URoundedLarge),
            ),
            color: UBGLightBlue,
          ),
          height: UHeight50,
          child: Row(
            children: [
              Text(
                startDate,
                style: const TextStyle(
                  fontSize: UTitleSize,
                  fontWeight: UTitleWeight,
                  color: UPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        widgetStatus,
        widgetWorkplace,
        widgetPosition,
        widgetSalary,
      ],
    ),
  );
}
