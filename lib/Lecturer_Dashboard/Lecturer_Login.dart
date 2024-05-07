import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Custom_AppBar.dart';
import '../Custom_Widget/CustomText.dart';
import '../theme_builder.dart';

class Lecturer_Login extends StatefulWidget {
  const Lecturer_Login({super.key});

  @override
  State<Lecturer_Login> createState() => _Lecturer_LoginState();
}

class _Lecturer_LoginState extends State<Lecturer_Login> {
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
