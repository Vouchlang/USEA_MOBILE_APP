import 'package:flutter/material.dart';
import 'package:usea_app/Guardian_Dashboard/Guardian_login.dart';
import 'package:usea_app/Lecturer_Dashboard/Lecturer_Login.dart';
import 'package:usea_app/Staff_Dashboard/Staff_Login.dart';
import '/Student_Dashboard/Student_LogIn/Student_LogIn.dart';

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
    screen: Guardian_Login(),
  ),
  Account_Screen(
    name: 'គណនីបុគ្គលិក',
    img: 'assets/image/Acc_Staff.png',
    screen: Staff_Login(),
  ),
  Account_Screen(
    name: 'គណនីសាស្ត្រាចារ្យ',
    img: 'assets/image/Acc_Lecturer.png',
    screen: Lecturer_Login(),
  ),
];
