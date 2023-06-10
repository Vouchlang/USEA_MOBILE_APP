// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';
import '../../Class_StudyInfo/Class_Study_Info.dart';

class StudyInformationCards extends StatelessWidget {
  const StudyInformationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: studyInformationData.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          elevation: 2,
          shadowColor: ULightGreyColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: UBackgroundColor,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalTitleTheme(
                        text: studyInformationData[index].days,
                      ),
                      Divider(),
                      NormalTitleTheme(
                        text: studyInformationData[index].months,
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TitleSize16_Theme(
                            text: studyInformationData[index].semesterTitle,
                          ),
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyTheme(
                              text: 'មុខវិជ្ជា\t',
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: BodyTheme(
                                  text: studyInformationData[index].majorTitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyTheme(
                              text: 'បន្ទប់\t',
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: BodyTheme(
                                  text: studyInformationData[index].roomTitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyTheme(
                              text: 'ម៉ោង\t',
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: BodyTheme(
                                  text: studyInformationData[index].timeExam,
                                ),
                              ),
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
      },
    );
  }
}
