import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../AboutUS_FullImage.dart';
import 'Custom_Build_Message.dart';

class President extends StatelessWidget {
  const President({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'សាររបស់សាកលវិទ្យាធិការ'.tr),
      body: buildPresidentMessageData(
        () => Get.to(
          () => AboutUS_FullImage(
            imageUrls: imageAsset + 'president.png',
            screenNav: screenNav,
          ),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
