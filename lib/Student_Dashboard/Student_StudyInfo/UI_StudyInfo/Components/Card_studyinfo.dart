// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Custom_Widget/CustomText.dart';
import '../Data/Data_studyinfo.dart';

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
            shadowColor: Colors.black,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NormalTitleTheme(
                            text: studyInformationData[index].days,
                            size: 14,
                          ),
                          Divider(),
                          NormalTitleTheme(
                            text: studyInformationData[index].months,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Container(
                      width: 250,
                      padding: EdgeInsets.only(left: 8.0),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalTitleTheme(
                              text: studyInformationData[index].semesterTitle,
                              size: 16,
                            ),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyTheme(
                                  text: 'មុខវិជ្ជា\t',
                                  size: 14,
                                ),
                                Container(
                                  width: 190,
                                  alignment: Alignment.centerLeft,
                                  child: BodyTheme(
                                    text:
                                        studyInformationData[index].majorTitle,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyTheme(
                                  text: 'បន្ទប់\t',
                                  size: 14,
                                ),
                                Container(
                                  width: 190,
                                  alignment: Alignment.centerLeft,
                                  child: BodyTheme(
                                    text: studyInformationData[index].roomTitle,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BodyTheme(
                                  text: 'ម៉ោង\t',
                                  size: 14,
                                ),
                                Container(
                                  width: 190,
                                  alignment: Alignment.centerLeft,
                                  child: BodyTheme(
                                    text: studyInformationData[index].timeExam,
                                    size: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
