import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Splash_Screen.dart';
import 'Home.dart';
import 'localeString.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString('language') ?? 'km';
  String font = prefs.getString('font') ?? 'KhmerOSbattambang';
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white),
  );

  runApp(
    new GetMaterialApp(
      theme: ThemeData(
        fontFamily: font,
        primaryColor: Color(0xFF002060),
        secondaryHeaderColor: Color(
          (0xFFF5F7FE),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Home(),
      translations: LocaleString(),
      locale: Locale(languageCode),
      fallbackLocale: Locale('en', 'US'),
      // locale: Locale(languageCode),
      // fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
