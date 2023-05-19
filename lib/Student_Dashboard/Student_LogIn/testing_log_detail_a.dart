import 'package:flutter/material.dart';

import '../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';

class DataPage1 extends StatelessWidget {
  final List<JobHistory> data_jobhistory;

  DataPage1({required this.data_jobhistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: ListView.builder(
        itemCount: data_jobhistory.length,
        itemBuilder: (context, index) {
          final item = data_jobhistory[index];
          return ListTile(
            title: Text(item.dateStartWork),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.status_name),
                Text(item.workPlace),
                Text(item.position),
                Text(item.salary),
              ],
            ),
          );
        },
      ),
    );
  }
}
