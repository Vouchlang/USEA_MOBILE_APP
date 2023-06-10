import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import 'Components/Card_attendacne.dart';
import 'Components/Screen_view_all_attendance.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UPdMg_10,
            vertical: UPdMg_15,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAttList('វត្តមាន\t', UScoreColor),
                    buildAttList('យឺត', UYellowColor),
                    buildAttList('អវត្តមានមានច្បាប់', UOrangeColor),
                    buildAttList('អវត្តមាន', URedColor),
                  ],
                ),
              ),
              // ? Attendance List Card
              Major_Attendance(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: UPdMg_5,
                      horizontal: UPdMg_10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(URoundedMedium),
                      color: UBtnColor,
                      boxShadow: [BoxShadow(color: UBtnColor)],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => All_Attendance_of_Year()),
                        );
                      },
                      child: CustomTextTheme(
                        text: 'មើលទាំងអស់'.tr,
                        color: UPrimaryColor,
                        fontWeight: UBodyWeight,
                        size: UBodySize,
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
