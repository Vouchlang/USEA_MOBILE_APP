import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../Payment_Tuition/Custom_Build_Payment.dart';

Widget buildPaymentFeesHeader() {
  return IntrinsicHeight(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UPdMg8,
        horizontal: UPdMg5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildHeaderTitle(
            width: 75,
            text: 'កាលបរិច្ឆេទ',
          ),
          buildVerticalDividerW_2(),
          buildHeaderTitle(
            width: 80,
            text: 'លេខវិក័យបត្រ',
          ),
          buildVerticalDividerW_2(),
          buildHeaderTitle(
            width: 70,
            text: 'ទឹកប្រាក់ត្រូវបង់',
          ),
          buildVerticalDividerW_2(),
          buildHeaderTitle(
            width: 70,
            text: 'ទឹកប្រាក់បានបង់',
          ),
        ],
      ),
    ),
  );
}

Widget buildPaymentFeesBody({
  required final String date,
  required final Widget widgetInvoice,
  widgetMoneyPay,
  widgetPaid,
}) {
  return IntrinsicHeight(
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: UPdMg8,
        horizontal: UPdMg5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 75,
            child: Text(
              textAlign: TextAlign.center,
              date.tr,
              style: const TextStyle(
                fontSize: 11.75,
                color: UTextColor,
              ),
            ),
          ),
          buildVerticalDividerW_2(),
          widgetInvoice,
          buildVerticalDividerW_2(),
          widgetMoneyPay,
          buildVerticalDividerW_2(),
          widgetPaid,
        ],
      ),
    ),
  );
}

Widget buildPaymentFeesNodata() {
  return IntrinsicHeight(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerW_2(),
                buildBody(
                  width: 80,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerW_2(),
                buildBody(
                  width: 70,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerW_2(),
                buildBody(
                  width: 70,
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
