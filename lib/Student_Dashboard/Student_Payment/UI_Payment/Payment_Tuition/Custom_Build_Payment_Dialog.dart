import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../Student_Performance/UI_Perfomance/Custom_Build_Performance.dart';
import '../../Class_Payment/Class_Payment.dart';
import '../../../../theme_builder.dart';
import 'Custom_Build_Payment.dart';

Widget buildDialogPaymentDetails({
  required final PayStudy payStudy,
  required final Function() onTap,
}) {
  return Dialog(
    elevation: 5,
    backgroundColor: UBackgroundColor,
    insetPadding: const EdgeInsets.all(UPdMg10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(URoundedLarge),
      ),
    ),
    child: Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildDialogPaymentYearName(
              payStudy.yearName.isEmpty ? 'N/A' : 'ឆ្នាំទី​ '.tr + payStudy.yearName,
            ),
            buildHeight5(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildDialogPaymentHeader(),
                buildDividerAtt(),
                payStudy.payments.isEmpty
                    ? buildDialogPaymentHeaderNoData()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: payStudy.payments.length,
                        itemBuilder: (context, index) {
                          final isLastIndex = index == payStudy.payments.length - 1;
                          double moneyRem = double.parse(payStudy.payments[index].moneyRem);
                          String formattedMoneyRem = moneyRem.toStringAsFixed(2);
                          return payStudy.payments.isEmpty
                              ? Padding(
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
                                            padding: const EdgeInsets.all(UPdMg5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                buildBody(
                                                  width: 75,
                                                  text: 'N/A',
                                                  color: UTextColor,
                                                ),
                                                buildVerticalDivider(UHeight5),
                                                buildBody(
                                                  width: 90,
                                                  text: 'N/A',
                                                  color: UTextColor,
                                                ),
                                                buildVerticalDivider(UHeight5),
                                                buildBody(
                                                  width: 75,
                                                  text: 'N/A',
                                                  color: UTextColor,
                                                ),
                                                buildVerticalDivider(UHeight5),
                                                buildBody(
                                                  width: 75,
                                                  text: 'N/A',
                                                  color: UTextColor,
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
                                          padding: const EdgeInsets.all(UPdMg5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              buildBody(
                                                width: 75,
                                                text: payStudy.payments[index].pdate.isEmpty ? 'N/A' : payStudy.payments[index].pdate,
                                                color: UTextColor,
                                              ),
                                              buildVerticalDivider(2),
                                              buildBody(
                                                width: 90,
                                                text: payStudy.payments[index].invoiceNum.isEmpty ? 'N/A' : payStudy.payments[index].invoiceNum,
                                                color: UTextColor,
                                              ),
                                              buildVerticalDivider(2),
                                              buildBody(
                                                width: 75,
                                                text: payStudy.payments[index].moneyPaid.isEmpty ? 'N/A' : '\$ ${payStudy.payments[index].moneyPaid}',
                                                color: UTextColor,
                                              ),
                                              buildVerticalDivider(2),
                                              buildBody(
                                                width: 75,
                                                text: formattedMoneyRem.isEmpty ? 'N/A' : '\$ ${formattedMoneyRem}',
                                                color: UTextColor,
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
        buildCloseImgPosition(onTap),
      ],
    ),
  );
}

Widget buildDialogPaymentHeaderNoData() {
  return IntrinsicHeight(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(UPdMg8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDivider(2),
                buildBody(
                  width: 90,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDivider(2),
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDivider(2),
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildDialogPaymentHeader() {
  return IntrinsicHeight(
    child: Padding(
      padding: const EdgeInsets.all(UPdMg5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildHeaderTitle(
            width: 75,
            text: 'កាលបរិច្ឆេទ',
          ),
          buildVerticalDivider(2),
          buildHeaderTitle(
            width: 90,
            text: 'លេខវិក័យបត្រ',
          ),
          buildVerticalDivider(2),
          buildHeaderTitle(
            width: 75,
            text: 'ទឹកប្រាក់បានបង់',
          ),
          buildVerticalDivider(2),
          buildHeaderTitle(
            width: 75,
            text: 'ទឹកប្រាក់នៅសល់',
          ),
        ],
      ),
    ),
  );
}

Widget buildDialogPaymentYearName(final String yearName) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: UPdMg10,
      vertical: UPdMg15,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    child: Text(
      yearName,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}
