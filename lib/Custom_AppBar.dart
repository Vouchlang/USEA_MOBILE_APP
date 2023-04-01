import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Custom_AppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(title,
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 18,
            fontFamily: 'KhmerOSbattambang',
            fontWeight: FontWeight.w600,
          )),
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData.fallback(),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.indigo[900],
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
