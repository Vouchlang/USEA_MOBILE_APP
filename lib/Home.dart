import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Guest_Dashboard/Guest_Account/UI_Account/Guest_Acc.dart';
import '/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import '/theme_builder.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List pages = [
    const Guest_Home(),
    const Guest_Acc(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: UTransParentColor,
          highlightColor: UTransParentColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: UTransParentColor,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: UBackgroundColor,
          elevation: 15,
          onTap: onTap,
          useLegacyColorScheme: true,
          currentIndex: currentIndex,
          selectedItemColor: UPrimaryColor,
          unselectedItemColor: UGreyColor,
          unselectedFontSize:
              Get.locale?.languageCode == 'km' ? UBodySize10 : UBodySize11,
          selectedLabelStyle: TextStyle(
            fontWeight: UTitleWeight,
            fontSize:
                Get.locale?.languageCode == 'km' ? UBodySize11 : UBodySize,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 25,
              ),
              label: 'ទំព័រដើម'.tr,
            ),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.account_box,
                  size: 25,
                ),
                label: 'ចូលគណនី'.tr),
          ],
        ),
      ),
    );
  }
}
