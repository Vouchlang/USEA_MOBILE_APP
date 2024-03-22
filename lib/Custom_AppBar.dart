import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      centerTitle: false,
      titleSpacing: 0,
      title: Text(
        title,
        style: TextStyle(
          color: UPrimaryColor,
          fontSize: UFontSize18,
          fontWeight: UTitleWeight,
        ),
      ),
      backgroundColor: UBackgroundColor,
      elevation: 1,
      iconTheme: IconThemeData.fallback(),
      leading: IconButton(
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        icon: Icon(
          Icons.arrow_back_ios,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: () => Navigator.of(context).pop(
          Transition.leftToRightWithFade,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
