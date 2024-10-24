import 'package:flutter/material.dart';
import '../../../Guardian_Dashboard/Guardian_Login/Guardian_login.dart';
import '../../../Lecturer_Dashboard/Lecturer_Login.dart';
import '../../../Staff_Dashboard/Staff_Login.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../Student_Dashboard/Student_LogIn/Login/Student_LogIn.dart';

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
    img: imageAsset + 'Acc_Student.png',
    screen: Student_LogIn(),
  ),
  Account_Screen(
    name: 'គណនីអាណាព្យាបាល',
    img: imageAsset + 'Acc_Guardian.png',
    screen: Guardian_Login(),
  ),
  Account_Screen(
    name: 'គណនីបុគ្គលិក',
    img: imageAsset + 'Acc_Staff.png',
    screen: const Staff_Login(),
  ),
  Account_Screen(
    name: 'គណនីសាស្ត្រាចារ្យ',
    img: imageAsset + 'Acc_Lecturer.png',
    screen: const Lecturer_Login(),
  ),
];
