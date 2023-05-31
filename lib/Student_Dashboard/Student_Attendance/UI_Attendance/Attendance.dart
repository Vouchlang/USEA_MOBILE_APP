import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

import '../../../theme_builder.dart';
import 'Components/Card_attendacne.dart';
import 'Components/Screen_view_all_attendance.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Widget buildAttList(String text, Color color) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 12,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text.tr,
          style: TextStyle(
            color: UTextColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 0, 3, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildAttList('វត្តមាន\t', UScoreColor),
                      buildAttList('យឺត', USecondaryColor),
                      buildAttList('អវត្តមានមានច្បាប់', UOrangeColor),
                      buildAttList('អវត្តមាន', URedColor),
                    ],
                  ),
                ),
                Major_Attendance(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0x142D74F5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x142D74F5),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const All_Attendance_of_Year(),
                            ),
                          );
                        },
                        child: Text(
                          'មើលទាំងអស់'.tr,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
