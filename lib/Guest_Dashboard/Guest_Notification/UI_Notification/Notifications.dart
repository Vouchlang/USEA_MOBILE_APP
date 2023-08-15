import 'package:flutter/material.dart';
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'Notification',
      ),
      body: Container(),
    );
  }
}
