import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildListText({
  required final String text,
  required final int line,
  required final double size,
  required final FontWeight fontWeight,
}) {
  return Text(
    text,
    textAlign: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
    maxLines: line,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      height: UTextHeight,
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
    ),
  );
}

Widget buildTitleBody({
  required final String text,
  required final double size,
  required final FontWeight fontWeight,
  required final TextAlign alignment,
}) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
      height: UTextHeight,
    ),
  );
}

Widget buildTitleRow({
  required final Function() ontap,
  required final String title1,
  title2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: UPdMg5),
        child: Text(
          title1,
          style: const TextStyle(
            fontSize: UTitleSize16,
            fontWeight: UTitleWeight,
            color: UPrimaryColor,
          ),
        ),
      ),
      InkWell(
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                title2,
                style: const TextStyle(
                  fontSize: UBodySize,
                  fontWeight: UBodyWeight,
                  color: UPrimaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: UBodySize,
                color: UPrimaryColor,
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget buildListVideoDisplay({
  required final Widget player,
  required final String title,
  caption,
}) {
  return ListView(
    physics: const ClampingScrollPhysics(),
    children: [
      player,
      buildTitleVideoDisplay(title),
      buildCaptionVideoDisplay(caption),
      buildHeight5(),
    ],
  );
}

Widget buildTitleVideoDisplay(final String title) {
  return Container(
    decoration: const BoxDecoration(
      color: UBackgroundColor,
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(URoundedLarge),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          color: ULightGreyColor,
          blurRadius: 2,
        ),
      ],
    ),
    padding: const EdgeInsets.all(UPdMg10),
    width: UFullWidth,
    alignment: Alignment.center,
    child: buildTitleBody(
      text: title,
      size: UTitleSize,
      fontWeight: UTitleWeight,
      alignment: Get.locale?.languageCode == 'km' ? TextAlign.center : TextAlign.justify,
    ),
  );
}

Widget buildCaptionVideoDisplay(final String caption) {
  return Container(
    padding: const EdgeInsets.all(UPdMg10),
    width: UFullWidth,
    child: buildTitleBody(
      text: caption,
      size: UTitleSize,
      fontWeight: UBodyWeight,
      alignment: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
    ),
  );
}

Widget buildProgressBar() {
  return ProgressBar(
    isExpanded: false,
    colors: const ProgressBarColors(
      playedColor: URedColor,
      bufferedColor: USecondaryColor,
      handleColor: URedColor,
      backgroundColor: UGreyColor,
    ),
  );
}
