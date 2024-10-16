import 'package:flutter/material.dart';
import '../../../../theme_builder.dart';

Widget buildSemesterName({
  required final double width,
  required final Widget semesterName,
}) {
  return Padding(
    padding: const EdgeInsets.all(UPdMg5),
    child: Container(
      width: width,
      padding: const EdgeInsets.all(UPdMg20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(URoundedLarge),
        color: UBtnColor,
        border: Border.all(
          width: 1.5,
          color: UBackgroundColor,
        ),
      ),
      child: semesterName,
    ),
  );
}
