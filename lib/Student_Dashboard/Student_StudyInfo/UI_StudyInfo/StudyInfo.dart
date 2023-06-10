import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_StudyInfo/Class_Study_Info.dart';

class Study_Info extends StatefulWidget {
  const Study_Info({super.key});

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការសិក្សា'.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UPdMg_5),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: studyInformationData.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: 1,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(URoundedLarge),
              ),
              color: UBackgroundColor,
              margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Padding(
                padding: EdgeInsets.all(UPdMg_8),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalTitleTheme(
                                text: studyInformationData[index].days),
                            buildDividerAtt(),
                            NormalTitleTheme(
                                text: studyInformationData[index].months),
                          ],
                        ),
                      ),
                      buildVerticalDividerAtt(),
                      Container(
                        padding: EdgeInsets.only(left: UPdMg_8),
                        child: IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                child: TitleSize16_Theme(
                                    text: studyInformationData[index]
                                        .semesterTitle),
                              ),
                              buildDividerAtt(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTheme(text: 'មុខវិជ្ជា\t'),
                                  Container(
                                    width: 200,
                                    alignment: Alignment.centerLeft,
                                    child: BodyTheme(
                                        text: studyInformationData[index]
                                            .majorTitle),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTheme(
                                    text: 'បន្ទប់\t',
                                  ),
                                  Container(
                                    width: 200,
                                    alignment: Alignment.centerLeft,
                                    child: BodyTheme(
                                        text: studyInformationData[index]
                                            .roomTitle),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyTheme(
                                    text: 'ម៉ោង\t',
                                  ),
                                  Container(
                                    width: 200,
                                    alignment: Alignment.centerLeft,
                                    child: BodyTheme(
                                        text: studyInformationData[index]
                                            .timeExam),
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
          },
        ),
      ),
    );
  }
}
