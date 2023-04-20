import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/UI_Home/Guest_Home.dart';
import 'package:usea_app/Student_Dashboard/Student_Home/UI_Home/test_Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Student_LogIn/testing_log_detail_a.dart';

class St_Home extends StatefulWidget {
  final dynamic data;
  const St_Home({Key? key, required this.data}) : super(key: key);

  @override
  State<St_Home> createState() => _St_HomeState();
}

class _St_HomeState extends State<St_Home> {
  late TabController controller;
  late SharedPreferences _preferences;
  late final String? _studentId;
  late final String? _pwd;

  int currentIndex = 1;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _studentId = _preferences.getString('student_id') ?? '';
      _pwd = _preferences.getString('pwd') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      Guest_Home(),
      Student_Home1(dataDetail: widget.data),
      // SampleScreen()
    ];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          height: 100,
          child: Center(
            child: BottomNavigationBar(
              elevation: 0,
              onTap: onTap,
              currentIndex: currentIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 11,
              unselectedFontSize: 11,
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
          ),
        ),
      ),
    );
  }
}
