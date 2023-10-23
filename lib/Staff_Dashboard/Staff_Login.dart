import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Custom_AppBar.dart';
import '../theme_builder.dart';

class Staff_Login extends StatefulWidget {
  const Staff_Login({super.key});

  @override
  State<Staff_Login> createState() => _Staff_LoginState();
}

class _Staff_LoginState extends State<Staff_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'គណនីបុគ្គលិក'.tr,
      ),
      body: Center(
        child: Text(
          'មកដល់ឆាប់ៗនេះ!!!'.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: UTitleSize16,
            fontWeight: UTitleWeight,
          ),
        ),
      ),
    );
  }
}
