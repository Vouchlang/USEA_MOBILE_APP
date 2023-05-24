import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';

import '../Class_JobHistory/Class_Job_History.dart';

class Job_History extends StatelessWidget {
  final List<JobHistory> data_jobhistory;

  const Job_History({Key? key, required this.data_jobhistory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការងារ'.tr),
      body: data_jobhistory.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(9),
              itemCount: data_jobhistory.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shadowColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr +
                                  '${data_jobhistory[index].date_start_work}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'KhmerOSbattambang',
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              width: 125,
                              child: Text(
                                'ស្ថានភាពការងារ'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                            Text(
                              data_jobhistory[index].status_name,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              width: 125,
                              child: Text(
                                'ស្ថាប័ន'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                data_jobhistory[index].workPlace,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              width: 125,
                              child: Text(
                                'មុខតំណែង'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                data_jobhistory[index].position,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              width: 125,
                              child: Text(
                                'ប្រាក់បៀវត្ស'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                            Text(
                              data_jobhistory[index].salary,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'KhmerOSbattambang',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
