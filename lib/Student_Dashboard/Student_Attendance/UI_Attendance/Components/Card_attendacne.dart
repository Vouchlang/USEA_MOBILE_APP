// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../Data/Data_attendance.dart';
import 'Card_all_attendance.dart';

class Major_Attendance extends StatefulWidget {
  const Major_Attendance({super.key});

  @override
  State<Major_Attendance> createState() => _Major_AttendanceState();
}

class _Major_AttendanceState extends State<Major_Attendance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: attendance_data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const All_info_major(),
                      ),
                    );
                  });
                },
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              attendance_data[index].subject,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                attendance_data[index].hour.toString(),
                              ),
                              const Text('\tក្រេឌីត\t'),
                              Text(
                                attendance_data[index].credit.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text('\tម៉ោង'),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 18,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 0.6,
                        height: 20,
                        color: Colors.grey,
                        margin: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      const Text(
                        '5',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 0.6,
                        height: 20,
                        color: Colors.grey,
                        margin: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 0.6,
                        height: 20,
                        color: Colors.grey,
                        margin: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      const Text(
                        '15',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
