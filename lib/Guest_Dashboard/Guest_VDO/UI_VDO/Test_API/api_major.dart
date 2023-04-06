import 'package:flutter/material.dart';
import 'package:usea_app/Custom_AppBar.dart';

class Major_Screen extends StatelessWidget {
  final String majorName; //
  const Major_Screen({super.key, required this.majorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Custom_AppBar(title: majorName));
  }
}
