import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event_FullImage.dart';
import '../Class_News_Event/Class_News_Event.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';

class News_Event_Detail extends StatelessWidget {
  final Event_Data data;

  const News_Event_Detail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ព្រឹត្តិការណ៍'.tr,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            bottom: UPdMg10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                highlightColor: UTransParentColor,
                splashColor: UTransParentColor,
                onTap: () {
                  final imageUrl = data.image;
                  Get.to(
                    () => News_Event_FullImage(
                      imageUrls: imageUrl,
                    ),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  child: InteractiveViewer(
                    child: Image.network(
                      data.image.isEmpty
                          ? 'https://wallpapers.com/images/featured/blank-white-7sn5o1woonmklx1h.jpg'
                          : data.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: UBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      URoundedLarge,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(
                        0,
                        1,
                      ),
                      color: ULightGreyColor,
                      blurRadius: 1,
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: UPdMg10,
                  horizontal: UPdMg7,
                ),
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Text(
                  data.title.isEmpty ? 'N/A' : data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UTitleWeight,
                    fontFamily: UKFontFamily,
                    height: UTextHeight,
                  ),
                ),
              ),
              buildHeight10(),
              Container(
                width: UFullWidth,
                margin: const EdgeInsets.symmetric(
                  horizontal: UPdMg10,
                ),
                child: Text(
                  data.description.isEmpty ? 'N/A' : data.description,
                  textAlign: Get.locale?.languageCode == 'km'
                      ? TextAlign.left
                      : TextAlign.justify,
                  style: const TextStyle(
                    fontSize: UBodySize,
                    fontFamily: UKFontFamily,
                    height: UTextHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}