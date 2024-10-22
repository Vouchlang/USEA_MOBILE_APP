import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_Widget/CustomText.dart';
import '/theme_builder.dart';

final List<Map<String, dynamic>> locale = [
  {'name': 'ភាសាខ្មែរ', 'logo': imageAsset + 'CL_Khmer.png', 'locale': Locale('km', 'KH'), 'font': UKFontFamily},
  {'name': 'ភាសាអង់គ្លេស', 'logo': imageAsset + 'CL_English.png', 'locale': Locale('en', 'US'), 'font': UEFontFamily},
];

class Change_Language extends StatelessWidget {
  void updateFont(Locale locale) {
    String font = UKFontFamily;
    if (locale.languageCode == 'en') {
      font = UEFontFamily;
    }
    Get.changeTheme(
      ThemeData(
        primaryColor: UPrimaryColor,
        secondaryHeaderColor: USecondaryColor,
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
    String font = UKFontFamily;
    if (locale.languageCode == 'en') {
      font = UEFontFamily;
    }
    Get.changeTheme(
      ThemeData(
        primaryColor: UPrimaryColor,
        secondaryHeaderColor: USecondaryColor,
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
      updateFont(locale);
    }

    return Dialog(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(URoundedLarge),
      ),
      child: Container(
        margin: const EdgeInsets.all(UPdMg7),
        padding: const EdgeInsets.all(UPdMg10),
        decoration: const BoxDecoration(color: UBackgroundColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ភាសា'.tr,
              style: const TextStyle(
                fontSize: UTitleSize,
                fontWeight: UTitleWeight,
              ),
            ),
            buildHeight10(),
            Text(
              'សូមជ្រើសរើសភាសា'.tr,
              style: const TextStyle(fontSize: UBodySize),
            ),
            buildHeight15(),
            Container(
              height: 70,
              padding: const EdgeInsets.all(UPdMg5),
              alignment: Alignment.center,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    highlightColor: UTransParentColor,
                    splashColor: UTransParentColor,
                    child: Container(
                      height: 75,
                      width: 95,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            locale[index]['logo'],
                            scale: 4.5,
                          ),
                          buildHeight5(),
                          Text(
                            locale[index]['name'].toString().tr,
                            style: const TextStyle(
                              fontSize: UBodySize,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => updateLanguage(
                      locale[index]['locale'],
                      locale[index]['font'],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const VerticalDivider(
                  width: UWidth40,
                  thickness: 0.5,
                  color: UGreyColor,
                ),
                itemCount: locale.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
