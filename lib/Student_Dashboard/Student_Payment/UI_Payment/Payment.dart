import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'ការបង់ប្រាក់'.tr),
    );
  }
}
