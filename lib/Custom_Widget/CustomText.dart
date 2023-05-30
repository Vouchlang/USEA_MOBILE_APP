// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../theme_builder.dart';

class TitleTheme extends StatelessWidget {
  final String text;

  const TitleTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: UPrimaryColor,
        ),
      ),
    );
  }
}

class BodyTheme extends StatelessWidget {
  final String text;

  const BodyTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: UPrimaryColor,
        ),
      ),
    );
  }
}

class CustomBodyText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;

  const CustomBodyText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: UTextColor,
        ),
      ),
    );
  }
}
