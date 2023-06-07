// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
import '../../../../Custom_AppBar.dart';
import '../../../../Custom_Widget/CustomText.dart';
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey[200],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: CustomTextTheme(
                        text: "សេដ្ធកិច្ចវិទ្យា",
                        color: UPrimaryColor,
                        fontWeight: UTitleWeight,
                        size: UBodySize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: UFullWidth,
                color: UBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: IntrinsicHeight(
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
