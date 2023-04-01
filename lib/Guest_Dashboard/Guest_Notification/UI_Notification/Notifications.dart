import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: Custom_AppBar(title: 'ព័ត៌មានថ្មីៗ'.tr),
    );
  }
}
