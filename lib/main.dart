import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Splash_Screen.dart';
import 'localeString.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(new GetMaterialApp(
    theme: ThemeData(
      primaryColor: Colors.indigo[900],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: new Splash_Screen(),
    translations: LocaleString(),
    locale: Locale('km', 'KH'),
    debugShowCheckedModeBanner: false,
  ));
}
