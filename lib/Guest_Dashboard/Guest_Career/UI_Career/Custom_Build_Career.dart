import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildLogo({
  required final Widget image,
  required final double width,
}) {
  return Container(
    width: width,
    child: image,
  );
}

Widget CareerBody(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}

Widget buildExpireDate(final Widget expireDate) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imageAsset + 'Event_Date.png',
        scale: 12,
      ),
      buildWidth5(),
      Expanded(child: expireDate),
    ],
  );
}
