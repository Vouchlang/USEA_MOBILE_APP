import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Custom_AppBar.dart';
import '../Custom_Widget/CustomText.dart';
import '../theme_builder.dart';

class Staff_Login extends StatelessWidget {
  const Staff_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'គណនីបុគ្គលិក'.tr,
      ),
      body: buildComingSoon(),
    );
  }
}
