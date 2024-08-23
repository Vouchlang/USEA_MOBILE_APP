import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Custom_Widget/CustomText.dart';
import '/theme_builder.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Custom_AppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ULightGreyColor,
      backgroundColor: UBackgroundColor,
      surfaceTintColor: UBackgroundColor,
      scrolledUnderElevation: 1,
      elevation: 1,
      centerTitle: false,
      titleSpacing: UZeroPixel,
      title: Text(
        title,
        style: const TextStyle(
          color: UPrimaryColor,
          fontSize: UFontSize18,
          fontWeight: UTitleWeight,
        ),
      ),
      iconTheme: const IconThemeData.fallback(),
      leading: buildBackBtn(
        () => Navigator.of(context).pop(
          Transition.leftToRightWithFade,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
