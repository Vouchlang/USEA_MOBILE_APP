import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

// Build Border for Scanning area
Widget buildCustomBorders({
  required final double cutOutSize,
  top,
  left,
}) {
  return Positioned(
    top: top,
    left: left,
    child: SizedBox(
      width: cutOutSize,
      height: cutOutSize,
      child: Stack(
        children: [
          // Top-left corner
          Positioned(
            top: UZeroPixel,
            left: UZeroPixel,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                  left: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(URoundedLarge),
                ),
              ),
            ),
          ),

          // Top-right corner
          Positioned(
            top: UZeroPixel,
            right: UZeroPixel,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                  right: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(URoundedLarge),
                ),
              ),
            ),
          ),

          // Bottom-left corner
          Positioned(
            bottom: UZeroPixel,
            left: UZeroPixel,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                  left: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(URoundedLarge),
                ),
              ),
            ),
          ),

          // Bottom-right corner
          Positioned(
            bottom: UZeroPixel,
            right: UZeroPixel,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                  right: BorderSide(
                    width: UWidth5,
                    color: UBackgroundColor,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(URoundedLarge),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildCustomBackButton() {
  return Positioned(
    top: UHeight30,
    left: UWidth10,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          right: 1,
          child: IconButton(
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: UBackgroundColor,
              size: 18,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        IconButton(
          highlightColor: UTransParentColor,
          splashColor: UTransParentColor,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UBackgroundColor,
            size: 18,
          ),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );
}

Widget buildScanQRCodeTxt(final double top) {
  return Positioned(
    top: top,
    child: Text(
      'ស្កេន QR Code'.tr,
      style: const TextStyle(
        fontSize: 22,
        color: UBackgroundColor,
        fontWeight: UBodyWeight,
      ),
    ),
  );
}

Widget buildFlashlightButton({
  required final Color bgColor,
  required final Function() onTap,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: bgColor,
      radius: 25,
      child: Image.asset(
        imageAsset + 'flashlight.png',
        scale: 15,
      ),
    ),
  );
}

Widget buildImageScaner(final Function() onTap) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: const CircleAvatar(
      backgroundColor: ULightGreyColor,
      radius: 25,
      child: Icon(
        Icons.photo,
        color: UTextColor,
        size: 25,
      ),
    ),
  );
}
