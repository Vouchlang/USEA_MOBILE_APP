// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../theme_builder.dart';

// *@ Title
class TitleTheme extends StatelessWidget {
  final String text;

  const TitleTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        color: UPrimaryColor,
      ),
    );
  }
}

// *@ Normal Title
class NormalTitleTheme extends StatelessWidget {
  final String text;
  final double size;

  const NormalTitleTheme({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: UTitleWeight,
          color: UTextColor,
          fontFamily: 'KhmerOSbattambang',
        ),
      ),
    );
  }
}

// *@ Center Title
class NormalTitleCenterTheme extends StatelessWidget {
  final String text;

  const NormalTitleCenterTheme({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: UTitleSize,
          fontWeight: UTitleWeight,
          color: UTextColor,
        ),
      ),
    );
  }
}

// *@ Body
class BodyTheme extends StatelessWidget {
  final String text;
  final double size;

  const BodyTheme({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, color: UTextColor, fontFamily: 'KhmerOSbattambang'),
    );
  }
}

class CustomTextTheme extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;

  const CustomTextTheme({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: UTextColor,
      ),
    );
  }
}
