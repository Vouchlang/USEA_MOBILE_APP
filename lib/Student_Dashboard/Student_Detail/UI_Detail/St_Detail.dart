import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Student_Dashboard/Student_Detail/UI_Detail/St_ProfilePic.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';
import '/Home.dart';
import '../Class_Detail/Class_St_Detail.dart';

class Student_Detail extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  const Student_Detail({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
  }) : super(key: key);

  @override
  State<Student_Detail> createState() => _Student_DetailState();
}

class _Student_DetailState extends State<Student_Detail> {
  bool isLoading = false;
  late List<StDetail> _dataStDetail = [];

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
            _dataStDetail = List<StDetail>.from(
              data['user_data'].map(
                (data) => StDetail.fromJson(data),
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
      print('Failed to fetch student detail: $error');
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

  void _logout() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            URoundedLarge,
          )),
          child: Container(
            margin: EdgeInsets.all(UPdMg7),
            padding: EdgeInsets.all(
              UPdMg10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: UBackgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ចាកចេញ'.tr,
                  style: TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UTitleWeight,
                  ),
                ),
                SizedBox(
                  height: UHeight5,
                ),
                Text(
                  'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីនិសិ្សតដែរឬទេ?'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: UBodySize,
                  ),
                ),
                SizedBox(
                  height: UHeight5,
                ),
                Container(
                  height: UHeight50,
                  padding: EdgeInsets.all(
                    UPdMg5,
                  ),
                  alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'បោះបង់'.tr,
                            style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: UBodySize,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        buildVerticalDividerAtt(),
                        TextButton(
                          child: Text(
                            'ចាកចេញ'.tr,
                            style: TextStyle(
                              color: URedColor,
                              fontSize: UBodySize,
                            ),
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.clear();
                            Get.off(
                              () => Home(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(
                                milliseconds: 100,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'ព័ត៌មានលម្អិតរបស់និស្សិត'.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
        backgroundColor: UBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          highlightColor: UTransParentColor,
          splashColor: UTransParentColor,
          icon: Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          (() {
            if (widget.sourceScreen == st_sourceScreen) {
              return IconButton(
                highlightColor: UTransParentColor,
                splashColor: UTransParentColor,
                icon: Icon(
                  Icons.logout,
                  color: UPrimaryColor,
                  size: 18,
                ),
                onPressed: () {
                  _logout();
                },
              );
            } else {
              return SizedBox.shrink();
            }
          })(),
        ],
      ),
      body: _dataStDetail.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _dataStDetail.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: UPdMg10,
                          horizontal: UPdMg20,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => St_ProfilePic(
                                      imageUrls:
                                          _dataStDetail[index].profile_pic,
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _dataStDetail[index].profile_pic,
                                ),
                                radius: 50,
                              ),
                            ),
                            SizedBox(
                              width: UWidth20,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildHeaderDetail(
                                    _dataStDetail[index].name_kh.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].name_kh,
                                    UKFontFamily,
                                    UTitleSize16,
                                    UTitleWeight,
                                  ),
                                  buildHeaderDetail(
                                    _dataStDetail[index].name_en.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].name_en,
                                    UEFontFamily,
                                    UTitleSize16,
                                    UBodyWeight,
                                  ),
                                  buildHeaderDetail(
                                    _dataStDetail[index].student_id.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].student_id,
                                    UEFontFamily,
                                    UBodySize,
                                    UBodyWeight,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      buildDividerStDetail(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildBodyDetail(
                            'ឆ្នាំ',
                            _dataStDetail[index].year_name.isEmpty
                                ? 'N/A'
                                : _dataStDetail[index].year_name,
                          ),
                          buildVerticalDividerH_45(),
                          buildBodyDetail(
                            'ឆមាស',
                            _dataStDetail[index].semester_name.isEmpty
                                ? 'N/A'
                                : _dataStDetail[index].semester_name,
                          ),
                          buildVerticalDividerH_45(),
                          buildBodyDetail(
                            'ជំនាន់',
                            _dataStDetail[index].stage_name.isEmpty
                                ? 'N/A'
                                : _dataStDetail[index].stage_name,
                          ),
                          buildVerticalDividerH_45(),
                          buildBodyDetail(
                            'វគ្គ',
                            _dataStDetail[index].term_name.isEmpty
                                ? 'N/A'
                                : _dataStDetail[index].term_name,
                          ),
                          buildVerticalDividerH_45(),
                          buildBodyDetail(
                            'ឆ្នាំសិក្សា',
                            _dataStDetail[index].academic_year.isEmpty
                                ? 'N/A'
                                : _dataStDetail[index].academic_year,
                          ),
                        ],
                      ),
                      buildDividerStDetail(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: UPdMg10,
                          horizontal: UPdMg20,
                        ),
                        child: Column(
                          children: [
                            buildTailDetail(
                              'assets/image/Stu_Faculty.png',
                              'មហាវិទ្យាល័យ'.tr,
                              _dataStDetail[index].faculty_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Degree.png',
                              'កម្រិតសិក្សា'.tr,
                              _dataStDetail[index].degree_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Major.png',
                              'មុខជំនាញ'.tr,
                              _dataStDetail[index].major_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Room.png',
                              'បន្ទប់សិក្សា'.tr,
                              _dataStDetail[index].room_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Shift.png',
                              'វេនសិក្សា'.tr,
                              _dataStDetail[index].shift_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Status.png',
                              'ស្ថានភាពសិក្សា'.tr,
                              _dataStDetail[index].status_name,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_DOB.png',
                              'ថ្ងៃកំណើត'.tr,
                              _dataStDetail[index].date_of_birth,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Tel.png',
                              'លេខទូរស័ព្ទ'.tr,
                              _dataStDetail[index].phone_number,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Job.png',
                              'មុខតំណែង'.tr,
                              _dataStDetail[index].job,
                            ),
                            buildDividerStDetail(),
                            buildTailDetail(
                              'assets/image/Stu_Workplace.png',
                              'ស្ថាប័ន'.tr,
                              _dataStDetail[index].work_place,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
