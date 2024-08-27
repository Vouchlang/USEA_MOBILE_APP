import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Student_Dashboard/Student_Detail/UI_Detail/St_ProfilePic.dart';
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
            margin: const EdgeInsets.all(
              UPdMg7,
            ),
            padding: const EdgeInsets.all(
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
                  style: const TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UTitleWeight,
                  ),
                ),
                buildHeight5(),
                Text(
                  'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីនិសិ្សតដែរឬទេ?'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: UBodySize,
                  ),
                ),
                buildHeight5(),
                Container(
                  height: UHeight50,
                  padding: const EdgeInsets.all(
                    UPdMg5,
                  ),
                  alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'បោះបង់'.tr,
                            style: const TextStyle(
                              color: UPrimaryColor,
                              fontSize: UBodySize,
                            ),
                          ),
                        ),
                        buildVerticalDividerAtt(),
                        InkWell(
                          highlightColor: UTransParentColor,
                          splashColor: UTransParentColor,
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.remove('student_user');
                            Get.off(
                              () => const Home(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(
                                milliseconds: 100,
                              ),
                            );
                          },
                          child: Text(
                            'ចាកចេញ'.tr,
                            style: const TextStyle(
                              color: URedColor,
                              fontSize: UBodySize,
                            ),
                          ),
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
        titleSpacing: UZeroPixel,
        title: Text(
          'ព័ត៌មានលម្អិតរបស់និស្សិត'.tr,
          style: const TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        elevation: 1,
        scrolledUnderElevation: 1,
        shadowColor: ULightGreyColor,
        iconTheme: const IconThemeData.fallback(),
        leading: buildBackBtn(
          () => Get.back(),
        ),
        actions: [
          (() {
            if (widget.sourceScreen == st_sourceScreen) {
              return IconButton(
                highlightColor: UTransParentColor,
                splashColor: UTransParentColor,
                icon: const Icon(
                  Icons.logout,
                  color: UPrimaryColor,
                  size: 18,
                ),
                onPressed: () {
                  _logout();
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          })(),
        ],
      ),
      body: _dataStDetail.isEmpty
          ? buildFutureBuild()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _dataStDetail.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(
                          left: UPdMg12,
                          right: UPdMg12,
                          top: UPdMg15,
                          bottom: UPdMg5,
                        ),
                        elevation: 1,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            UPdMg10,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                UPdMg10,
                                UPdMg10,
                                UPdMg10,
                                UZeroPixel,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    highlightColor: UTransParentColor,
                                    splashColor: UTransParentColor,
                                    onTap: () {
                                      Get.to(
                                        () => St_ProfilePic(
                                          imageUrls:
                                              _dataStDetail[index].profile_pic,
                                        ),
                                      );
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              _dataStDetail[index].profile_pic,
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  buildWidth10(),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          UTitleWeight,
                                        ),
                                        buildHeaderDetail(
                                          _dataStDetail[index]
                                                  .student_id
                                                  .isEmpty
                                              ? 'N/A'
                                              : _dataStDetail[index].student_id,
                                          UEFontFamily,
                                          UTitleSize,
                                          UTitleWeight,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            buildDividerStDetail(),
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: UPdMg10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildBodyDetail(
                                    'ឆ្នាំ',
                                    _dataStDetail[index].year_name.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].year_name,
                                  ),
                                  buildBodyDetail(
                                    'ឆមាស',
                                    _dataStDetail[index].semester_name.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].semester_name,
                                  ),
                                  buildBodyDetail(
                                    'ជំនាន់',
                                    _dataStDetail[index].stage_name.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].stage_name,
                                  ),
                                  buildBodyDetail(
                                    'វគ្គ',
                                    _dataStDetail[index].term_name.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].term_name,
                                  ),
                                  buildBodyDetail(
                                    'ឆ្នាំសិក្សា',
                                    _dataStDetail[index].academic_year.isEmpty
                                        ? 'N/A'
                                        : _dataStDetail[index].academic_year,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(
                          left: UPdMg12,
                          right: UPdMg12,
                          top: UPdMg7,
                          bottom: UPdMg15,
                        ),
                        elevation: 1,
                        color: UBackgroundColor,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            UPdMg10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: UPdMg15,
                          ),
                          child: Column(
                            children: [
                              buildTailDetail(
                                imageAsset + 'Stu_Faculty.png',
                                'មហាវិទ្យាល័យ'.tr,
                                _dataStDetail[index].faculty_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Degree.png',
                                'កម្រិតសិក្សា'.tr,
                                _dataStDetail[index].degree_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Major.png',
                                'មុខជំនាញ'.tr,
                                _dataStDetail[index].major_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Room.png',
                                'បន្ទប់សិក្សា'.tr,
                                _dataStDetail[index].room_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Shift.png',
                                'វេនសិក្សា'.tr,
                                _dataStDetail[index].shift_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Status.png',
                                'ស្ថានភាពសិក្សា'.tr,
                                _dataStDetail[index].status_name,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_DOB.png',
                                'ថ្ងៃកំណើត'.tr,
                                _dataStDetail[index].date_of_birth,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Tel.png',
                                'លេខទូរស័ព្ទ'.tr,
                                _dataStDetail[index].phone_number,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Job.png',
                                'មុខតំណែង'.tr,
                                _dataStDetail[index].job,
                              ),
                              buildDividerStDetail(),
                              buildTailDetail(
                                imageAsset + 'Stu_Workplace.png',
                                'ស្ថាប័ន'.tr,
                                _dataStDetail[index].work_place,
                              ),
                            ],
                          ),
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
