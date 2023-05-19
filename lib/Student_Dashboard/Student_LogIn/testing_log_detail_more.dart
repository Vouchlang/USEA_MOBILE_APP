import 'package:flutter/material.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail_a.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail_b.dart';

import '../Student_Detail/Class_Detail/Class_St_Detail1.dart';
import '../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';

class DataPage extends StatelessWidget {
  final List<JobHistory> data11;
  final List<StDetail> data12;

  DataPage({required this.data11, required this.data12});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DataPage1(
                    data_jobhistory: data11,
                  ),
                ),
              );
            },
            child: Text('Screen1'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DataPage2(data2: data12),
                ),
              );
            },
            child: Text('Screen2'),
          ),
        ],
      ),
    );
  }
}
