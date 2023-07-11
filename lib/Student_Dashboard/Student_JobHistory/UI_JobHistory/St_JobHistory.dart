import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'package:http/http.dart' as http;
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_JobHistory/Class_Job_History.dart';

class Job_History extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  const Job_History({
    Key? key,
    required this.data_studentUser,
  }) : super(key: key);

  @override
  State<Job_History> createState() => _Job_HistoryState();
}

class _Job_HistoryState extends State<Job_History> {
  bool isLoading = false;
  late List<JobHistory> _dataJobHistory = [];
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(
            'http://192.168.3.87/usea/api/job_history.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          _dataJobHistory = List<JobHistory>.from(
            data['job_history_data'].map(
              (data) => JobHistory.fromJson(data),
            ),
          );
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានការងារ'.tr),
      body: _dataJobHistory.isEmpty
          ? FutureBuilder(
              future: Future.delayed(Duration(seconds: 3)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text('No Data'),
                  );
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView.builder(
                padding: EdgeInsets.all(9),
                itemCount: _dataJobHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(UPdMg_10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr +
                                    '${_dataJobHistory[index].date_start_work}',
                                style: TextStyle(
                                  fontSize: UTitleSize,
                                  fontWeight: UTitleWeight,
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
                                  style: TextStyle(fontSize: UTitleSize),
                                ),
                              ),
                              NoWeightTitleTheme(
                                  text: _dataJobHistory[index].status_name),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                width: 125,
                                child: Text(
                                  'ស្ថាប័ន'.tr,
                                  style: TextStyle(fontSize: UTitleSize),
                                ),
                              ),
                              Expanded(
                                child: NoWeightTitleTheme(
                                    text: _dataJobHistory[index].workPlace),
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
                                    fontSize: UTitleSize,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: NoWeightTitleTheme(
                                  text: _dataJobHistory[index].position,
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
                                    fontSize: UTitleSize,
                                  ),
                                ),
                              ),
                              Text(
                                _dataJobHistory[index].salary.tr,
                                style: TextStyle(
                                  fontSize: UTitleSize,
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
            ),
    );
  }
}
