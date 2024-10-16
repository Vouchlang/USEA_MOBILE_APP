import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildQRCodeBody({
  required final Key qrKey,
  required final double fullWidth,
  fullHeight,
  qrContainerSize,
  qrImgSize,
  required final String data,
  studentId,
  imageUrl,
}) {
  return Center(
    child: RepaintBoundary(
      key: qrKey,
      child: Container(
        decoration: BoxDecoration(
          color: USecondaryColor,
          image: DecorationImage(
            image: AssetImage(imageAsset + 'bg_school.png'),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              ULightGreyColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        width: fullWidth,
        height: fullHeight,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: qrContainerSize,
              padding: const EdgeInsets.only(bottom: UPdMg20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 50,
                    spreadRadius: 2,
                    color: ULightGreyColor,
                  ),
                ],
                color: UBackgroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: UHeight50),
                  QrImageView(
                    data: data,
                    version: QrVersions.auto,
                    size: qrImgSize,
                    errorCorrectionLevel: QrErrorCorrectLevel.H,
                    embeddedImage: AssetImage(imageAsset + 'usea_logo.png'),
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(
                        UWidth40,
                        UHeight40,
                      ),
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      color: UPrimaryColor,
                      dataModuleShape: QrDataModuleShape.square,
                    ),
                    eyeStyle: const QrEyeStyle(
                      color: UPrimaryColor,
                      eyeShape: QrEyeShape.square,
                    ),
                    padding: const EdgeInsets.all(UPdMg10),
                  ),
                  buildHeight5(),
                  Text(
                    studentId,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: UTitleWeight,
                      fontFamily: UEFontFamily,
                      color: UPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: UBackgroundColor,
                    width: UWidth5,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
