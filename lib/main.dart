import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
// import 'Splash_Screen.dart';
// import 'Home.dart';
// import 'Student_Dashboard/Student_Attendance/UI_Attendance/Components/Screen_view_all_attendance.dart';
// import 'Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
// import 'Student_Dashboard/Student_Attendance/UI_Attendance/Attendance.dart';
// import 'Student_Dashboard/Student_Payment/UI_Payment/Payment.dart';
// import 'Student_Dashboard/Student_Schedule/UI_Schedule/Schedule.dart';
// import 'Student_Dashboard/Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';
import 'Home.dart';
import 'localeString.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString('language') ?? 'km';
  String font = prefs.getString('font') ?? UKFontFamily;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: UBackgroundColor),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    new GetMaterialApp(
      theme: ThemeData(
        fontFamily: font,
        primaryColor: UPrimaryColor,
        secondaryHeaderColor: Color((0xFFF5F7FE)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Home(),
      // home: new All_Attendance_of_Year(),
      // home: new Performance(),
      translations: LocaleString(),
      locale: Locale(languageCode),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    ),
  );
}
