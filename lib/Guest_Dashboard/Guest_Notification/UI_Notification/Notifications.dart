import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
import '/Custom_AppBar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានថ្មីៗ'.tr),
    );
  }
}
