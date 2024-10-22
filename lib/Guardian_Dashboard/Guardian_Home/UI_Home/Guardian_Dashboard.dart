import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Guardian_Dashboard/Guardian_Home/Class_Home/Class_Home.dart';
import '../../../Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../Home.dart';
import '../../../Student_Dashboard/Student_Other_Class/Class_Feedback.dart';
import '../../../Student_Dashboard/Student_Other_Class/Class_Student_User.dart';
import '../../../Student_Dashboard/Users_API.dart';
import '../../../theme_builder.dart';
import '../../Guardian_Other_Class/Class_Guardian_User.dart';
import '../Class_Home/Class_Grid_Home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Custom_Build_Guardian_Dachboard.dart';

class Guardian_Dashboard extends StatefulWidget {
  final List<GuardianUser> data_guardianUser;

  const Guardian_Dashboard({
    required this.data_guardianUser,
    super.key,
  });

  @override
  State<Guardian_Dashboard> createState() => _Guardian_DashboardState();
}

class _Guardian_DashboardState extends State<Guardian_Dashboard> {
  late final int activeIndex = 0;
  late bool isLoading = false;
  late List<GuardianUser> _dataGuardianUser;
  late List<GdDetail> _dataGdDetail = [];
  late List<FeedbackClass> _dataFeedback = [];

  @override
  void initState() {
    super.initState();
    _dataGuardianUser = widget.data_guardianUser;
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUniversityName(UPrimaryColor),
            Row(
              children: [
                IconButton(
                  splashColor: UTransParentColor,
                  highlightColor: UTransParentColor,
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: UPrimaryColor,
                    size: 18,
                  ),
                  onPressed: () => _logout(),
                ),
              ],
            ),
          ],
        ),
        titleSpacing: UWidth5,
        toolbarHeight: 75,
        centerTitle: false,
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
      ),
      body: _dataGdDetail.isEmpty || _dataGuardianUser.isEmpty
          ? buildFutureBuilder()
          : ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: UHeight15),
              children: [
                buildListStudent(),
                buildHeight10(),
                buildGridviewFeedback(),
              ],
            ),
    );
  }

  Widget buildListStudent() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _dataGdDetail.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: UTransParentColor,
          splashColor: UTransParentColor,
          onTap: () => Get.to(
            () => St_Home(
              data_studentUser: [
                StudentUser(
                  name_kh: _dataGdDetail[index].name_kh,
                  student_id: _dataGdDetail[index].student_id,
                  pwd: _dataGdDetail[index].password,
                  guardian_id: _dataGuardianUser[0].guardian_id,
                )
              ],
              sourceScreen: guardian_sourceScreen,
            ),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 100),
          ),
          child: Card(
            elevation: 1.5,
            color: UBackgroundColor,
            shadowColor: ULightGreyColor,
            margin: EdgeInsets.only(
              top: index == 0 ? UHeight15 : UHeight10,
              left: UPdMg10,
              right: UPdMg10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(URoundedLarge),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: UPdMg10),
              child: Column(
                children: [
                  buildTopProfile(
                    pfImage: _dataGdDetail[index].profile_pic,
                    nameKh: _dataGdDetail[index].name_kh.isEmpty ? 'N/A' : _dataGdDetail[index].name_kh,
                    nameEn: _dataGdDetail[index].name_en.isEmpty ? 'N/A' : _dataGdDetail[index].name_en,
                    stId: _dataGdDetail[index].student_id.isEmpty ? 'N/A' : _dataGdDetail[index].student_id,
                  ),
                  buildDividerStDetail(),
                  buildBottomProfile(
                    year: _dataGdDetail[index].year_name.isEmpty ? 'N/A' : _dataGdDetail[index].year_name,
                    semester: _dataGdDetail[index].semester_name.isEmpty ? 'N/A' : _dataGdDetail[index].semester_name,
                    stage: _dataGdDetail[index].stage_name.isEmpty ? 'N/A' : _dataGdDetail[index].stage_name,
                    term: _dataGdDetail[index].term_name.isEmpty ? 'N/A' : _dataGdDetail[index].term_name,
                    academic_year: _dataGdDetail[index].academic_year.isEmpty ? 'N/A' : _dataGdDetail[index].academic_year,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildGridviewFeedback() {
    return GridView.count(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 3.5,
      crossAxisSpacing: 3,
      childAspectRatio: 1.90,
      padding: const EdgeInsets.symmetric(horizontal: UPdMg7),
      children: List.generate(
        guardian_Grid_Home_Screen.length,
        (index) => Card(
          elevation: 1.5,
          color: UBackgroundColor,
          shadowColor: ULightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UPdMg10),
          ),
          child: InkWell(
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            onTap: () => _dataFeedback[0].feedback.isEmpty
                ? showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => buildErrorDialog(
                      txtTitle: 'សូមអធ្យាស្រ័យ'.tr,
                      txtDescription: 'សូមអធ្យាស្រ័យលោកអ្នកមិនទាន់អាចធ្វើការ Feedback បាននៅឡើយទេ!!!'.tr,
                    ),
                  )
                : _launchFeedback(),
            child: Container(
              padding: const EdgeInsets.only(left: UPdMg15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    guardian_Grid_Home_Screen[index].img,
                    scale: UScale6,
                  ),
                  buildHeight7(),
                  Text(
                    guardian_Grid_Home_Screen[index].name.tr,
                    style: const TextStyle(fontSize: UTitleSize),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(
      () => isLoading = true,
    );

    try {
      var response_gdUser = await http.post(
        Uri.parse(APIGuardianLogin),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      var response_gdDetail = await http.post(
        Uri.parse(APIGuardianLogin),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      var response_feedback = await http.post(
        Uri.parse(APIGuardianLogin),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      if (response_gdUser.statusCode == 200 && response_gdDetail.statusCode == 200 && response_feedback.statusCode == 200) {
        var data_gdUser = jsonDecode(response_gdUser.body);
        var data_gdDetail = jsonDecode(response_gdDetail.body);
        var data_feedback = jsonDecode(response_feedback.body);

        if (mounted) {
          setState(() {
            _dataGuardianUser = List<GuardianUser>.from(
              data_gdUser['guardian_users'].map(
                (data_gdUser) => GuardianUser.fromJson(data_gdUser),
              ),
            );
            _dataGdDetail = List<GdDetail>.from(
              data_gdDetail['student_users'].map(
                (data_gdDetail) => GdDetail.fromJson(data_gdDetail),
              ),
            );
            _dataFeedback = List<FeedbackClass>.from(
              data_feedback['feedback_data'].map(
                (data_feedback) => FeedbackClass.fromJson(data_feedback),
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
      print('Failed to fetch data: $error');
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }

  void _launchFeedback() async {
    if (await canLaunchUrlString(_dataFeedback[0].feedback)) {
      await launchUrlString(_dataFeedback[0].feedback);
    } else {
      throw 'Could not launch ${_dataFeedback[0].feedback}';
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
          signOutTxtDes: 'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីអាណាព្យាបាលដែរឬទេ?'.tr,
          popBtn: () => Get.back(),
          signOutBtn: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('guardian_user');
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
