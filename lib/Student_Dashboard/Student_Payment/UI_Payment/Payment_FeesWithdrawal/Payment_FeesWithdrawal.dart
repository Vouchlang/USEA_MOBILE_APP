import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../../Student_Other_Class/Class_Student_User.dart';
import '../../../Users_API.dart';
import '../../Class_Payment/Class_Payment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Custom_Build_Payment_FeesWithdrawal.dart';

class PaymentFeeswithdrawal extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  PaymentFeeswithdrawal({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<PaymentFeeswithdrawal> createState() => _PaymentFeeswithdrawalState();
}

class _PaymentFeeswithdrawalState extends State<PaymentFeeswithdrawal> {
  late bool isLoading = false;
  late List<OtherPayClass> _dataOther = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return buildOtherPayment();
  }

  Widget buildOtherPayment() {
    return Padding(
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPaymentFeesHeader(),
            buildDividerAtt(),
            _dataOther.isEmpty
                ? buildPaymentFeesNodata()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
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
                              buildPaymentFeesBody(
                                date: _dataOther[index].o_pdate.isEmpty ? 'N/A' : _dataOther[index].o_pdate.tr,
                                widgetInvoice: buildBody(
                                  width: 80,
                                  text: _dataOther[index].o_invoice.isEmpty ? 'N/A' : _dataOther[index].o_invoice,
                                  color: UTextColor,
                                ),
                                widgetMoneyPay: buildBody(
                                  width: 70,
                                  text: _dataOther[index].o_money_pay.isEmpty ? 'N/A' : _dataOther[index].o_money_pay,
                                  color: UTextColor,
                                ),
                                widgetPaid: buildBody(
                                  width: 70,
                                  text: _dataOther[index].o_money_paid.isEmpty ? 'N/A' : _dataOther[index].o_money_paid,
                                  color: UTextColor,
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
    );
  }

  Future<void> _refreshData() async {
    setState(
      () => isLoading = true,
    );

    try {
      var responseOtherPay = await http.post(
        Uri.parse(APIStOtherPayment),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
        },
      );

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
