import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';
import 'package:usea_app/theme_builder.dart';

import 'Components/Card_payment.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Widget buildTitle(String text, Widget widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Container(
            child: Text(
              text.tr,
              style: TextStyle(
                color: UPrimaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          child: widget,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ការបង់ប្រាក់'.tr),
      body: ListView(
        children: [
          buildTitle('ការបង់ថ្លៃឈ្នួលសិក្សា', PaymentCards()),
          buildTitle('ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ', PaymentCards2()),
          buildTitle('ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត', PaymentCards3()),
          buildTitle(
              'ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ', PaymentCards4()),
        ],
      ),
    );
  }
}
