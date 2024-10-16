import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../../Users_API.dart';
import '../Class_StudyInfo/Class_Study_Info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'Custom_Build_StudyInfo.dart';

class StudyinfoExam extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  const StudyinfoExam({
    super.key,
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<StudyinfoExam> createState() => _StudyinfoExamState();
}

class _StudyinfoExamState extends State<StudyinfoExam> {
  late bool isLoading = false;
  late List<StudyInfoData> dataStudyInfo = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return dataStudyInfo.isEmpty
        ? Container(
            height: MediaQuery.of(context).size.height,
            child: buildFutureBuilder(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildStudyInfoLabel('ព័ត៌មានការប្រឡង'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(UPdMg5),
                itemCount: dataStudyInfo.length,
                itemBuilder: (context, index) {
                  final isLastIndex = index == dataStudyInfo.length - 1;
                  return Card(
                    elevation: 0.5,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: UBackgroundColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    color: UBackgroundColor,
                    margin: EdgeInsets.fromLTRB(
                      UPdMg5,
                      UPdMg5,
                      UPdMg5,
                      isLastIndex ? UZeroPixel : UPdMg10,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          buildStudyInfoExamTitle(
                            dataStudyInfo[index].title,
                          ),
                          buildStudyInfoExamBody(
                            widgetMonth: NormalDateStudyInfo(dataStudyInfo[index].month),
                            widgetDate: NormalDateStudyInfo(dataStudyInfo[index].date),
                            widgetSubject: RowDataStudyInfo(
                              title: 'មុខវិជ្ជា\t',
                              tData: dataStudyInfo[index].subject,
                            ),
                            widgetRoom: RowDataStudyInfo(
                              title: 'បន្ទប់\t',
                              tData: dataStudyInfo[index].room,
                            ),
                            widgetTime: RowDataStudyInfo(
                              title: 'ម៉ោង\t',
                              tData: dataStudyInfo[index].time,
                            ),
                            widgetSeat: RowDataStudyInfo(
                              title: 'លេខតុ\t',
                              tData: dataStudyInfo[index].seat,
                            ),
                            widgetTakeout: dataStudyInfo[index].takeout == '1'
                                ? Text(
                                    'ដកបេក្ខភាព'.tr,
                                    style: const TextStyle(
                                      fontSize: UBodySize,
                                      fontWeight: UTitleWeight,
                                      color: URedColor,
                                      height: UTextHeight,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }

  Future<void> _refreshData() async {
    setState(
      () => isLoading = true,
    );

    try {
      var response = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIStExamKh : APIStExamEn,
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
            dataStudyInfo = List<StudyInfoData>.from(
              data['study_info_data'].map(
                (data) => StudyInfoData.fromJson(data),
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
      print('Failed to fetch study info: $error');
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
