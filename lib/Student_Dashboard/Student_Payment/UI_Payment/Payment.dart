import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ការបង់ប្រាក់'.tr),
      body: ListView(
        children: [
          /// ! ការបង់ថ្លៃឈ្នួលសិក្សា
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'ការបង់ថ្លៃឈ្នួលសិក្សា',
                    style: TextStyle(
                      color: Color(0xff002060),
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: const PaymentCards(),
              ),
            ],
          ),

          /// ! ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ',
                    style: TextStyle(
                      color: Color(0xff002060),
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: const PaymentCards2(),
              ),
            ],
          ),

          /// ! ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត',
                  style: TextStyle(
                    color: Color(0xff002060),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                child: const PaymentCards3(),
              ),
            ],
          ),

          /// ! ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ',
                  style: TextStyle(
                    color: Color(0xff002060),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                child: const PaymentCards4(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
