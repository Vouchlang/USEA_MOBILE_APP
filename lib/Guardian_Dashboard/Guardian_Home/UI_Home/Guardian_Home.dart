import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Guardian_Dashboard/Guardian_Home/UI_Home/Guardian_Dashboard.dart';
import '../../../Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import '../../../theme_builder.dart';
import '../../Guardian_Other_Class/Class_Guardian_User.dart';

class Guardian_Home extends StatefulWidget {
  final List<GuardianUser> data_guardianUser;

  const Guardian_Home({required this.data_guardianUser, super.key});

  @override
  State<Guardian_Home> createState() => _Guardian_HomeState();
}

class _Guardian_HomeState extends State<Guardian_Home> {
  @override
  void initState() {
    super.initState();
  }

  late TabController controller;

  int currentIndex = 1;

  void onTap(int index) {
    setState(
      () {
        currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      Guest_Home(),
      Guardian_Dashboard(
        data_guardianUser: widget.data_guardianUser,
      ),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: UTransParentColor,
          highlightColor: UTransParentColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: UTransParentColor,
          ),
        ),
        child: Container(
          color: UTransParentColor,
          child: BottomNavigationBar(
            backgroundColor: UBackgroundColor,
            onTap: onTap,
            elevation: 15,
            currentIndex: currentIndex,
            selectedItemColor: UPrimaryColor,
            unselectedItemColor: UGreyColor,
            unselectedFontSize: 11,
            selectedLabelStyle: TextStyle(
              fontWeight: UTitleWeight,
              fontSize: UBodySize,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'ទំព័រដើម'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  size: 25,
                ),
                label: 'ចូលគណនី'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
