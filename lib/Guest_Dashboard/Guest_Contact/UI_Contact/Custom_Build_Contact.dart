import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildContact({
  required final String image,
  text,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: UWidth30,
        height: UHeight30,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      buildWidth10(),
      Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          child: SelectableText(
            text,
            textAlign: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UBodyWeight,
              height: UTextHeight,
            ),
          ),
        ),
      ),
    ],
  );
}

// List of Button
Widget buildBtnList({
  required final Widget btn1,
  btn2,
  btn3,
}) {
  return Positioned(
    top: UPdMg15,
    right: UPdMg15,
    child: Column(
      children: [
        btn1,
        buildHeight5(),
        btn2,
        buildHeight5(),
        btn3,
      ],
    ),
  );
}

Widget buildBtnMap({
  required final Function() mode,
  required final IconData icons,
}) {
  return GestureDetector(
    onTap: mode,
    child: Container(
      width: UWidth35,
      height: UHeight35,
      decoration: BoxDecoration(
        color: UPrimaryColor,
        borderRadius: BorderRadius.circular(URoundedMedium),
      ),
      child: Icon(
        icons,
        size: 24.0,
        color: UBackgroundColor,
      ),
    ),
  );
}

Widget buildHorizontalLine() {
  return Center(
    child: Container(
      width: 75,
      margin: const EdgeInsets.only(bottom: UPdMg10),
      height: UHeight5,
      decoration: const BoxDecoration(
        color: UPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(URoundedLarge),
        ),
      ),
    ),
  );
}

Widget buildScrollSheet() {
  return DraggableScrollableSheet(
    snapAnimationDuration: const Duration(microseconds: 100),
    maxChildSize: 0.75,
    minChildSize: 0.1,
    initialChildSize: 0.5,
    snap: true,
    builder: (
      BuildContext context,
      ScrollController scrollController,
    ) {
      return Container(
        padding: const EdgeInsets.all(UPdMg20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          shape: BoxShape.rectangle,
          color: UBackgroundColor,
        ),
        child: ListView(
          shrinkWrap: true,
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            buildHorizontalLine(),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Email.png',
              text: 'info@usea.edu.kh',
            ),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Tel.png',
              text: '063 900 090',
            ),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Tel.png',
              text: '017 386 678',
            ),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Tel.png',
              text: '090 905 902',
            ),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Tel.png',
              text: '070 408 438',
            ),
            buildHeight15(),
            buildContact(
              image: imageAsset + 'Con_Loc.png',
              text: 'ភូមិវត្តបូព៌ សង្កាត់សាលាកំរើក ស្រុកសៀមរាប ខេត្តសៀមរាប​ ព្រះរាជាណាចក្រកម្ពុជា (ទល់មុខវិទ្យាល័យអង្គរ)។'.tr,
            ),
          ],
        ),
      );
    },
  );
}
