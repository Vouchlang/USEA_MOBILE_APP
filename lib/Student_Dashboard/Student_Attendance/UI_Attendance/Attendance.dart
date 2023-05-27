import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                /// Comments Points
                /** 
               * * =========
               * ! Menu horizontal 
               * */
                Row(
                  children: [
                    const SizedBox(
                      width: 0,
                      height: 50,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 13.0,
                      ),
                      label: const Text(
                        'វត្តមាន',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 13.0,
                        color: Colors.orangeAccent,
                      ),
                      label: const Text(
                        'យឺត',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 13.0,
                        color: Colors.deepOrange,
                      ),
                      label: const Text(
                        'អវត្តមានមានច្បាប់',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 13.0,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'អវត្តមានឥតច្បាប់',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Comments Points
                /** 
               * * =============
               * ! Body ListView
               * */
                Container(
                  child: const Major_Attendance(),
                ),

                /// Comments Points
                /** 
               * * ===============
               * ! Button View All
               * */
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 0.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const All_Attendance_of_Year(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE8F0FE),
                      ),
                      child: const Text(
                        'មើលទាំងអស់',
                        style: TextStyle(
                          color: Color(0xff002060),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
