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
        Uri.parse(Get.locale?.languageCode == 'km'
            ? APIUrlStudent + 'action=login_student'
            : APIUrlStudentEn + 'action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (mounted) {
          setState(() {
            _dataJobHistory = List<JobHistory>.from(
              data['job_history_data'].map(
                (data) => JobHistory.fromJson(data),
              ),
            );
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Error: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
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
      appBar: Custom_AppBar(title: 'ប្រវត្តិការងារ'.tr),
      body: _dataJobHistory.isEmpty
          ? FutureBuilder(
              future: Future.delayed(Duration(seconds: 10)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: UPrimaryColor,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(UPdMg_5),
                    child: Card(
                      elevation: 2,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(URoundedLarge),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(UPdMg_10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr +
                                      'N/A',
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
                                NoWeightTitleTheme('N/A'),
                              ],
                            ),
                            Divider(),
                            buildJobHistoryCardRow('ស្ថាប័ន', 'N/A'),
                            Divider(),
                            buildJobHistoryCardRow('មុខតំណែង', 'N/A'),
                            Divider(),
                            buildJobHistoryCardRow('ប្រាក់បៀវត្ស', 'N/A'),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              child: ListView.builder(
                padding: EdgeInsets.all(UPdMg_5),
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
                                _dataJobHistory[index].date_start_work.isEmpty
                                    ? 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'
                                            .tr +
                                        'N/A'
                                    : 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'
                                            .tr +
                                        _dataJobHistory[index].date_start_work,
                                style: TextStyle(
                                  fontSize: UTitleSize,
                                  fontWeight: UTitleWeight,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          buildJobHistoryCardRow(
                              'ស្ថានភាពការងារ',
                              _dataJobHistory[index].status_name.isEmpty
                                  ? 'N/A'
                                  : _dataJobHistory[index].status_name),
                          Divider(),
                          buildJobHistoryCardRow(
                              'ស្ថាប័ន',
                              _dataJobHistory[index].workPlace.isEmpty
                                  ? 'N/A'
                                  : _dataJobHistory[index].workPlace),
                          Divider(),
                          buildJobHistoryCardRow(
                              'មុខតំណែង',
                              _dataJobHistory[index].position.isEmpty
                                  ? 'N/A'
                                  : _dataJobHistory[index].position),
                          Divider(),
                          buildJobHistoryCardRow(
                              'ប្រាក់បៀវត្ស',
                              _dataJobHistory[index].salary.isEmpty
                                  ? 'N/A'
                                  : _dataJobHistory[index].salary),
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
