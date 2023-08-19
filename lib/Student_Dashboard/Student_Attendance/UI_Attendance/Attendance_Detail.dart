import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Attendance/Class_Attendance.dart';

class Attendance_Detail extends StatefulWidget {
  final String subjectName;
  final List<Dates> subjectDate;

  const Attendance_Detail(
      {Key? key, required this.subjectDate, required this.subjectName})
      : super(key: key);

  @override
  State<Attendance_Detail> createState() => _Attendance_DetailState();
}

class _Attendance_DetailState extends State<Attendance_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: Card(
        elevation: 2,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(URoundedLarge),
        ),
        margin: EdgeInsets.all(UPdMg_10),
        color: UBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: UPdMg_10,
                horizontal: UPdMg_10,
              ),
              width: UFullWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(URoundedLarge),
                  topRight: Radius.circular(URoundedLarge),
                ),
                color: UBGLightBlue,
              ),
              child: CustomTextTheme(
                text: widget.subjectName,
                color: UPrimaryColor,
                fontWeight: UTitleWeight,
                size: UTitleSize,
              ),
            ),
            if (widget.subjectDate.isNotEmpty)
              Expanded(
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.all(UPdMg_8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildHeader('កាលបរិច្ឆេទ'.tr),
                            buildVerticalDividerAtt(),
                            buildHeader('Session'.tr),
                            buildVerticalDividerAtt(),
                            buildHeader('វត្តមាន'.tr),
                          ],
                        ),
                      ),
                    ),
                    buildDividerAtt(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.subjectDate.length,
                        itemBuilder: (context, outerIndex) {
                          final subject = widget.subjectDate[outerIndex];
                          final isLastIndex =
                              outerIndex == widget.subjectDate.length - 1;
                          return Container(
                            width: UFullWidth,
                            color: UBackgroundColor,
                            child: Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      buildTextTitle(
                                          subject.date_name, UTextColor),
                                      buildVerticalDividerAtt(),
                                      Column(
                                        children:
                                            subject.sessions.map((session) {
                                          // Check if this is the last item in the list
                                          final isLastItem =
                                              session == subject.sessions.last;
                                          return Column(
                                            children: [
                                              buildTextTitle(
                                                  session.session, UTextColor),
                                              !isLastItem
                                                  ? Container(
                                                      width: 70,
                                                      height: 0.5,
                                                      color: UGreyColor,
                                                      margin: EdgeInsets.only(
                                                        bottom: UPdMg_5,
                                                        top: UPdMg_5,
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 70,
                                                    ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                      buildVerticalDividerAtt(),
                                      Column(
                                        children:
                                            subject.sessions.map((session) {
                                          // Check if this is the last item in the list
                                          final isLastItem =
                                              session == subject.sessions.last;
                                          return Column(
                                            children: [
                                              buildTextTitle(
                                                  session.absent_status,
                                                  session.absent_status ==
                                                          'awop'
                                                      ? URedColor
                                                      : session.absent_status ==
                                                              'al'
                                                          ? UYellowColor
                                                          : session.absent_status ==
                                                                  'awp'
                                                              ? UOrangeColor
                                                              : session.absent_status ==
                                                                      'ps'
                                                                  ? UScoreColor
                                                                  : UTextColor),
                                              !isLastItem
                                                  ? Container(
                                                      width: 70,
                                                      height: 0.5,
                                                      color: UGreyColor,
                                                      margin: EdgeInsets.only(
                                                        bottom: UPdMg_5,
                                                        top: UPdMg_5,
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 70,
                                                    ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                !isLastIndex
                                    ? buildDividerAtt()
                                    : SizedBox(
                                        height: 5,
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            else
              Column(
                children: [
                  IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(UPdMg_8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildHeader('កាលបរិច្ឆេទ'.tr),
                          buildVerticalDividerAtt(),
                          buildHeader('Session'.tr),
                          buildVerticalDividerAtt(),
                          buildHeader('វត្តមាន'.tr),
                        ],
                      ),
                    ),
                  ),
                  buildDividerAtt(),
                  IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(UPdMg_8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildHeaderNA('N/A'.tr),
                          buildVerticalDividerAtt(),
                          buildHeaderNA('N/A'.tr),
                          buildVerticalDividerAtt(),
                          buildHeaderNA('N/A'.tr),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
