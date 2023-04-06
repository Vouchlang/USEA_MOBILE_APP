import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

class Job_History extends StatefulWidget {
  const Job_History({super.key});

  @override
  State<Job_History> createState() => _Job_HistoryState();
}

class _Job_HistoryState extends State<Job_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Jos History'.tr),
    );
  }
}
