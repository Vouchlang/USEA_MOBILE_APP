import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/Class_News_Event/Class_Up_News_Events.dart';

import '../../../Custom_AppBar.dart';

class Up_Event_Detail extends StatelessWidget {
  final Up_News_Event data;

  const Up_Event_Detail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: Custom_AppBar(title: 'ព្រឹត្តិការណ៍'.tr),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 175,
                child: Image.asset(
                  data.img,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.grey,
                          blurRadius: 2)
                    ]),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Text(
                  data.title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'KhmerOSbattambang'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Align(
                  child: Text(
                    data.detail_description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'KhmerOSbattambang'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
