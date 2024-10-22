import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'Custom_Widget/CustomText.dart';
import 'Home.dart';
import 'theme_builder.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3800),
    ).then(
      (value) {
        Get.off(() => const Home());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Center(
        child: Lottie.asset(
          imageAsset + 'logo.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
