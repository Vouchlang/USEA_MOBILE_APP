// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../../Custom_Widget/CustomText.dart';
import '../../Class_Attendance/Class_Attendance.dart';
import 'Card_all_attendance.dart';

class Major_Attendance extends StatefulWidget {
  const Major_Attendance({super.key});

  @override
  State<Major_Attendance> createState() => _Major_AttendanceState();
}

class _Major_AttendanceState extends State<Major_Attendance> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: attendance_data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              UPdMg_10,
              UPdMg_15,
              UPdMg_15,
              UPdMg_15,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => All_info_major(),
                    ),
                  );
                });
              },
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 175,
                          child: NormalTitleTheme(
                              text: attendance_data[index].subject),
                        ),
                        Row(
                          children: [
                            buildCHText(attendance_data[index].hour.toString()),
                            buildCHText('\tក្រេឌីត\t'.tr),
                            buildCHText(attendance_data[index].hour.toString()),
                            buildCHText('\tម៉ោង'.tr),
                          ],
                        )
                      ],
                    ),
                    buildNum('0', USecondaryColor),
                    buildDivider(),
                    buildNum('5', UOrangeColor),
                    buildDivider(),
                    buildNum('2', URedColor),
                    buildDivider(),
                    buildNum('12', UScoreColor),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
