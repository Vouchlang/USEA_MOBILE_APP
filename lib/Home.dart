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
  late TabController controller;

  List pages = [
    Guest_Home(),
    Guest_Acc(),
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
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: UPdMg_5),
        child: BottomNavigationBar(
          backgroundColor: USecondaryColor,
          elevation: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: UPrimaryColor,
          unselectedItemColor: UGreyColor,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle:
              TextStyle(fontWeight: UTitleWeight, fontSize: UBodySize),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: 'ទំព័រដើម'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                size: 20,
              ),
              label: 'ចូលគណនី'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
