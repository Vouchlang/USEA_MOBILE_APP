import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:usea_app/Custom_AppBar.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 2,
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: TableCalendar(
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
              ),
            ),
          ),

          //
          //
          // TITLE
          //
          //
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "កាលវិភាគសិក្សា",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 4, 9, 71)),
              ),
            ),
          ),

          //
          //
          // List of item
          //
          //

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text("data1"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text("data1"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text("data1"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text("data1"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 230, 230, 230),
                    blurRadius: 1,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text("data1"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
