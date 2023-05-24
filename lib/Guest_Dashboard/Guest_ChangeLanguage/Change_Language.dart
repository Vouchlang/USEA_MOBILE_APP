import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List locale = [
  {
    'name': 'ភាសាខ្មែរ',
    'logo': 'assets/image/CL_Khmer.png',
    'locale': Locale('km', 'KH')
  },
  {
    'name': 'ភាសាអង់គ្លេស',
    'logo': 'assets/image/CL_English.png',
    'locale': Locale('en', 'US')
  },
];

class Change_Language extends StatefulWidget {
  @override
  State<Change_Language> createState() => _Change_LanguageState();
}

class _Change_LanguageState extends State<Change_Language> {
  @override
  Widget build(BuildContext context) {
    return CardWidget();
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updateLanguage(Locale locale) {
      Get.back();
      Get.updateLocale(locale);
    }

    return Dialog(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ភាសា'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'KhmerOSbattambang',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'សូមជ្រើសរើសភាសា'.tr,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'KhmerOSbattambang',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 75,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
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
                              scale: 4,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              locale[index]['name'.tr],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang'),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        updateLanguage(
                          locale[index]['locale'],
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return VerticalDivider(
                      width: 40,
                    );
                  },
                  itemCount: locale.length),
            ),
          ],
        ),
      ),
    );
  }
}
