import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<Map<String, dynamic>> locale = [
  {
    'name': 'ភាសាខ្មែរ',
    'logo': 'assets/image/CL_Khmer.png',
    'locale': Locale('km', 'KH'),
    'font': 'KhmerOSbattambang'
  },
  {
    'name': 'ភាសាអង់គ្លេស',
    'logo': 'assets/image/CL_English.png',
    'locale': Locale('en', 'US'),
    'font': 'Poppins'
  },
];

class Change_Language extends StatelessWidget {
  void updateFont(Locale locale) {
    String font = 'KhmerOSbattambang';
    if (locale.languageCode == 'en') {
      font = 'Poppins';
    }
    Get.changeTheme(
      ThemeData(
        primaryColor: Color(0xFF002060),
        secondaryHeaderColor: Color(0xFFF5F7FE),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: font,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeLanguage();
  }
}

class ChangeLanguage extends StatelessWidget {
  void updateFont(Locale locale) {
    String font = 'KhmerOSbattambang';
    if (locale.languageCode == 'en') {
      font = 'Poppins';
    }
    Get.changeTheme(
      ThemeData(
        primaryColor: Color(0xFF002060),
        secondaryHeaderColor: Color(0xFFF5F7FE),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: font,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    updateLanguage(Locale locale, String font) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', locale.languageCode);
      await prefs.setString('font', font);
      Get.back();
      Get.updateLocale(locale);
      // Get.reset(); // Reset translation cache
      updateFont(locale);
    }

    return Dialog(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ភាសា'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'សូមជ្រើសរើសភាសា'.tr,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: 80,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      height: 80,
                      width: 95,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            locale[index]['logo'],
                            scale: 4,
                          ),
                          SizedBox(height: 5),
                          Text(
                            locale[index]['name'].toString().tr,
                            style: TextStyle(
                              fontSize: 14,
                              // fontFamily: locale[index]['font'],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      updateLanguage(
                        locale[index]['locale'],
                        locale[index]['font'],
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return VerticalDivider(
                    width: 40,
                  );
                },
                itemCount: locale.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
