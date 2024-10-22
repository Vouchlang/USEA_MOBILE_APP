import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Users_API.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'package:http/http.dart' as http;
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_JobHistory/Class_Job_History.dart';
import 'Custom_Build_JobHistory.dart';

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
  late bool isLoading = false;
  late List<JobHistory> _dataJobHistory = [];
  @override
  void initState() {
    super.initState();
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
          ? buildJobHistoryNoData()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _dataJobHistory.length,
                itemBuilder: (context, index) {
                  final isLastIndex = index == _dataJobHistory.length - 1;
                  return buildJobHistoryDataCard(
                    lastIndex: isLastIndex == true ? UPdMg15 : UZeroPixel,
                    startDate: _dataJobHistory[index].date_start_work.isEmpty ? 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr + 'N/A' : 'កាលបរិច្ឆេទចូលបម្រើការងារ​\t\t\t\t\t'.tr + _dataJobHistory[index].date_start_work,
                    widgetStatus: buildJobHistoryData(
                      textTitle: 'ស្ថានភាពការងារ',
                      textValue: _dataJobHistory[index].status_name.isEmpty ? 'N/A' : _dataJobHistory[index].status_name,
                    ),
                    widgetWorkplace: buildJobHistoryData(
                      textTitle: 'ស្ថាប័ន',
                      textValue: _dataJobHistory[index].workPlace.isEmpty ? 'N/A' : _dataJobHistory[index].workPlace,
                    ),
                    widgetPosition: buildJobHistoryData(
                      textTitle: 'មុខតំណែង',
                      textValue: _dataJobHistory[index].position.isEmpty ? 'N/A' : _dataJobHistory[index].position,
                    ),
                    widgetSalary: buildJobHistoryData(
                      textTitle: 'ប្រាក់បៀវត្ស',
                      textValue: _dataJobHistory[index].salary.isEmpty ? 'N/A' : _dataJobHistory[index].salary,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future<void> _refreshData() async {
    setState(
      () => isLoading = true,
    );
    try {
      var response = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIStLoginKh : APIStLoginEn,
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
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
          setState(
            () => isLoading = false,
          );
        }
      }
    } catch (error) {
      print('Failed to fetch job history: $error');
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshData();
  }
}
