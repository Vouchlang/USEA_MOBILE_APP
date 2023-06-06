// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../Class_Payment/Class_Payment.dart';
import 'Dialog_payment.dart';

// ! card 1
class PaymentCards extends StatelessWidget {
  const PaymentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(UPd_Mg_ExtraSmall),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: UGreyColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(UPdMg_10),

                    // * Header Title
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildHeaderTitle(45, 'ឆ្នាំ'),
                        buildVerticalDividerAtt(),
                        buildHeaderTitle(55, 'ទឹកប្រាក់ត្រូវបង់'),
                        buildVerticalDividerAtt(),
                        buildHeaderTitle(55, 'ទឹកប្រាក់បានបង់'),
                        buildVerticalDividerAtt(),
                        buildHeaderTitle(55, 'ទឹកប្រាក់នៅសល់'),
                      ],
                    ),
                  ),
                ),
                buildDividerAtt(),

                // * Body Content
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paymentData.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(UPdMg_8),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildBody(
                                    45,
                                    paymentData[index].yearPayment,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerAtt(),
                                  buildBody(
                                    55,
                                    paymentData[index].amountToPaid,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerAtt(),
                                  buildBody(
                                    55,
                                    paymentData[index].amountPaid,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerAtt(),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => PaymentDialog(),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 55,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: URedColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          paymentData[index].balance,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: UBodySize,
                                            color: URedColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.3,
                            color: Colors.grey,
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// ! card 2
class PaymentCards2 extends StatelessWidget {
  const PaymentCards2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(UPdMg_5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: UGreyColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(UPdMg_5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildHeaderTitle(75, 'កាលបរិច្ឆេទ'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(75, 'លេខវិក័យបត្រ'),
                        buildVerticalDividerW_2(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់ត្រូវបង់'),
                        buildVerticalDividerW_2(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់បានបង់'),
                        buildVerticalDividerW_2(),
                        buildHeaderTitle(50, 'ទឹកប្រាក់នៅសល់'),
                      ],
                    ),
                  ),
                ),
                buildVerticalDividerAtt(),

                // * Body Content​2
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
                              padding: EdgeInsets.all(UPdMg_5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // * datePayment
                                  buildBody(
                                    75,
                                    paymentData2[index].datePayment2,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_5(),
                                  buildBody(
                                    75,
                                    paymentData2[index].invoiceNum2,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData2[index].amountToPaid2,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData2[index].amountPaid2,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    50,
                                    paymentData2[index].balance2,
                                    URedColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: UGreyColor),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ! card 3
class PaymentCards3 extends StatelessWidget {
  const PaymentCards3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(UPdMg_5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: UGreyColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(UPdMg_5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildHeaderTitle(75, 'កាលបរិច្ឆេទ'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(75, 'លេខវិក័យបត្រ'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់ត្រូវបង់'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់បានបង់'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(50, 'ទឹកប្រាក់នៅសល់'),
                      ],
                    ),
                  ),
                ),
                Divider(color: UGreyColor),

                // * Body Content​3
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: paymentData4.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(UPdMg_5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // * datePayment
                                  buildBody(
                                    75,
                                    paymentData4[index].datePayment4,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_5(),
                                  buildBody(
                                    75,
                                    paymentData4[index].invoiceNum4,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData4[index].amountToPaid4,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData4[index].amountPaid4,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    50,
                                    paymentData4[index].balance4,
                                    URedColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: UGreyColor),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// ! card 4
class PaymentCards4 extends StatelessWidget {
  const PaymentCards4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(UPdMg_5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: UGreyColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(UPdMg_5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildHeaderTitle(75, 'កាលបរិច្ឆេទ'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(75, 'លេខវិក័យបត្រ'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់ត្រូវបង់'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(45, 'ទឹកប្រាក់បានបង់'),
                        buildVerticalDividerW_5(),
                        buildHeaderTitle(50, 'ទឹកប្រាក់នៅសល់'),
                      ],
                    ),
                  ),
                ),
                Divider(color: UGreyColor),

                // * Body Content4
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: paymentData3.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(UPdMg_5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // * datePayment
                                  buildBody(
                                    75,
                                    paymentData3[index].datePayment3,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_5(),
                                  buildBody(
                                    75,
                                    paymentData3[index].invoiceNum3,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData3[index].amountToPaid3,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    45,
                                    paymentData3[index].amountPaid3,
                                    UTextColor,
                                  ),
                                  buildVerticalDividerW_2(),
                                  buildBody(
                                    50,
                                    paymentData3[index].balance3,
                                    URedColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: UGreyColor),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
