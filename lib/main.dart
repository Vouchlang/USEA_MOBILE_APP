import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Splash_Screen.dart';
import 'Home.dart';
import 'localeString.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(
    new GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF002060),
        secondaryHeaderColor: Color(
          (0xFFF5F7FE),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Home(),
      translations: LocaleString(),
      locale: Locale('km', 'KH'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
