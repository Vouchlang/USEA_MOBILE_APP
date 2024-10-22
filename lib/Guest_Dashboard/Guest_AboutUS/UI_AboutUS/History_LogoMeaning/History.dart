import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../AboutUS_FullImage.dart';
import 'Custom_Build_History.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ប្រវត្តិ និងអត្ថន័យរបស់និមិត្តសញ្ញា'.tr),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          buildHistoryData(
            () => Get.to(
              () => AboutUS_FullImage(
                imageUrls: imageAsset + 'usea_building.jpg',
                screenNav: 'historyScreen',
              ),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 100),
            ),
          ),
          buildHistoryData1(),
          buildRowImage(),
          buildColumnHistoryData(),
        ],
      ),
    );
  }
}
