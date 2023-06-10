import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Guest_Dashboard/Guest_Program/Class_Program/Class_Program_Score_S1.dart';
import '/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';

class Program_Score_S1 extends StatefulWidget {
  const Program_Score_S1({super.key});

  @override
  State<Program_Score_S1> createState() => _Program_Score_S1State();
}

class _Program_Score_S1State extends State<Program_Score_S1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: SingleChildScrollView(
        child: Card(
          elevation: 2,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          margin: EdgeInsets.all(UPdMg_10),
          color: UBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: UPdMg_15,
                  horizontal: UPdMg_5,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  color: UBGLightBlue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleTheme(
                      text: 'មុខវិជ្ជា'.tr,
                    ),
                    Row(
                      children: [
                        TitleTheme(
                          text: 'ម៉ោង'.tr,
                        ),
                        SizedBox(width: 15),
                        TitleTheme(
                          text: 'ក្រេឌីត'.tr,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(UPdMg_5),
                width: UFullWidth,
                color: UBackgroundColor,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: class_program_score_s1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: UPdMg_10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: NoWeightTitleTheme(
                                    text:
                                        class_program_score_s1[index].subject),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  NoWeightTitleTheme(
                                      text: class_program_score_s1[index]
                                          .hour
                                          .toString()),
                                  SizedBox(width: 35),
                                  Container(
                                    margin: EdgeInsets.only(right: UPdMg_10),
                                    child: NoWeightTitleTheme(
                                      text: class_program_score_s1[index]
                                          .credit
                                          .toString(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleTheme(
                      text: 'សរុប'.tr,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: TitleTheme(
                              text: class_program_score_s1
                                  .fold(0, (sum, data) => sum + data.hour)
                                  .toString()),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: TitleTheme(
                              text: class_program_score_s1
                                  .fold(0, (sum, data) => sum + data.credit)
                                  .toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
