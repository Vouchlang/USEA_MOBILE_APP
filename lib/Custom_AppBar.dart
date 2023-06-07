import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Custom_AppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          color: UPrimaryColor,
          fontSize: 18,
          fontWeight: UTitleWeight,
        ),
      ),
      backgroundColor: UBackgroundColor,
      elevation: 1,
      iconTheme: IconThemeData.fallback(),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
