import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../../Student_Other_Class/Class_Student_User.dart';
import '../../../Users_API.dart';
import '../../Class_Payment/Class_Payment.dart';
import 'Custom_Build_Payment.dart';
import 'Custom_Build_Payment_Dialog.dart';

class PaymentTuition extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  PaymentTuition({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<PaymentTuition> createState() => _PaymentTuitionState();
}

class _PaymentTuitionState extends State<PaymentTuition> {
  late bool isLoading = false;
  late List<PayStudy> _dataPayStudy = [];

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return buildStudyPayment();
  }

  Widget buildStudyPayment() {
    return Container(
      padding: const EdgeInsets.all(UPdMg5),
      child: Card(
        elevation: 0.5,
        color: UBackgroundColor,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: UTransParentColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(URoundedLarge),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTuitionTitle(),
            buildDividerAtt(),
            _dataPayStudy.isEmpty
                ? buildTuitionEmptyData()
                : ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _dataPayStudy.length,
                    itemBuilder: (context, index) {
                      final isLastIndex = index == _dataPayStudy.length - 1;
                      PayStudy payStudy = _dataPayStudy[index];
                      double totalPaid = payStudy.payments.fold(
                        0.00,
                        (sum, payment) => sum + (double.tryParse(payment.moneyPaid) ?? 0.00),
                      );

                      late final String formattedTotalPaid = totalPaid == 0.00 ? 'N/A' : totalPaid.toStringAsFixed(2);
                      late final double totalRem = payStudy.payments.isNotEmpty ? double.tryParse(payStudy.payments.last.moneyRem) ?? 0.00 : 0.00;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: isLastIndex ? UPdMg5 : UZeroPixel,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTuitionBody(
                                widgetYearName: buildBody(
                                  width: UWidth40,
                                  text: payStudy.yearName.isEmpty ? 'N/A' : 'ឆ្នាំទី​ '.tr + payStudy.yearName,
                                  color: UTextColor,
                                ),
                                widgetMoneyPay: buildBody(
                                  width: 75,
                                  text: payStudy.moneyPay.isEmpty ? 'N/A' : '\$ ${payStudy.moneyPay}',
                                  color: UTextColor,
                                ),
                                widgetMoneyPaid: buildBody(
                                  width: 75,
                                  text: formattedTotalPaid.toString() == 'N/A' ? 'N/A' : '\$ ${formattedTotalPaid.toString()}',
                                  color: UTextColor,
                                ),
                                onTap: () => showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) => buildDialogPaymentDetails(
                                    payStudy: payStudy,
                                    onTap: () => Get.back(),
                                  ),
                                ),
                                borderColor: totalRem.toStringAsFixed(2) == '0.00' ? UScoreColor : URedColor,
                                moneyRemain: totalRem.toString().isEmpty ? 'N/A' : '\$ ${totalRem.toStringAsFixed(2)}',
                                colorRemain: totalRem.toStringAsFixed(2) == '0.00' ? UScoreColor : URedColor,
                              ),
                              !isLastIndex ? buildDividerAtt() : const SizedBox.shrink(),
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

  Future<void> refreshData() async {
    setState(
      () => isLoading = true,
    );

    try {
      var responsePayStudy = await http.post(
        Uri.parse(APIStPayment),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
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
            setState(
              () => isLoading = false,
            );
          }
        }
      } else {
        print('Response Status Code: ${responsePayStudy.statusCode}');
        if (mounted) {
          setState(
            () => isLoading = false,
          );
        }
      }
    } catch (error) {
      print('Failed to fetch payment: $error');
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }
}
