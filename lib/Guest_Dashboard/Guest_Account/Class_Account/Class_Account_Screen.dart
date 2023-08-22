import 'package:flutter/material.dart';
import '/Student_Dashboard/Student_LogIn/Student_LogIn.dart';
import '/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';

class Account_Screen {
  late final String name, img;
  late final Widget screen;

  Account_Screen({
    required this.name,
    required this.img,
    required this.screen,
  });
}

final List<Account_Screen> account_screen = [
  Account_Screen(
    name: 'គណនីនិស្សិត',
    img: 'assets/image/Acc_Student.png',
    screen: Student_LogIn(),
  ),
  Account_Screen(
    name: 'គណនីអាណាព្យាបាល',
    img: 'assets/image/Acc_Guardian.png',
    screen: New_Event(),
  ),
  Account_Screen(
    name: 'គណនីបុគ្គលិក',
    img: 'assets/image/Acc_Staff.png',
    screen: New_Event(),
  ),
  Account_Screen(
    name: 'គណនីសាស្ត្រាចារ្យ',
    img: 'assets/image/Acc_Lecturer.png',
    screen: New_Event(),
  ),
];
