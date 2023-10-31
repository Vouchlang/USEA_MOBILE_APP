import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Custom_AppBar.dart';
import '../theme_builder.dart';

class Guardian_Login extends StatefulWidget {
  const Guardian_Login({super.key});

  @override
  State<Guardian_Login> createState() => _Guardian_LoginState();
}

class _Guardian_LoginState extends State<Guardian_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'គណនីអាណាព្យាបាល'.tr,
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
