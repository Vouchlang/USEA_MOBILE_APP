import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildAboutUSCard({
  required final Function() onTap,
  required final String img,
  text,
}) {
  return Card(
    elevation: 1,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: UPdMg15,
          horizontal: UPdMg10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    img,
                    scale: 6,
                  ),
                  buildWidth10(),
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: UTitleSize16,
                        fontWeight: UTitleWeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              imageAsset + 'Right_Arrow.png',
              scale: UScale15,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildFullImage(final String image) {
  return Container(
    height: UFullWidth,
    width: UFullWidth,
    color: UTextColor,
    child: Image.asset(
      image,
      fit: BoxFit.contain,
    ),
  );
}

Widget buildExitIcon(final Function() onPressed) {
  return Positioned(
    bottom: UPdMg10,
    right: UPdMg10,
    child: IconButton(
      icon: const Icon(
        Icons.fullscreen_exit,
        color: USecondaryColor,
        size: 25,
      ),
      onPressed: onPressed,
    ),
  );
}

Widget buildMessage(final String text) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: UPdMg10,
      vertical: UPdMg10,
    ),
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontFamily: UEFontFamily,
        height: UTextHeight,
      ),
    ),
  );
}
