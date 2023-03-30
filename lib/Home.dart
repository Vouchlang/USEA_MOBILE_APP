import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Guest_Acc/Guest_Dashboard/Guest_Home.dart' as Guest_Home;
import '/Guest_Acc/Guest_Dashboard/Guest_Acc.dart' as Guest_Acc;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  List pages = [
    Guest_Home.Guest_Home(),
    Guest_Acc.Guest_Acc(),
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
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          // height: 100,
          child: BottomNavigationBar(
            elevation: 0,
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: Colors.indigo[900],
            unselectedItemColor: Colors.grey,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: TextStyle(fontFamily: 'KhmerOSbattambang'),
            unselectedLabelStyle: TextStyle(fontFamily: 'KhmerOSbattambang'),
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
        ));
  }
}
