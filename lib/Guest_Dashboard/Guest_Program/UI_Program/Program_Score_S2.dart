import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Program/Class_Program/Class_Program_Score_S2.dart';

import '../../../theme_builder.dart';

class Program_Score_S2 extends StatefulWidget {
  const Program_Score_S2({super.key});

  @override
  State<Program_Score_S2> createState() => _Program_Score_S2State();
}

class _Program_Score_S2State extends State<Program_Score_S2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SingleChildScrollView(
        child: Card(
          elevation: 2,
          shadowColor: UGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          margin: EdgeInsets.all(UPdMg_10),
          color: Colors.white,
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
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(URoundedLarge),
                    right: Radius.circular(URoundedLarge),
                  ),
                  color: UBGLightBlue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: TitleTheme(text: 'មុខវិជ្ជា'.tr)),
                    Row(
                      children: [
                        Container(child: TitleTheme(text: 'ម៉ោង'.tr)),
                        SizedBox(width: 15),
                        Container(child: TitleTheme(text: 'ក្រេឌីត'.tr))
                      ],
                    ),
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
                  itemCount: class_program_score_s2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: UPdMg_10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: BodyTheme(
                                      text: class_program_score_s2[index]
                                          .subject)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: BodyTheme(
                                      text: class_program_score_s2[index]
                                          .hour
                                          .toString(),
                                    ),
                                  ),
                                  SizedBox(width: 35),
                                  Container(
                                    margin: EdgeInsets.only(right: UPdMg_10),
                                    child: BodyTheme(
                                      text: class_program_score_s2[index]
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
                padding: EdgeInsets.all(UPdMg_5),
                width: UFullWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: TitleTheme(text: 'សរុប'.tr)),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: TitleTheme(
                            text: class_program_score_s2
                                .fold(0, (sum, data) => sum + data.hour)
                                .toString(),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: TitleTheme(
                            text: class_program_score_s2
                                .fold(0, (sum, data) => sum + data.credit)
                                .toString(),
                          ),
                        ),
                      ],
                    ),
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
