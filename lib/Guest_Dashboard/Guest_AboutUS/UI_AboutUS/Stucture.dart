import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import 'AboutUS_FullImage.dart';

class Structure extends StatelessWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              highlightColor: UTransParentColor,
              splashColor: UTransParentColor,
              onTap: () {
                Get.to(
                  () => AboutUS_FullImage(
                    imageUrls: imageAsset + 'usea_structure.jpg',
                    screenNav: 'structureScreen',
                  ),
                );
              },
              child: Image.asset(
                imageAsset + 'usea_structure.jpg',
                fit: BoxFit.cover,
              ),
            ),
            buildHeight10(),
            buildPresidentMessage(
              'USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices. USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices.',
            ),
            buildHeight10(),
          ],
        ),
      ),
    );
  }
}
