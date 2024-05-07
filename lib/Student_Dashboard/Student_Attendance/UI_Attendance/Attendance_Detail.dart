import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Attendance/Class_Attendance.dart';

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
      body: SingleChildScrollView(
        child: Card(
          elevation: 2,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              URoundedLarge,
            ),
          ),
          margin: EdgeInsets.all(
            UPdMg10,
          ),
          color: UBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: UPdMg15,
                  horizontal: UPdMg10,
                ),
                width: UFullWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      URoundedLarge,
                    ),
                    topRight: Radius.circular(
                      URoundedLarge,
                    ),
                  ),
                  color: UBGLightBlue,
                ),
                child: CustomAttTextTheme(
                  subjectName,
                  UTitleSize,
                  UPrimaryColor,
                  UTitleWeight,
                ),
              ),
              subjectDate.isNotEmpty
                  ? Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IntrinsicHeight(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: UPdMg10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildHeader(
                                    'កាលបរិច្ឆេទ'.tr,
                                  ),
                                  buildVerticalDividerAtt(),
                                  buildAttDetailHeader(
                                    'ម៉ោងសិក្សា'.tr,
                                  ),
                                  buildVerticalDividerAtt(),
                                  buildHeader(
                                    'វត្តមាន'.tr,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          buildDividerAtt(),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: subjectDate.length,
                              itemBuilder: (context, outerIndex) {
                                final subject = subjectDate[outerIndex];
                                final isLastIndex =
                                    outerIndex == subjectDate.length - 1;
                                return Container(
                                  width: UFullWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        URoundedLarge,
                                      ),
                                      bottomRight: Radius.circular(
                                        URoundedLarge,
                                      ),
                                    ),
                                    color: UBackgroundColor,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            buildTextBody(
                                              subject.date_name,
                                              UTextColor,
                                            ),
                                            buildVerticalDividerAtt(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: subject.sessions
                                                  .map((session) {
                                                final isLastItem = session ==
                                                    subject.sessions.last;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    buildAttTextBody(
                                                        session.session_all,
                                                        UTextColor),
                                                    !isLastItem
                                                        ? Container(
                                                            width: 100,
                                                            height: 0.5,
                                                            color: UGreyColor,
                                                          )
                                                        : Container(
                                                            width: 100,
                                                          ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                            buildVerticalDividerAtt(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: subject.sessions
                                                  .map((session) {
                                                final isLastItem = session ==
                                                    subject.sessions.last;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    buildTextBody(
                                                        session.absent_status ==
                                                                'awop'
                                                            ? 'អវត្តមាន'.tr
                                                            : session.absent_status ==
                                                                    'al'
                                                                ? 'យឺត'.tr
                                                                : session.absent_status ==
                                                                        'awp'
                                                                    ? 'សុំច្បាប់'
                                                                        .tr
                                                                    : session.absent_status ==
                                                                            'ps'
                                                                        ? 'វត្តមាន\t'
                                                                            .tr
                                                                        : 'N/A',
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
                                                            width: 75,
                                                            height: 0.5,
                                                            color: UGreyColor,
                                                          )
                                                        : Container(
                                                            width: 75,
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
                                              height: UHeight5,
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
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.all(
                              UPdMg8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildHeader(
                                  'កាលបរិច្ឆេទ'.tr,
                                ),
                                buildVerticalDividerAtt(),
                                buildHeader(
                                  'ម៉ោងសិក្សា'.tr,
                                ),
                                buildVerticalDividerAtt(),
                                buildHeader(
                                  'វត្តមាន'.tr,
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildDividerAtt(),
                        IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.all(
                              UPdMg8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildHeaderNA(
                                  'N/A'.tr,
                                ),
                                buildVerticalDividerAtt(),
                                buildHeaderNA(
                                  'N/A'.tr,
                                ),
                                buildVerticalDividerAtt(),
                                buildHeaderNA(
                                  'N/A'.tr,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
