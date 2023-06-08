import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';
import 'package:usea_app/theme_builder.dart';
import 'Components/Card_carlendar.dart';
import 'Components/Card_carlendar_list.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'កាលវិភាគ'.tr),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 5),
        children: [
          CardCalendar(),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'កាលវិភាគសិក្សា'.tr,
              style: TextStyle(
                fontSize: UTitleSize16,
                color: UPrimaryColor,
              ),
            ),
          ),
          CardCalendarList(),
        ],
      ),
    );
  }
}
