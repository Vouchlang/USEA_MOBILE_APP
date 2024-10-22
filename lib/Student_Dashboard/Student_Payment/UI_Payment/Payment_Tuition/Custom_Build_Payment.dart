import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildHeaderTitle({
  required final double width,
  required final String text,
}) {
  return SizedBox(
    width: width,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildTuitionTitle() {
  return IntrinsicHeight(
    child: Container(
      padding: const EdgeInsets.all(UPdMg10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildHeaderTitle(
            width: UWidth40,
            text: 'ឆ្នាំ',
          ),
          buildVerticalDividerAtt(),
          buildHeaderTitle(
            width: 75,
            text: 'ទឹកប្រាក់ត្រូវបង់',
          ),
          buildVerticalDividerAtt(),
          buildHeaderTitle(
            width: 75,
            text: 'ទឹកប្រាក់បានបង់',
          ),
          buildVerticalDividerAtt(),
          buildHeaderTitle(
            width: 75,
            text: 'ទឹកប្រាក់នៅសល់',
          ),
        ],
      ),
    ),
  );
}

Widget buildTuitionBody({
  required final Widget widgetYearName,
  widgetMoneyPay,
  widgetMoneyPaid,
  required final Function() onTap,
  required final Color borderColor,
  colorRemain,
  required final String moneyRemain,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg8,
      horizontal: UPdMg10,
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widgetYearName,
          buildVerticalDividerAtt(),
          widgetMoneyPay,
          buildVerticalDividerAtt(),
          widgetMoneyPaid,
          buildVerticalDividerAtt(),
          InkWell(
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: 75,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: borderColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  moneyRemain,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: UBodySize,
                    color: colorRemain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTuitionEmptyData() {
  return IntrinsicHeight(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(UPdMg8),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildBody(
                  width: UWidth40,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerAtt(),
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerAtt(),
                buildBody(
                  width: 75,
                  text: 'N/A',
                  color: UTextColor,
                ),
                buildVerticalDividerAtt(),
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
