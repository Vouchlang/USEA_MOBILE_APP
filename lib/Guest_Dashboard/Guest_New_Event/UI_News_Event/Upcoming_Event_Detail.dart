import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/Class_News_Event/Class_Up_News_Events.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../Custom_AppBar.dart';

class Up_Event_Detail extends StatelessWidget {
  final Class_Upcoming_Event data;

  const Up_Event_Detail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getImageUrl(String imageName) {
      return 'http://192.168.3.34/hosting_api/Guest/event_image/$imageName';
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព្រឹត្តិការណ៍'.tr),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            UZeroPixel,
            UZeroPixel,
            UZeroPixel,
            UPdMg_10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 175,
                child: InteractiveViewer(
                  child: Image.network(
                    getImageUrl(data.upcoming_image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: UBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(URoundedLarge),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: UGreyColor,
                      blurRadius: 1,
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: UPdMg_10,
                  horizontal: UPdMg_5,
                ),
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Text(
                  data.upcoming_title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UTitleWeight,
                    fontFamily: UKFontFamily,
                  ),
                ),
              ),
              SizedBox(height: UPdMg_10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: UZeroPixel,
                  horizontal: UPdMg_10,
                ),
                child: Align(
                  child: Text(
                    data.upcoming_desc,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: UBodySize,
                      fontFamily: UKFontFamily,
                    ),
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
