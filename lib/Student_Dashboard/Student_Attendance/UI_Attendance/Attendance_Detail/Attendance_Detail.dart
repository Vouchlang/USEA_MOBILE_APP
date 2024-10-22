import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_AppBar.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../Class_Attendance/Class_Attendance.dart';
import 'Build_Custom_Attendance_Detail.dart';

class Attendance_Detail extends StatelessWidget {
  final String subjectName;
  final List<Dates> subjectDate;

  const Attendance_Detail({
    Key? key,
    required this.subjectDate,
    required this.subjectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'វត្តមាន'.tr,
      ),
      body: buildListSubData(),
    );
  }

  Widget buildListSubData() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Card(
          elevation: 0.5,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: UBackgroundColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          margin: const EdgeInsets.symmetric(
            vertical: UPdMg15,
            horizontal: UPdMg10,
          ),
          color: UBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSubName(subjectName),
              subjectDate.isNotEmpty
                  ? Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: UPdMg10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  buildHeader('កាលបរិច្ឆេទ'.tr),
                                  buildVerticalDividerAtt(),
                                  buildAttDetailHeader(
                                    width: 100,
                                    text: 'ម៉ោងសិក្សា'.tr,
                                    textColor: UPrimaryColor,
                                  ),
                                  buildVerticalDividerAtt(),
                                  buildHeader('វត្តមាន'.tr),
                                ],
                              ),
                            ),
                          ),
                          buildDividerAtt(),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subjectDate.length,
                              itemBuilder: (context, outerIndex) {
                                final subject = subjectDate[outerIndex];
                                final isLastIndex = outerIndex == subjectDate.length - 1;
                                return Container(
                                  width: UFullWidth,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(URoundedLarge),
                                    ),
                                    color: UBackgroundColor,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            buildAttTextBody(
                                              width: 80,
                                              text: subject.date_name,
                                              color: UTextColor,
                                            ),
                                            buildVerticalDividerAtt(),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: subject.sessions.map(
                                                (session) {
                                                  final isLastItem = session == subject.sessions.last;
                                                  return Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      buildAttTextBody(
                                                        width: 100,
                                                        text: session.session_all,
                                                        color: UTextColor,
                                                      ),
                                                      !isLastItem
                                                          ? Container(
                                                              width: 100,
                                                              height: 0.5,
                                                              color: UGreyColor,
                                                            )
                                                          : const SizedBox(width: 100),
                                                    ],
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                            buildVerticalDividerAtt(),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: subject.sessions.map((session) {
                                                final isLastItem = session == subject.sessions.last;
                                                return Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    buildAttTextBody(
                                                      width: 80,
                                                      text: session.absent_status == 'awop'
                                                          ? 'អវត្តមាន'.tr
                                                          : session.absent_status == 'al'
                                                              ? 'យឺត'.tr
                                                              : session.absent_status == 'awp'
                                                                  ? 'សុំច្បាប់'.tr
                                                                  : session.absent_status == 'ps'
                                                                      ? 'វត្តមាន\t'.tr
                                                                      : 'N/A',
                                                      color: session.absent_status == 'awop'
                                                          ? URedColor
                                                          : session.absent_status == 'al'
                                                              ? UYellowColor
                                                              : session.absent_status == 'awp'
                                                                  ? UOrangeColor
                                                                  : session.absent_status == 'ps'
                                                                      ? UScoreColor
                                                                      : UTextColor,
                                                    ),
                                                    !isLastItem
                                                        ? Container(
                                                            width: 75,
                                                            height: 0.5,
                                                            color: UGreyColor,
                                                          )
                                                        : SizedBox(width: 75),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      !isLastIndex ? buildDividerAtt() : buildHeight5(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : buildSubDataNA(),
            ],
          ),
        ),
      ],
    );
  }
}
