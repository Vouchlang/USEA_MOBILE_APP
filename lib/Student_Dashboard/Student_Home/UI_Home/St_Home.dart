import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import 'Student_Dashboard.dart';

class St_Home extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  const St_Home({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
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
      const Guest_Home(),
      Student_Home(
        data_studentUser: widget.data_studentUser,
        sourceScreen: widget.sourceScreen,
      ),
      // Students_Notifications(),
    ];
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
          onTap: onTap,
          elevation: 15,
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
              label: 'ចូលគណនី'.tr,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.notifications_sharp,
            //     size: 25,
            //   ),
            //   label: 'ការជូនដំណឹង'.tr,
            // ),
          ],
        ),
      ),
    );
  }
}
