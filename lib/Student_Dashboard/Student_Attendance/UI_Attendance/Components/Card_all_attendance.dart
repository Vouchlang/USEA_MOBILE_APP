// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../../Custom_AppBar.dart';
import '../Data/Data_List_attendance.dart';

class All_info_major extends StatefulWidget {
  const All_info_major({super.key});

  @override
  State<All_info_major> createState() => _All_info_majorState();
}

class _All_info_majorState extends State<All_info_major> {
  Widget buildHeader(String text) {
    return Container(
      width: 75,
      child: Text(
        text.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Color(0xFEE8F0FE),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text(
                        "សេដ្ធកិច្ចវិទ្យា",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'KhmerOSbattambang',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildHeader('កាលបរិច្ឆេទ'.tr),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: VerticalDivider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              buildHeader('វត្តមាន'.tr),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: VerticalDivider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              buildHeader('Session'.tr),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Row_Data_List(),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
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
