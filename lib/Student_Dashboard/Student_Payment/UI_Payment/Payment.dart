import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'Payment_FeesWithdrawal/Payment_FeesWithdrawal.dart';
import 'Payment_Tuition/Payment_Tuition.dart';

class Payment_UI extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  Payment_UI({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<Payment_UI> createState() => _Payment_UIState();
}

class _Payment_UIState extends State<Payment_UI> {
  late bool isLoading = false;
  late PaymentTuition paymentTuition;
  late PaymentFeeswithdrawal paymentFeeswithdrawal;

  @override
  void initState() {
    super.initState();
    paymentTuition = PaymentTuition(
      data_studentUser: widget.data_studentUser,
      sourceScreen: widget.sourceScreen,
    );
    paymentFeeswithdrawal = PaymentFeeswithdrawal(
      data_studentUser: widget.data_studentUser,
      sourceScreen: widget.sourceScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការបង់ប្រាក់'.tr),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: UPdMg10),
        children: [
          buildTitle(
            text: 'ការបង់ថ្លៃឈ្នួលសិក្សា',
            widget: paymentTuition,
          ),

          // buildTitle(
          //     'ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ (Not Available)', paymentTuition),
          // buildTitle(
          //     'ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត (Not Available)', paymentTuition),
          buildTitle(
            text: 'ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ',
            widget: paymentFeeswithdrawal,
          ),
        ],
      ),
    );
  }
}
