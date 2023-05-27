// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Data/Data_payment.dart';

/// ! card one
class PaymentCards extends StatelessWidget {
  const PaymentCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),

                    /// ! Header Title
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 40,
                          child: Text(
                            'ឆ្នាំ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                          width: 45,
                        ),
                        SizedBox(
                          width: 55,
                          child: Text(
                            'ទឹកប្រាក់ត្រូវបង់',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                          width: 45,
                        ),
                        SizedBox(
                          width: 55,
                          child: Text(
                            'ទឹកប្រាក់បានបង់',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey,
                          width: 45,
                        ),
                        SizedBox(
                          width: 55,
                          child: Text(
                            'ទឹកប្រាក់នៅសល់',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                              color: Color(0xff002060),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                            padding: const EdgeInsets.all(8.0),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  /// ! Year
                                  SizedBox(
                                    width: 50,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      paymentData[index].yearPayment,
                                      style: TextStyle(
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 0),
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),

                                  /// ! Amount to be pay
                                  SizedBox(
                                    width: 65,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      paymentData[index].amountToPaid,
                                      style: TextStyle(
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0),
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),

                                  /// ! Amount paid
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      paymentData[index].amountPaid,
                                      style: TextStyle(
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0),
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),

                                  /// ! Amount balance
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
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
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xffff0000),
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
          padding: const EdgeInsets.all(7.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),

                      /// ! Header Title2
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 70,
                            child: Text(
                              'កាលបរិច្ឆេទ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              textAlign: TextAlign.center,
                              'លេខវិក័យបត្រ',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              'ទឹកប្រាក់ត្រូវបង់',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់បានបង់',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់នៅសល់',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.3,
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
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    /// ! datePayment
                                    SizedBox(
                                      width: 71,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData2[index].datePayment,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! invoiceNum
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData2[index].invoiceNum,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! amountToPaid
                                    SizedBox(
                                      width: 28,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData2[index].amountToPaid,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount paid
                                    SizedBox(
                                      width: 20,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData2[index].amountPaid,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount balance
                                    Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData2[index].balance,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xffff0000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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

/// ! card three
class PaymentCards3 extends StatelessWidget {
  const PaymentCards3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),

                      /// ! Header Title3
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 70,
                            child: Text(
                              textAlign: TextAlign.center,
                              'កាលបរិច្ឆេទ',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              textAlign: TextAlign.center,
                              'លេខវិក័យបត្រ',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              'ទឹកប្រាក់ត្រូវបង់',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់បានបង់',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់នៅសល់',
                              style: TextStyle(
                                fontFamily: 'KhmerOSbattambang',
                                color: Color(0xff002060),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),

                /// ! Body Content​3
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
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    /// ! datePayment
                                    SizedBox(
                                      width: 71,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData3[index].datePayment3,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! invoiceNum
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData3[index].invoiceNum3,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! amountToPaid
                                    SizedBox(
                                      width: 28,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData3[index].amountToPaid3,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount paid
                                    SizedBox(
                                      width: 20,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData3[index].amountPaid3,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount balance
                                    Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData3[index].balance3,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xffff0000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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

/// ! card four
class PaymentCards4 extends StatelessWidget {
  const PaymentCards4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),

                      /// ! Header Title4
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 70,
                            child: Text(
                              textAlign: TextAlign.center,
                              'កាលបរិច្ឆេទ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff002060),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              textAlign: TextAlign.center,
                              'លេខវិក័យបត្រ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff002060),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              'ទឹកប្រាក់ត្រូវបង់',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff002060),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់បានបង់',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff002060),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ទឹកប្រាក់នៅសល់',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff002060),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey,
                ),

                /// ! Body Content​4
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
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    /// ! datePayment
                                    SizedBox(
                                      width: 71,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData4[index].datePayment4,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! invoiceNum
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData4[index].invoiceNum4,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! amountToPaid
                                    SizedBox(
                                      width: 28,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData4[index].amountToPaid4,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount paid
                                    SizedBox(
                                      width: 20,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData4[index].amountPaid4,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey,
                                    ),

                                    /// ! Amount balance
                                    Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        paymentData4[index].balance4,
                                        style: TextStyle(
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xffff0000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
