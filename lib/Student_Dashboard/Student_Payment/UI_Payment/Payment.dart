import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';
import 'package:usea_app/theme_builder.dart';
import '../../../Custom_Widget/CustomText.dart';
import 'Components/Card_payment.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការបង់ប្រាក់'.tr),
      body: ListView(
        children: [
          buildTitle(
            'ការបង់ថ្លៃឈ្នួលសិក្សា',
            PaymentCards(),
          ),
          buildTitle(
            'ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ',
            PaymentCards2(),
          ),
          buildTitle(
            'ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត',
            PaymentCards3(),
          ),
          buildTitle(
            'ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ',
            PaymentCards4(),
          ),
        ],
      ),
    );
  }
}
