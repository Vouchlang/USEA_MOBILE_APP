import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Payment/Class_Payment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  bool isLoading = false;
  List<PayStudy> _dataPayStudy = [];
  List<OtherPayClass> _dataOther = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var responsePayStudy = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=payment',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );
      var responseOtherPay = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=other_payment',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
        },
      );

      if (responsePayStudy.statusCode == 200) {
        var dataPayStudy = jsonDecode(responsePayStudy.body);
        if (dataPayStudy['pay_study_data'] is List) {
          List<dynamic> payStudyData = dataPayStudy['pay_study_data'];
          List<PayStudy> payStudies = [];

          payStudyData.forEach((yearData) {
            if (yearData is Map<String, dynamic>) {
              List<dynamic> paymentList = yearData['invoices'];
              List<Payment> payments = [];

              paymentList.forEach((paymentData) {
                if (paymentData is Map<String, dynamic>) {
                  var payment = Payment.fromJson(paymentData);
                  payments.add(payment);
                }
              });

              var payStudy = PayStudy(
                yearName: yearData['year'].toString(),
                moneyPay: yearData['finalprice'].toString(),
                payments: payments,
              );

              payStudies.add(payStudy);
            }
          });

          if (mounted) {
            setState(() {
              _dataPayStudy = payStudies;
              isLoading = false;
            });
          }
        } else {
          print('Response Body: ${responsePayStudy.body}');
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      } else {
        print('Response Status Code: ${responsePayStudy.statusCode}');
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
      if (responseOtherPay.statusCode == 200) {
        var dataOtherPay = jsonDecode(responseOtherPay.body);
        if (mounted) {
          setState(() {
            _dataOther = List<OtherPayClass>.from(
              dataOtherPay['pay_other_data'].map(
                (dataOtherPay) => OtherPayClass.fromJson(dataOtherPay),
              ),
            );

            isLoading = false;
          });
        }
      } else {
        print('Response Body: ${responseOtherPay.body}');

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Failed to fetch payment: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ការបង់ប្រាក់'.tr,
      ),
      body: _dataPayStudy.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: UPdMg10,
                ),
                children: [
                  buildTitle(
                    'ការបង់ថ្លៃឈ្នួលសិក្សា',
                    buildStudyPayment(),
                  ),
                  // buildTitle(
                  //   'ការបង់ថ្លៃឈ្នួលប្រឡងឡើងវិញ (Not Available)',
                  //   PaymentCards2(),
                  // ),
                  // buildTitle(
                  //   'ការបង់ថ្លៃឈ្នួលរៀនបំពេញក្រេឌីត (Not Available)',
                  //   PaymentCards3(),
                  // ),
                  buildTitle(
                    'ការបង់ថ្លៃឈ្នួលដកលិខិតបញ្ជាក់ការសិក្សាផ្សេងៗ',
                    buildOtherPayment(),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildStudyPayment() {
    return Container(
      padding: const EdgeInsets.all(
        UPdMg5,
      ),
      child: Card(
        elevation: 1,
        color: UBackgroundColor,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: UTransParentColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(
            URoundedLarge,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(
                  UPdMg10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildHeaderTitle(
                      UWidth40,
                      'ឆ្នាំ',
                    ),
                    buildVerticalDividerAtt(),
                    buildHeaderTitle(
                      75,
                      'ទឹកប្រាក់ត្រូវបង់',
                    ),
                    buildVerticalDividerAtt(),
                    buildHeaderTitle(
                      75,
                      'ទឹកប្រាក់បានបង់',
                    ),
                    buildVerticalDividerAtt(),
                    buildHeaderTitle(
                      75,
                      'ទឹកប្រាក់នៅសល់',
                    ),
                  ],
                ),
              ),
            ),
            buildDividerAtt(),
            _dataPayStudy.isEmpty
                ? buildEmptyData()
                : ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _dataPayStudy.length,
                    itemBuilder: (context, index) {
                      final isLastIndex = index == _dataPayStudy.length - 1;
                      PayStudy payStudy = _dataPayStudy[index];
                      double totalPaid = payStudy.payments.fold(
                        0.00,
                        (sum, payment) =>
                            sum + (double.tryParse(payment.moneyPaid) ?? 0.00),
                      );

                      String formattedTotalPaid = totalPaid == 0.00
                          ? 'N/A'
                          : totalPaid.toStringAsFixed(2);

                      double totalRem = payStudy.payments.isNotEmpty
                          ? double.tryParse(payStudy.payments.last.moneyRem) ??
                              0.00
                          : 0.00;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: isLastIndex ? UPdMg5 : UZeroPixel,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: UPdMg8,
                                  horizontal: UPdMg10,
                                ),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      buildBody(
                                        UWidth40,
                                        payStudy.yearName.isEmpty
                                            ? 'N/A'
                                            : 'ឆ្នាំទី​ '.tr +
                                                payStudy.yearName,
                                        UTextColor,
                                      ),
                                      buildVerticalDividerAtt(),
                                      buildBody(
                                        75,
                                        payStudy.moneyPay.isEmpty
                                            ? 'N/A'
                                            : '\$ ${payStudy.moneyPay}',
                                        UTextColor,
                                      ),
                                      buildVerticalDividerAtt(),
                                      buildBody(
                                        75,
                                        formattedTotalPaid.toString() == 'N/A'
                                            ? 'N/A'
                                            : '\$ ${formattedTotalPaid.toString()}',
                                        UTextColor,
                                      ),
                                      buildVerticalDividerAtt(),
                                      InkWell(
                                        highlightColor: UTransParentColor,
                                        splashColor: UTransParentColor,
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: ListView(
                                                  shrinkWrap: true,
                                                  children: [
                                                    _buildPaymentDetailsDialog(
                                                      payStudy,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 75,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color:
                                                      totalRem.toStringAsFixed(
                                                                  2) ==
                                                              '0.00'
                                                          ? UScoreColor
                                                          : URedColor,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              totalRem.toString().isEmpty
                                                  ? 'N/A'
                                                  : '\$ ${totalRem.toStringAsFixed(2)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: UBodySize,
                                                color: totalRem.toStringAsFixed(
                                                            2) ==
                                                        '0.00'
                                                    ? UScoreColor
                                                    : URedColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              !isLastIndex
                                  ? buildDividerAtt()
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailsDialog(PayStudy payStudy) {
    return Dialog(
      elevation: 5,
      backgroundColor: UBackgroundColor,
      insetPadding: const EdgeInsets.all(
        UPdMg10,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            UPdMg10,
          ),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: UPdMg10,
                  vertical: UPdMg15,
                ),
                width: UFullWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      UPdMg10,
                    ),
                    topRight: Radius.circular(
                      UPdMg10,
                    ),
                  ),
                  color: UBGLightBlue,
                ),

                /// ! Header Table
                child: Row(
                  children: [
                    Text(
                      payStudy.yearName.isEmpty
                          ? 'N/A'
                          : 'ឆ្នាំទី​ '.tr + payStudy.yearName,
                      style: const TextStyle(
                        color: UPrimaryColor,
                        fontSize: UTitleSize,
                        fontWeight: UTitleWeight,
                      ),
                    ),
                  ],
                ),
              ),
              buildHeight5(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        UPdMg5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildHeaderTitle(
                            75,
                            'កាលបរិច្ឆេទ',
                          ),
                          buildVerticalDivider(
                            2,
                          ),
                          buildHeaderTitle(
                            90,
                            'លេខវិក័យបត្រ',
                          ),
                          buildVerticalDivider(
                            2,
                          ),
                          buildHeaderTitle(
                            75,
                            'ទឹកប្រាក់បានបង់',
                          ),
                          buildVerticalDivider(
                            2,
                          ),
                          buildHeaderTitle(
                            75,
                            'ទឹកប្រាក់នៅសល់',
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildDividerAtt(),
                  payStudy.payments.isEmpty
                      ? IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  padding: const EdgeInsets.all(
                                    UPdMg8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildBody(
                                        75,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDivider(
                                        5,
                                      ),
                                      buildBody(
                                        75,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDivider(
                                        5,
                                      ),
                                      buildBody(
                                        75,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDivider(
                                        5,
                                      ),
                                      buildBody(
                                        75,
                                        'N/A',
                                        UTextColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: payStudy.payments.length,
                          itemBuilder: (context, index) {
                            final isLastIndex =
                                index == payStudy.payments.length - 1;
                            double moneyRem =
                                double.parse(payStudy.payments[index].moneyRem);
                            String formattedMoneyRem =
                                moneyRem.toStringAsFixed(2);
                            return payStudy.payments.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      bottom: isLastIndex ? UPdMg5 : UZeroPixel,
                                    ),
                                    child: IntrinsicHeight(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IntrinsicHeight(
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                UPdMg5,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  buildBody(
                                                    75,
                                                    'N/A',
                                                    UTextColor,
                                                  ),
                                                  buildVerticalDivider(
                                                    5,
                                                  ),
                                                  buildBody(
                                                    90,
                                                    'N/A',
                                                    UTextColor,
                                                  ),
                                                  buildVerticalDivider(
                                                    5,
                                                  ),
                                                  buildBody(
                                                    75,
                                                    'N/A',
                                                    UTextColor,
                                                  ),
                                                  buildVerticalDivider(
                                                    5,
                                                  ),
                                                  buildBody(
                                                    75,
                                                    'N/A',
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
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      bottom: isLastIndex ? UPdMg5 : UZeroPixel,
                                    ),
                                    child: Column(
                                      children: [
                                        IntrinsicHeight(
                                          child: Container(
                                            padding: EdgeInsets.all(
                                              UPdMg5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                buildBody(
                                                  75,
                                                  payStudy.payments[index].pdate
                                                          .isEmpty
                                                      ? 'N/A'
                                                      : payStudy.payments[index]
                                                          .pdate,
                                                  UTextColor,
                                                ),
                                                buildVerticalDivider(
                                                  2,
                                                ),
                                                buildBody(
                                                  90,
                                                  payStudy.payments[index]
                                                          .invoiceNum.isEmpty
                                                      ? 'N/A'
                                                      : payStudy.payments[index]
                                                          .invoiceNum,
                                                  UTextColor,
                                                ),
                                                buildVerticalDivider(
                                                  2,
                                                ),
                                                buildBody(
                                                  75,
                                                  payStudy.payments[index]
                                                          .moneyPaid.isEmpty
                                                      ? 'N/A'
                                                      : '\$ ${payStudy.payments[index].moneyPaid}',
                                                  UTextColor,
                                                ),
                                                buildVerticalDivider(
                                                  2,
                                                ),
                                                buildBody(
                                                  75,
                                                  formattedMoneyRem.isEmpty
                                                      ? 'N/A'
                                                      : '\$ ${formattedMoneyRem}',
                                                  UTextColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (!isLastIndex) buildDividerAtt(),
                                      ],
                                    ),
                                  );
                          },
                        ),
                ],
              ),
            ],
          ),
          Positioned(
            right: UZeroPixel,
            top: UPdMg5,
            width: UHeight50,
            height: UHeight40,
            child: InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                imageAsset + 'close.png',
                scale: UScale10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOtherPayment() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            UPdMg5,
          ),
          child: Card(
            elevation: 1,
            color: UBackgroundColor,
            shadowColor: ULightGreyColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: UTransParentColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(
                URoundedLarge,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: UPdMg8,
                        horizontal: UPdMg5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildHeaderTitle(
                            75,
                            'កាលបរិច្ឆេទ',
                          ),
                          buildVerticalDividerW_2(),
                          buildHeaderTitle(
                            80,
                            'លេខវិក័យបត្រ',
                          ),
                          buildVerticalDividerW_2(),
                          buildHeaderTitle(
                            70,
                            'ទឹកប្រាក់ត្រូវបង់',
                          ),
                          buildVerticalDividerW_2(),
                          buildHeaderTitle(
                            70,
                            'ទឹកប្រាក់បានបង់',
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildDividerAtt(),
                  _dataOther.isEmpty
                      ? IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: UPdMg8,
                                    horizontal: UPdMg5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      buildBody(
                                        70,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDividerW_2(),
                                      buildBody(
                                        80,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDividerW_2(),
                                      buildBody(
                                        70,
                                        'N/A',
                                        UTextColor,
                                      ),
                                      buildVerticalDividerW_2(),
                                      buildBody(
                                        70,
                                        'N/A',
                                        UTextColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: _dataOther.length,
                          itemBuilder: (context, index) {
                            final isLastIndex = index == _dataOther.length - 1;

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
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: UPdMg8,
                                          horizontal: UPdMg5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            // * datePayment
                                            Container(
                                              width: 75,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                _dataOther[index]
                                                        .o_pdate
                                                        .isEmpty
                                                    ? 'N/A'
                                                    : _dataOther[index]
                                                        .o_pdate
                                                        .tr,
                                                style: const TextStyle(
                                                  fontSize: 11.75,
                                                  color: UTextColor,
                                                ),
                                              ),
                                            ),
                                            buildVerticalDividerW_2(),
                                            buildBody(
                                              80,
                                              _dataOther[index]
                                                      .o_invoice
                                                      .isEmpty
                                                  ? 'N/A'
                                                  : _dataOther[index].o_invoice,
                                              UTextColor,
                                            ),
                                            buildVerticalDividerW_2(),
                                            buildBody(
                                              70,
                                              _dataOther[index]
                                                      .o_money_pay
                                                      .isEmpty
                                                  ? 'N/A'
                                                  : _dataOther[index]
                                                      .o_money_pay,
                                              UTextColor,
                                            ),
                                            buildVerticalDividerW_2(),
                                            buildBody(
                                              70,
                                              _dataOther[index]
                                                      .o_money_paid
                                                      .isEmpty
                                                  ? 'N/A'
                                                  : _dataOther[index]
                                                      .o_money_paid,
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
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmptyData() {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(
              UPdMg8,
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildBody(
                    UWidth40,
                    'N/A',
                    UTextColor,
                  ),
                  buildVerticalDividerAtt(),
                  buildBody(
                    75,
                    'N/A',
                    UTextColor,
                  ),
                  buildVerticalDividerAtt(),
                  buildBody(
                    75,
                    'N/A',
                    UTextColor,
                  ),
                  buildVerticalDividerAtt(),
                  buildBody(
                    75,
                    'N/A',
                    UTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
