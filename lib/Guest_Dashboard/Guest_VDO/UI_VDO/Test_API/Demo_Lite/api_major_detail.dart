import 'package:flutter/material.dart';

import '../../../../../Custom_AppBar.dart';
import 'api_main_lite.dart';
import 'class_demo.dart';

class Major_Detail_Lite extends StatelessWidget {
  final Program_List majorData;
  final int index;

  const Major_Detail_Lite(
      {Key? key, required this.majorData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMajor = majorData.majors[index];

    return Scaffold(
      appBar: Custom_AppBar(title: selectedMajor),
      body: Center(
        child: Text(majorData.facName),
      ),
    );
  }
}
