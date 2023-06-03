// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
import '../Class_Performance/Class_Data_performance.dart';
import 'Dialog_performance.dart';

class Card_learning_pro_1 extends StatelessWidget {
  const Card_learning_pro_1({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildTitleContainer(double width, String text) {
      return Container(
        width: width,
        alignment: Alignment.center,
        child: Text(
          text.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget buildAttScore(String text, Widget customDialog) {
      return Container(
        width: 50,
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => customDialog,
            );
          },
          child: Text(
            text.tr,
            style: TextStyle(
                color: UScoreColor,
                fontSize: 14,
                fontFamily: 'KhmerOSbattambang',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    Widget buildScoreTotal(String text) {
      return Container(
        width: 50,
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: TextStyle(color: UPrimaryColor),
        ),
      );
    }

    return Column(
      children: [
        /// ! Semester 01
        Container(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            color: Colors.white,

            /// BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ! Header Card 1
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Color(0xFEE8F0FE),
                  ),

                  /// Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ១".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              buildTitleContainer(100, 'វត្តមាន'),
                              VerticalDivider(
                                color: Colors.grey,
                              ),
                              buildTitleContainer(50, 'Score'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// ! Body Card 1
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      class_program_Score_s1[index].subject,
                                      style: TextStyle(
                                        color: UTextColor,
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildAttScore(
                                        class_program_Score_s1[index]
                                            .att
                                            .toStringAsFixed(2),
                                        CustomAttDialog(),
                                      ),
                                      VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      ),
                                      buildAttScore(
                                        class_program_Score_s1[index]
                                            .score
                                            .toStringAsFixed(2),
                                        CustomScoreDialog(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('មធ្យមភាគៈ', style: TextStyle(color: UPrimaryColor)),
                      buildScoreTotal(
                        class_program_Score_s1
                            .fold(
                                0.0,
                                (sum, data) =>
                                    sum +
                                    (data.score) /
                                        class_program_Score_s1.length)
                            .toString()
                            .substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ',
                        style: TextStyle(color: UPrimaryColor),
                      ),
                      buildScoreTotal(
                        (class_program_Score_s1.indexWhere((data) =>
                                    data.score ==
                                    class_program_Score_s1[0].score) +
                                1)
                            .toString(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('GPA:', style: TextStyle(color: UPrimaryColor)),
                      buildScoreTotal('9.99'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ! Semester 02
        Container(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            color: Colors.white,

            /// BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ! Header Card 1
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Color(0xFEE8F0FE),
                  ),

                  /// Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ២".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              buildTitleContainer(100, 'វត្តមាន'),
                              VerticalDivider(
                                color: Colors.grey,
                              ),
                              buildTitleContainer(50, 'Score'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// ! Body Card 1
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        class_program_Score_s1[index].subject,
                                        style: TextStyle(
                                          color: UTextColor,
                                          fontSize: 14,
                                          fontFamily: 'KhmerOSbattambang',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildAttScore(
                                        class_program_Score_s1[index]
                                            .att
                                            .toStringAsFixed(2),
                                        CustomAttDialog(),
                                      ),
                                      VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      ),
                                      buildAttScore(
                                        class_program_Score_s1[index]
                                            .score
                                            .toStringAsFixed(2),
                                        CustomScoreDialog(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('មធ្យមភាគៈ', style: TextStyle(color: UPrimaryColor)),
                      buildScoreTotal(
                        class_program_Score_s1
                            .fold(
                                0.0,
                                (sum, data) =>
                                    sum +
                                    (data.score) /
                                        class_program_Score_s1.length)
                            .toString()
                            .substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ',
                        style: TextStyle(color: UPrimaryColor),
                      ),
                      buildScoreTotal(
                        (class_program_Score_s1.indexWhere((data) =>
                                    data.score ==
                                    class_program_Score_s1[0].score) +
                                1)
                            .toString(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('GPA:', style: TextStyle(color: UPrimaryColor)),
                      buildScoreTotal('9.99'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
