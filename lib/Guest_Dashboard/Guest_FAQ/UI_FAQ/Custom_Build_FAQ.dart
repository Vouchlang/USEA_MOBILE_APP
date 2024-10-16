import 'package:flutter/material.dart';

import '../../../theme_builder.dart';

// FAQ
Widget buildFAQ({
  required final String text,
  required final TextAlign align,
}) {
  return Text(
    text,
    textAlign: align,
    style: const TextStyle(
      fontSize: UTitleSize16,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
