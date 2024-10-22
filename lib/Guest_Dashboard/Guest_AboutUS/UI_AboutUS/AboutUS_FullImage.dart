import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import 'Build_Custom_AboutUS.dart';

class AboutUS_FullImage extends StatefulWidget {
  final String imageUrls, screenNav;

  AboutUS_FullImage({
    required this.imageUrls,
    required this.screenNav,
  });

  @override
  _AboutUS_FullImageState createState() => _AboutUS_FullImageState();
}

class _AboutUS_FullImageState extends State<AboutUS_FullImage> {
  bool isFullScreen = true;

  @override
  Widget build(BuildContext context) {
    widget.screenNav == screenNav
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);

    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Stack(
        children: [
          buildFullImage(widget.imageUrls),
          buildExitIcon(
            () => setState(
              () {
                isFullScreen = !isFullScreen;
                if (!isFullScreen) Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
