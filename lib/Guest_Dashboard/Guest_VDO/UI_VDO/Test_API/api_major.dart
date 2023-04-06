import 'package:flutter/material.dart';

class Major_Screen extends StatelessWidget {
  final String majorName; //
  const Major_Screen({super.key, required this.majorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(majorName)),
    );
  }
}
