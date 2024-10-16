import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Guardian_Dashboard/Guardian_Home/UI_Home/Custom_Build_Guardian_Dachboard.dart';
import '../../../Student_Dashboard/Student_Detail/UI_Detail/St_ProfilePic.dart';
import '../../Users_API.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../QR_Code/QR_Code.dart';
import '/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';
import '/Home.dart';
import '../Class_Detail/Class_St_Detail.dart';
import 'Custom_Build_St_Detail.dart';

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
          widget.sourceScreen == st_sourceScreen
              ? IconButton(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: UPrimaryColor,
                    size: 18,
                  ),
                  onPressed: () => _logout(),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: _dataStDetail.isEmpty
          ? buildFutureBuilder()
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              backgroundColor: UBackgroundColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _dataStDetail.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      buildTopStDetail1(
                        imageBtn: () => Get.to(
                          () => St_ProfilePic(
                            imageUrls: _dataStDetail[index].profile_pic,
                          ),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 100),
                        ),
                        qrCode: widget.sourceScreen == st_sourceScreen
                            ? Positioned(
                                right: 2,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () => Get.to(
                                    () => QrCodeGenerator(
                                      data_studentUser: widget.data_studentUser,
                                      profileImageUrl: _dataStDetail[0].profile_pic,
                                    ),
                                    transition: Transition.rightToLeftWithFade,
                                    duration: const Duration(milliseconds: 100),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(UPdMg5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: UScoreColor,
                                    ),
                                    child: const Icon(
                                      Icons.qr_code_rounded,
                                      color: UBackgroundColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        imageUrl: _dataStDetail[index].profile_pic,
                        nameKh: _dataStDetail[index].name_kh.isEmpty ? 'N/A' : _dataStDetail[index].name_kh,
                        nameEn: _dataStDetail[index].name_en.isEmpty ? 'N/A' : _dataStDetail[index].name_en,
                        stId: _dataStDetail[index].student_id.isEmpty ? 'N/A' : _dataStDetail[index].student_id,
                        year: _dataStDetail[index].year_name.isEmpty ? 'N/A' : _dataStDetail[index].year_name,
                        semester: _dataStDetail[index].semester_name.isEmpty ? 'N/A' : _dataStDetail[index].semester_name,
                        stage: _dataStDetail[index].stage_name.isEmpty ? 'N/A' : _dataStDetail[index].stage_name,
                        term: _dataStDetail[index].term_name.isEmpty ? 'N/A' : _dataStDetail[index].term_name,
                        academic: _dataStDetail[index].academic_year.isEmpty ? 'N/A' : _dataStDetail[index].academic_year,
                      ),
                      buildBottomDetail(
                        facName: _dataStDetail[index].faculty_name,
                        degreeName: _dataStDetail[index].degree_name,
                        majorName: _dataStDetail[index].major_name,
                        roomName: _dataStDetail[index].room_name,
                        shiftName: _dataStDetail[index].shift_name,
                        statusName: _dataStDetail[index].status_name,
                        dob: _dataStDetail[index].date_of_birth,
                        phone: _dataStDetail[index].phone_number,
                        job: _dataStDetail[index].job,
                        workplace: _dataStDetail[index].work_place,
                      ),
                    ],
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
          setState(
            () => isLoading = false,
          );
        }
      }
    } catch (error) {
      print('Failed to fetch student detail: $error');
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

  void _logout() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return buildDialogSignOut(
          signOutTxtDes: 'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីនិសិ្សតដែរឬទេ?'.tr,
          popBtn: () => Get.back(),
          signOutBtn: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('student_user');
            Get.off(
              () => const Home(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 100),
            );
          },
        );
      },
    );
  }
}
