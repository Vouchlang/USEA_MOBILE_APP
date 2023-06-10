import 'package:flutter/material.dart';

import '../Student_Detail/Class_Detail/Class_St_Detail.dart';

class DataPage2 extends StatelessWidget {
  final List<StDetail> data2;

  DataPage2({required this.data2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: ListView.builder(
        itemCount: data2.length,
        itemBuilder: (context, index) {
          final item = data2[index];
          return ListTile(
            title: Text(
              item.name_kh,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name_en),
                Text(item.student_id),
              ],
            ),
          );
        },
      ),
    );
  }
}
