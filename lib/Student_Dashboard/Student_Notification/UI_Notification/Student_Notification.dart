import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

class Students_Notifications extends StatefulWidget {
  @override
  _Students_NotificationsState createState() => _Students_NotificationsState();
}

class _Students_NotificationsState extends State<Students_Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,

      // appBar: Custom_AppBar(
      //   title: 'ព័ត៌មានថ្មីៗ'.tr,
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: UWidth10,
        toolbarHeight: 75,
        centerTitle: false,
        backgroundColor: UBackgroundColor,
        shadowColor: UGreyColor,
        elevation: 1,
        title: Text(
          'ព័ត៌មានថ្មីៗ'.tr,
          style: const TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
      ),
      body: buildComingSoon(),
    );
  }
}
