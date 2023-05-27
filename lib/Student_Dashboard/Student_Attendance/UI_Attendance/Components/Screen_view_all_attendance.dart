// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Custom_AppBar.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context)
          .secondaryHeaderColor, // backgroundColor: Theme.of(context).secondaryHeaderColor,
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

                /// Comments Points
                /** 
               * * =========
               * ! Menu horizontal 
               * */
                SizedBox(
                  height: 60,
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
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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

                /// Comments Points
                /** 
               * * =========
               * ! category horizontal 
               * */
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 14.0,
                      ),
                      label: const Text(
                        'វត្តមាន',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 14.0,
                        color: Colors.orangeAccent,
                      ),
                      label: const Text(
                        'យឺត',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 14.0,
                        color: Colors.deepOrange,
                      ),
                      label: const Text(
                        'អវត្តមានមានច្បាប់',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle,
                        size: 14.0,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'អវត្តមានឥតច្បាប់',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color(0xffE9F2FF),
                    ),
                    child: Center(
                      child: Text(
                        'ឆមាសទី ១',
                        style: TextStyle(
                          color: Color(0xff002060),
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Comments Points
                /** 
               * * =============
               * ! Body ListView Semester 1
               * */
                Container(
                  child: const Major_Attendance(),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Color(0xffE9F2FF),
                    ),
                    child: Center(
                      child: Text(
                        'ឆមាសទី ២',
                        style: TextStyle(
                          color: Color(0xff002060),
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Comments Points
                /** 
               * * =============
               * ! Body ListView Semester 1
               * */
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
