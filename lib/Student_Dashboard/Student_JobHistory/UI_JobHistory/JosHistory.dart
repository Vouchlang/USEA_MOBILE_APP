import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Class_JobHistory/Class_Job_History.dart';

class Job_History extends StatefulWidget {
  const Job_History({Key? key}) : super(key: key);

  @override
  State<Job_History> createState() => _Job_HistoryState();
}

class _Job_HistoryState extends State<Job_History> {
  List<Class_JobHistory> jobhistory = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(Uri.parse(
          "http://192.168.3.34/hosting_api/Student/st_workplace.php"));
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        jobhistory = r.map((e) => Class_JobHistory.fromJson(e)).toList();
      } else {
        jobhistory = [Class_JobHistory.fromJson(r)];
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការងារ'.tr),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.all(9),
                itemCount: jobhistory.length,
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
                                  'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t${jobhistory[index].date_start_work}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'KhmerOSbattambang'),
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  child: Text(
                                    'ស្ថានភាពការងារ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                ),
                                Text(
                                  jobhistory[index].status_name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'KhmerOSbattambang'),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  child: Text(
                                    'ស្ថាប័ន',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    jobhistory[index].work_place,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                    'មុខតំណែង',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    jobhistory[index].position,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                    'ប្រាក់បៀវត្ស',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                ),
                                Text(
                                  jobhistory[index].salary,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'KhmerOSbattambang'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              ),
      ),
    );
  }
}
