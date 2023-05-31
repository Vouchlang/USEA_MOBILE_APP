// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Custom_AppBar.dart';
import '../../../../theme_builder.dart';
import 'Card_attendacne.dart';

// ignore: camel_case_types
class All_Attendance_of_Year extends StatefulWidget {
  const All_Attendance_of_Year({super.key});

  @override
  State<All_Attendance_of_Year> createState() => _All_Attendance_of_YearState();
}

class _All_Attendance_of_YearState extends State<All_Attendance_of_Year> {
  List<String> items = [
    "ឆ្នាំទី​ ១",
    "ឆ្នាំទី​ ២",
    "ឆ្នាំទី​ ៣",
    "ឆ្នាំទី​ ៤",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
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
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: current == index
                              ? const Color(0xff002060)
                              : const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey,
                                offset: Offset(0, 1))
                          ],
                        ),
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            items[index].toString().tr,
                            style: TextStyle(
                              fontSize: 14,
                              color: current == index
                                  ? Color(0xffFFFFFF)
                                  : Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x142D74F5),
                    ),
                    child: Center(
                      child: Text(
                        'ឆមាសទី ១'.tr,
                        style: TextStyle(
                          color: Color(0xff002060),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: const Major_Attendance(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE9F2FF),
                    ),
                    child: Center(
                      child: Text(
                        'ឆមាសទី ២'.tr,
                        style: TextStyle(
                          color: Color(0xff002060),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: const Major_Attendance(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
