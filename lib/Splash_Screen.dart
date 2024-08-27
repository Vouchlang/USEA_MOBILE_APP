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
      const Duration(
        milliseconds: 4000,
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              imageAsset + 'logo.json',
              fit: BoxFit.cover,
              // height: 200,
              // width: 200,
            ),
            // buildHeight10(),
            // const Text(
            //   'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
            //   style: TextStyle(
            //     fontSize: 15,
            //     fontFamily: 'KhmerOSmuol',
            //     color: UPrimaryColor,
            //   ),
            // ),
            // const Text(
            //   'UNIVERSITY OF SOUTH-EAST ASIA',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(
            //     fontSize: 17.5,
            //     color: UPrimaryColor,
            //     fontWeight: UBodyWeight,
            //     fontFamily: UEFontFamily,
            //   ),
            // ),
            // buildHeight5(),
            // const SpinKitThreeBounce(
            //   color: UPrimaryColor,
            //   size: 15,
            // ),
          ],
        ),
      ),
    );
  }
}
