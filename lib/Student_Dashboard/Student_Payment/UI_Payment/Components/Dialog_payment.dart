// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../../Class_Payment/Class_Payment.dart';
import 'Card_payment.dart';

class PaymentDialog extends StatefulWidget {
  const PaymentDialog({super.key});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: [
          CardDailog(),
          Positioned(
            right: 0,
            top: 0,
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/image/close.png',
                scale: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container CardDailog() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Color(0xFEE8F0FE),
            ),

            /// ! Header Table
            child: Row(
              children: [
                Container(
                  child: Text(
                    "ឆ្នាំទី​ ១".tr,
                    style: TextStyle(
                      color: UPrimaryColor,
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildHeaderTitle(75, 'កាលបរិច្ឆេទ'),
                            VerticalDivider(
                              width: 5,
                              color: Colors.grey,
                            ),
                            buildHeaderTitle(75, 'លេខវិក័យបត្រ'),
                            VerticalDivider(
                              width: 5,
                              color: Colors.grey,
                            ),
                            buildHeaderTitle(45, 'ទឹកប្រាក់ត្រូវបង់'),
                            VerticalDivider(
                              width: 5,
                              color: Colors.grey,
                            ),
                            buildHeaderTitle(45, 'ទឹកប្រាក់បានបង់'),
                            VerticalDivider(
                              width: 5,
                              color: Colors.grey,
                            ),
                            buildHeaderTitle(50, 'ទឹកប្រាក់នៅសល់'),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),

                    /// ! Body Content​2
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: paymentData2.length,
                      itemBuilder: (context, index) {
                        return IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      /// ! datePayment
                                      buildBody(
                                          75,
                                          paymentData2[index].datePayment2,
                                          UTextColor),

                                      VerticalDivider(
                                        width: 5,
                                        color: Colors.grey,
                                      ),
                                      buildBody(
                                          75,
                                          paymentData2[index].invoiceNum2,
                                          UTextColor),

                                      VerticalDivider(
                                        width: 5,
                                        color: Colors.grey,
                                      ),
                                      buildBody(
                                          45,
                                          paymentData2[index].amountToPaid2,
                                          UTextColor),

                                      VerticalDivider(
                                        width: 5,
                                        color: Colors.grey,
                                      ),
                                      buildBody(
                                          45,
                                          paymentData2[index].amountPaid2,
                                          UTextColor),
                                      VerticalDivider(
                                        width: 5,
                                        color: Colors.grey,
                                      ),
                                      buildBody(
                                          50,
                                          paymentData2[index].balance2,
                                          UTextColor),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
