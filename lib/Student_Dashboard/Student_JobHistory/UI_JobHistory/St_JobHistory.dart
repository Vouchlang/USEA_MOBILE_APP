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
  final String sourceScreen;

  const Job_History({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
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
          Get.locale?.languageCode == 'km'
              ? APIUrlStudent + 'action=login_student'
              : APIUrlStudentEn + 'action=login_student',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
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
      print('Failed to fetch job history: $error');
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
      appBar: Custom_AppBar(
        title: 'ប្រវត្តិការងារ'.tr,
      ),
      body: _dataJobHistory.isEmpty
          ? FutureBuilder(
              future: Future.delayed(
                const Duration(
                  seconds: 5,
                ),
              ),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: UPrimaryColor,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(
                      UPdMg5,
                    ),
                    child: Card(
                      elevation: 1,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: UBackgroundColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          URoundedLarge,
                        ),
                      ),
                      margin: const EdgeInsets.all(
                        UPdMg10,
                      ),
                      color: UBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: UPdMg15,
                              horizontal: UPdMg10,
                            ),
                            width: UFullWidth,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  URoundedLarge,
                                ),
                                topRight: Radius.circular(
                                  URoundedLarge,
                                ),
                              ),
                              color: UBGLightBlue,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr +
                                      'N/A',
                                  style: const TextStyle(
                                    fontSize: UTitleSize,
                                    fontWeight: UTitleWeight,
                                    color: UPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildJobHistoryCardRow(
                            'ស្ថានភាពការងារ',
                            'N/A',
                          ),
                          buildJobHistoryCardRow(
                            'ស្ថាប័ន',
                            'N/A',
                          ),
                          buildJobHistoryCardRow(
                            'មុខតំណែង',
                            'N/A',
                          ),
                          buildJobHistoryCardRow(
                            'ប្រាក់បៀវត្ស',
                            'N/A',
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _dataJobHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: UBackgroundColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(
                        URoundedLarge,
                      ),
                    ),
                    margin: const EdgeInsets.all(
                      UPdMg10,
                    ),
                    color: UBackgroundColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: UPdMg15,
                            horizontal: UPdMg10,
                          ),
                          width: UFullWidth,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                URoundedLarge,
                              ),
                              topRight: Radius.circular(
                                URoundedLarge,
                              ),
                            ),
                            color: UBGLightBlue,
                          ),
                          height: UHeight50,
                          child: Row(
                            children: [
                              Text(
                                _dataJobHistory[index].date_start_work.isEmpty
                                    ? 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'
                                            .tr +
                                        'N/A'
                                    : 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'
                                            .tr +
                                        _dataJobHistory[index].date_start_work,
                                style: const TextStyle(
                                  fontSize: UTitleSize,
                                  fontWeight: UTitleWeight,
                                  color: UPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        buildJobHistoryCardRow(
                          'ស្ថានភាពការងារ',
                          _dataJobHistory[index].status_name.isEmpty
                              ? 'N/A'
                              : _dataJobHistory[index].status_name,
                        ),
                        buildJobHistoryCardRow(
                          'ស្ថាប័ន',
                          _dataJobHistory[index].workPlace.isEmpty
                              ? 'N/A'
                              : _dataJobHistory[index].workPlace,
                        ),
                        buildJobHistoryCardRow(
                          'មុខតំណែង',
                          _dataJobHistory[index].position.isEmpty
                              ? 'N/A'
                              : _dataJobHistory[index].position,
                        ),
                        buildJobHistoryCardRow(
                          'ប្រាក់បៀវត្ស',
                          _dataJobHistory[index].salary.isEmpty
                              ? 'N/A'
                              : _dataJobHistory[index].salary,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
