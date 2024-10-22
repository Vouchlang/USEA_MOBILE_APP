import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានថ្មីៗ'.tr),
      body: buildComingSoon(),
    );
  }
}
