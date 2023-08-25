import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_StudyInfo/Class_Study_Info.dart';

class Study_Info extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  const Study_Info({
    super.key,
    required this.data_studentUser,
  });

  @override
  State<Study_Info> createState() => _Study_InfoState();
}

class _Study_InfoState extends State<Study_Info> {
  bool isLoading = false;
  late List<StudyInfoData> _dataStudyInfo = [];
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
            ? 'http://192.168.3.87/usea/api/apidata.php?action=exam_schedule'
            : 'http://192.168.3.87/usea/api/student_info_data_exam_en.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (mounted) {
          setState(() {
            _dataStudyInfo = List<StudyInfoData>.from(
              data['study_info_data'].map(
                (data) => StudyInfoData.fromJson(data),
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
      appBar: Custom_AppBar(title: 'ព័ត៌មានការសិក្សា'.tr),
      body: _dataStudyInfo.isEmpty
          ? FutureBuilder(
              future: Future.delayed(Duration(seconds: 3)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text('គ្មានទិន្ន័យ'.tr),
                  );
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView.builder(
                padding: EdgeInsets.all(UPdMg_5),
                itemCount: _dataStudyInfo.length,
                itemBuilder: (BuildContext context, index) {
                  final isLastIndex = index == _dataStudyInfo.length - 1;
                  return Card(
                    elevation: 1,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    color: UBackgroundColor,
                    margin: isLastIndex
                        ? EdgeInsets.fromLTRB(
                            UPdMg_5, UPdMg_5, UPdMg_5, UPdMg_10)
                        : EdgeInsets.all(UPdMg_5),
                    child: Padding(
                      padding: EdgeInsets.all(UPdMg_8),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NormalDateStudyInfo(
                                    text: _dataStudyInfo[index].date,
                                  ),
                                  buildDividerAtt(),
                                  NormalDateStudyInfo(
                                      text: _dataStudyInfo[index].month),
                                ],
                              ),
                            ),
                            buildVerticalDividerAtt(),
                            Container(
                              padding: EdgeInsets.only(left: UPdMg_8),
                              child: IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 250,
                                      child: TitleAttendance_Theme(
                                          text: _dataStudyInfo[index].title),
                                    ),
                                    buildDividerAtt(),
                                    RowDataStudyInfo(
                                      title: 'មុខវិជ្ជា\t',
                                      tData: _dataStudyInfo[index].subject,
                                    ),
                                    RowDataStudyInfo(
                                      title: 'បន្ទប់\t',
                                      tData: _dataStudyInfo[index].room,
                                    ),
                                    RowDataStudyInfo(
                                      title: 'ម៉ោង\t',
                                      tData: _dataStudyInfo[index].time,
                                    ),
                                    RowDataStudyInfo(
                                      title: 'លេខតុ\t',
                                      tData: _dataStudyInfo[index].seat,
                                    ),
                                    _dataStudyInfo[index].takeout == '1'
                                        ? Text(
                                            'ដកបេក្ខភាព',
                                            style: TextStyle(
                                              fontSize: UBodySize,
                                              fontWeight: UTitleWeight,
                                              color: URedColor,
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
