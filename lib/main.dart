import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'theme_builder.dart';
import 'Splash_Screen.dart';
import 'localeString.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString('language') ?? 'km';
  String font = prefs.getString('font') ?? UKFontFamily;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: UBackgroundColor,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(
    new GetMaterialApp(
      theme: ThemeData(
        fontFamily: font,
        primaryColor: UPrimaryColor,
        secondaryHeaderColor: USecondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //
        colorScheme: ColorScheme.fromSeed(
          seedColor: UPrimaryColor,
        ),
      ),
      home: new Splash_Screen(),
      translations: LocaleString(),
      locale: Locale(languageCode),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
