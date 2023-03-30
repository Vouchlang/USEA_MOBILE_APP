import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Account/UI_Account/Guest_Acc.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';

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
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
            height: 100,
            child: Center(
              child: BottomNavigationBar(
                elevation: 1,
                onTap: onTap,
                currentIndex: currentIndex,
                selectedItemColor: Colors.indigo[900],
                unselectedItemColor: Colors.grey,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                selectedLabelStyle: TextStyle(fontFamily: 'KhmerOSbattambang'),
                unselectedLabelStyle:
                    TextStyle(fontFamily: 'KhmerOSbattambang'),
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
                  )
                ],
              ),
            )));
  }
}
