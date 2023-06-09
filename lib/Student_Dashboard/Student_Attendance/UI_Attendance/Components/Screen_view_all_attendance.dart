// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Custom_AppBar.dart';
import '../../../../Custom_Widget/CustomText.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Container(
                  height: 70,
                  width: UFullWidth,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
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
                        height: 70,
                        width: 120,
                        decoration: BoxDecoration(
                          color: current == index
                              ? UPrimaryColor
                              : UBackgroundColor,
                          borderRadius: BorderRadius.circular(URoundedMedium),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: ULightGreyColor,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        margin: EdgeInsets.all(UPdMg_5),
                        child: Center(
                          child: Text(
                            items[index].toString().tr,
                            style: TextStyle(
                              fontSize: UTitleSize,
                              color: current == index
                                  ? UBackgroundColor
                                  : UTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: UPdMg_10,
                    vertical: UPdMg_5,
                  ),
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
                  padding: EdgeInsets.all(UPdMg_5),
                  child: Container(
                    height: 65,
                    width: UFullWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                      color: UBtnColor,
                    ),
                    child: Center(child: TitleTheme(text: 'ឆមាសទី ១'.tr)),
                  ),
                ),
                // ? Attendance List Card
                Major_Attendance(),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    UPdMg_5,
                    UPdMg_10,
                    UPdMg_5,
                    UPdMg_5,
                  ),
                  child: Container(
                    height: 70,
                    width: UFullWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                      color: UBGLightBlue,
                    ),
                    child: Center(child: TitleTheme(text: 'ឆមាសទី ២'.tr)),
                  ),
                ),
                // ? Attendance List Card
                Major_Attendance(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
