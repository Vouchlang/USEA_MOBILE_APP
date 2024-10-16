import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../AboutUS_FullImage.dart';
import 'Build_Custom_Structure.dart';

class Structure extends StatelessWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ'.tr),
      body: buildStructure(
        () => Get.to(
          () => AboutUS_FullImage(
            imageUrls: imageAsset + 'usea_structure.jpg',
            screenNav: 'structureScreen',
          ),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
