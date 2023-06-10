// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Data/Data_List_attendance.dart';

class All_info_major extends StatefulWidget {
  const All_info_major({super.key});

  @override
  State<All_info_major> createState() => _All_info_majorState();
}

class _All_info_majorState extends State<All_info_major> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
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
                  vertical: UPdMg_10,
                  horizontal: UPdMg_10,
                ),
                width: UFullWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(URoundedLarge),
                    topRight: Radius.circular(URoundedLarge),
                  ),
                  color: UBGLightBlue,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CustomTextTheme(
                    text: "សេដ្ធកិច្ចវិទ្យា",
                    color: UPrimaryColor,
                    fontWeight: UTitleWeight,
                    size: UTitleSize,
                  ),
                ),
              ),
              Container(
                width: UFullWidth,
                color: UBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.all(UPdMg_8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildHeader('កាលបរិច្ឆេទ'.tr),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: UPdMg_15,
                              ),
                              child: buildVerticalDividerAtt(),
                            ),
                            buildHeader('Session'.tr),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: UPdMg_15,
                              ),
                              child: buildVerticalDividerAtt(),
                            ),
                            buildHeader('វត្តមាន'.tr),
                          ],
                        ),
                      ),
                    ),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
                    buildDividerAtt(),
                    Row_Data_List(),
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
