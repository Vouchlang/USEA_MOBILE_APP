import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

import '../../../Custom_Widget/CustomText.dart';
import 'Components/Card_studyinfo.dart';
import 'Data/Data_studyinfo.dart';

class Study_Info extends StatefulWidget {
  const Study_Info({super.key});

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការសិក្សា'.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: studyInformationData.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                elevation: 2,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                margin: EdgeInsets.all(5),
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
                          padding: EdgeInsets.only(left: 8.0),
                          child: IntrinsicWidth(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  child: NormalTitleTheme(
                                    text: studyInformationData[index]
                                        .semesterTitle,
                                    size: 16,
                                  ),
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
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      child: BodyTheme(
                                        text: studyInformationData[index]
                                            .majorTitle,
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
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      child: BodyTheme(
                                        text: studyInformationData[index]
                                            .roomTitle,
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
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      child: BodyTheme(
                                        text: studyInformationData[index]
                                            .timeExam,
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
            }),
      ),
    );
  }
}
