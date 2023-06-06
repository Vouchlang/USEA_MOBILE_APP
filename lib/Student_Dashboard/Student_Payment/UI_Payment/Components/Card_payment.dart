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
          padding: EdgeInsets.all(UPdMg_5),
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
                    padding: EdgeInsets.all(10.0),

                    // * Header Title
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildHeaderTitle(45, 'ឆ្នាំ'),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        buildHeaderTitle(55, 'ទឹកប្រាក់ត្រូវបង់'),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        buildHeaderTitle(55, 'ទឹកប្រាក់បានបង់'),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        buildHeaderTitle(55, 'ទឹកប្រាក់នៅសល់'),
                      ],
                    ),
                  ),
                ),

                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),

                /// ! Body Content
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
                            padding: EdgeInsets.all(8.0),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildBody(45, paymentData[index].yearPayment,
                                      UTextColor),
                                  VerticalDivider(
                                    thickness: 0.5,
                                    color: Colors.grey,
                                  ),
                                  buildBody(55, paymentData[index].amountToPaid,
                                      UTextColor),
                                  VerticalDivider(
                                    thickness: 0.5,
                                    color: Colors.grey,
                                  ),
                                  buildBody(55, paymentData[index].amountPaid,
                                      UTextColor),
                                  VerticalDivider(
                                    thickness: 0.5,
                                    color: Colors.grey,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const PaymentDialog(),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 55,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.red,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          paymentData[index].balance,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
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

/// ! card two
class PaymentCards2 extends StatelessWidget {
  const PaymentCards2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
                          width: 2,
                          color: Colors.grey,
                        ),
                        buildHeaderTitle(45, 'ទឹកប្រាក់ត្រូវបង់'),
                        VerticalDivider(
                          width: 2,
                          color: Colors.grey,
                        ),
                        buildHeaderTitle(45, 'ទឹកប្រាក់បានបង់'),
                        VerticalDivider(
                          width: 2,
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
                                  buildBody(75, paymentData2[index].invoiceNum2,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(
                                      45,
                                      paymentData2[index].amountToPaid2,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(45, paymentData2[index].amountPaid2,
                                      UTextColor),
                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(50, paymentData2[index].balance2,
                                      URedColor),
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
        ),
      ],
    );
  }
}

/// ! card three
class PaymentCards3 extends StatelessWidget {
  const PaymentCards3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  /// ! datePayment
                                  buildBody(
                                      75,
                                      paymentData4[index].datePayment4,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 5,
                                    color: Colors.grey,
                                  ),
                                  buildBody(75, paymentData4[index].invoiceNum4,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(
                                      45,
                                      paymentData4[index].amountToPaid4,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(45, paymentData4[index].amountPaid4,
                                      UTextColor),
                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(50, paymentData4[index].balance4,
                                      URedColor),
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
        ),
      ],
    );
  }
}

/// ! card four
class PaymentCards4 extends StatelessWidget {
  const PaymentCards4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  /// ! datePayment
                                  buildBody(
                                      75,
                                      paymentData3[index].datePayment3,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 5,
                                    color: Colors.grey,
                                  ),
                                  buildBody(75, paymentData3[index].invoiceNum3,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(
                                      45,
                                      paymentData3[index].amountToPaid3,
                                      UTextColor),

                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(45, paymentData3[index].amountPaid3,
                                      UTextColor),
                                  VerticalDivider(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  buildBody(50, paymentData3[index].balance3,
                                      URedColor),
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
        ),
      ],
    );
  }
}
