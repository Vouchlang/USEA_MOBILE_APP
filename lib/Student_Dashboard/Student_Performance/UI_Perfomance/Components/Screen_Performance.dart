// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../Class_Performance/Class_Data_performance.dart';
import 'Dialog_performance.dart';

class Card_learning_pro_1 extends StatelessWidget {
  const Card_learning_pro_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ! Semester 01
        Container(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: UBackgroundColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            margin: EdgeInsets.all(UPdMg_10),
            color: UBackgroundColor,

            // todo: BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // *Container Header Card 1
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_15,
                    horizontal: UPdMg_10,
                  ),
                  width: UFullWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(URoundedLarge),
                      topRight: Radius.circular(URoundedLarge),
                      bottomRight: Radius.circular(UZeroPixel),
                      bottomLeft: Radius.circular(UZeroPixel),
                    ),
                    color: UBGLightBlue,
                  ),

                  // *Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ១".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: UTitleSize,
                              fontWeight: UTitleWeight,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              buildTitleContainer(
                                100,
                                'វត្តមាន',
                                Alignment.centerRight,
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                              ),
                              buildTitleContainer(
                                50,
                                'ពិន្ទុ',
                                Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // *Body Card 1
                Container(
                  padding: EdgeInsets.all(UPdMg_10),
                  width: UFullWidth,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: UPdMg_10),
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
                                        fontSize: UTitleSize,
                                        fontFamily: UFontFamily,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BuildAttScore(
                                        customDialog: CustomAttDialog(),
                                        text: class_program_Score_s1[index]
                                            .att
                                            .toStringAsFixed(2),
                                      ),
                                      VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      ),
                                      BuildAttScore(
                                        customDialog: CustomScoreDialog(),
                                        text: class_program_Score_s1[index]
                                            .score
                                            .toStringAsFixed(2),
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

                // ? Total Score
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'មធ្យមភាគៈ',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
                      ),
                      buildScoreTotal(
                        class_program_Score_s1
                            .fold(
                              0.0,
                              (sum, data) =>
                                  sum +
                                  (data.score) / class_program_Score_s1.length,
                            )
                            .toString()
                            .substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
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
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'GPA:',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
                      ),
                      buildScoreTotal('9.99'),
                    ],
                  ),
                ),

                // ! End Total Score and End Body card 1
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
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            margin: EdgeInsets.fromLTRB(
              UPdMg_10,
              UZeroPixel,
              UPdMg_10,
              UPdMg_10,
            ),
            color: Colors.white,

            // todo: BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // *Container Header Card 1
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_15,
                    horizontal: UPdMg_10,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UPdMg_10),
                      topRight: Radius.circular(UPdMg_10),
                      bottomRight: Radius.circular(UZeroPixel),
                      bottomLeft: Radius.circular(UZeroPixel),
                    ),
                    color: UBGLightBlue,
                  ),

                  // *Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ២".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: UTitleSize,
                              fontWeight: UTitleWeight,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              buildTitleContainer(
                                100,
                                'វត្តមាន',
                                Alignment.centerRight,
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                              ),
                              buildTitleContainer(
                                50,
                                'ពិន្ទុ',
                                Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // *Body Card 2
                Container(
                  padding: EdgeInsets.all(UPdMg_10),
                  width: UFullWidth,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: UPdMg_10),
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
                                        fontSize: UTitleSize,
                                        fontFamily: UFontFamily,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BuildAttScore(
                                        customDialog: CustomAttDialog(),
                                        text: class_program_Score_s1[index]
                                            .att
                                            .toStringAsFixed(2),
                                      ),
                                      VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      ),
                                      BuildAttScore(
                                        customDialog: CustomAttDialog(),
                                        text: class_program_Score_s1[index]
                                            .score
                                            .toStringAsFixed(2),
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

                // ?Total Score
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'មធ្យមភាគៈ',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
                      ),
                      buildScoreTotal(
                        class_program_Score_s1
                            .fold(
                              0.0,
                              (sum, data) =>
                                  sum +
                                  (data.score) / class_program_Score_s1.length,
                            )
                            .toString()
                            .substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
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
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_5,
                    horizontal: UPdMg_10,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'GPA:',
                        style: TextStyle(
                          color: UPrimaryColor,
                        ),
                      ),
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
