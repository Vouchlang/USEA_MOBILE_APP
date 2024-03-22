// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';
import '../../Class_Payment/Class_Payment.dart';

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
      backgroundColor: UBackgroundColor,
      insetPadding: EdgeInsets.all(
        UPdMg10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            URoundedLarge,
          ),
        ),
      ),
      child: Stack(
        children: [
          CardDailog(),
          Positioned(
            right: UZeroPixel,
            top: UZeroPixel,
            height: UHeight50,
            width: UWidth50,
            child: InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/image/close.png',
                scale: UScale10,
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
            padding: EdgeInsets.symmetric(
              vertical: UPdMg10,
              horizontal: UPdMg10,
            ),
            width: UFullWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  URoundedLarge,
                ),
                topRight: Radius.circular(
                  URoundedLarge,
                ),
              ),
              color: UBGLightBlue,
            ),

            /// ! Header Table
            child: Row(
              children: [
                Text(
                  "ឆ្នាំទី​ ១".tr,
                  style: TextStyle(
                    color: UPrimaryColor,
                    fontSize: UTitleSize,
                    fontFamily: UKFontFamily,
                    fontWeight: UTitleWeight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(
                    UPdMg5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildHeaderTitle(
                        75,
                        'កាលបរិច្ឆេទ',
                      ),
                      VerticalDivider(
                        width: UWidth5,
                        color: UGreyColor,
                      ),
                      buildHeaderTitle(
                        75,
                        'លេខវិក័យបត្រ',
                      ),
                      VerticalDivider(
                        width: UWidth5,
                        color: UGreyColor,
                      ),
                      buildHeaderTitle(
                        UWidth45,
                        'ទឹកប្រាក់ត្រូវបង់',
                      ),
                      VerticalDivider(
                        width: UWidth5,
                        color: UGreyColor,
                      ),
                      buildHeaderTitle(
                        UWidth45,
                        'ទឹកប្រាក់បានបង់',
                      ),
                      VerticalDivider(
                        width: UWidth5,
                        color: UGreyColor,
                      ),
                      buildHeaderTitle(
                        UWidth50,
                        'ទឹកប្រាក់នៅសល់',
                      ),
                    ],
                  ),
                ),
              ),
              buildDividerAtt(),

              /// ! Body Content​2
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: paymentData2.length,
                itemBuilder: (context, index) {
                  final isLastIndex = index == paymentData2.length - 1;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: isLastIndex ? UPdMg5 : UZeroPixel,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              padding: EdgeInsets.all(
                                UPdMg8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  /// ! datePayment
                                  buildBody(
                                    75,
                                    paymentData2[index].datePayment2,
                                    UTextColor,
                                  ),
                                  VerticalDivider(
                                    width: UWidth5,
                                    color: UGreyColor,
                                  ),
                                  buildBody(
                                    75,
                                    paymentData2[index].invoiceNum2,
                                    UTextColor,
                                  ),

                                  VerticalDivider(
                                    width: UWidth5,
                                    color: UGreyColor,
                                  ),
                                  buildBody(
                                    UWidth45,
                                    paymentData2[index].amountToPaid2,
                                    UTextColor,
                                  ),

                                  VerticalDivider(
                                    width: UWidth5,
                                    color: UGreyColor,
                                  ),
                                  buildBody(
                                    UWidth45,
                                    paymentData2[index].amountPaid2,
                                    UTextColor,
                                  ),
                                  VerticalDivider(
                                    width: UWidth5,
                                    color: UGreyColor,
                                  ),
                                  buildBody(
                                    UWidth50,
                                    paymentData2[index].balance2,
                                    UTextColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isLastIndex) buildDividerAtt(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
