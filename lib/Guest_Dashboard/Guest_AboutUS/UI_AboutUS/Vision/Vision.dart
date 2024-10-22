import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Build_Custom_Vision.dart';

class Vision extends StatelessWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ'.tr),
      body: buildVision(),
    );
  }
}
