import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ព័ត៌មានថ្មីៗ'.tr,
      ),
      body: Center(
        child: Text(
          'Coming Soon!!!',
          style: TextStyle(
              color: UPrimaryColor,
              fontSize: UTitleSize16,
              fontWeight: UTitleWeight,
              fontFamily: UEFontFamily),
        ),
      ),
    );
  }
}
