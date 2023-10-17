import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import 'Student_Dashboard.dart';

class St_Home extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  const St_Home({
    Key? key,
    required this.data_studentUser,
  }) : super(key: key);

  @override
  State<St_Home> createState() => _St_HomeState();
}

class _St_HomeState extends State<St_Home> with SingleTickerProviderStateMixin {
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
      Student_Home(
        data_studentUser: widget.data_studentUser,
      ),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: UZeroPixel),
        color: Colors.transparent,
        child: BottomNavigationBar(
          backgroundColor: USecondaryColor,
          elevation: 0,
          onTap: onTap,
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
    );
  }
}
