import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Custom_AppBar.dart';
import '../Custom_Widget/CustomText.dart';
import '../theme_builder.dart';

class Lecturer_Login extends StatelessWidget {
  const Lecturer_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'គណនីសាស្ត្រាចារ្យ'.tr,
      ),
      body: buildComingSoon(),
    );
  }
}
