import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../theme_builder.dart';
import '../../Guardian_Other_Class/Class_Guardian_User.dart';
import '../Class_Home/Class_Grid_Home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  int activeIndex = 0;
  bool isLoading = false;
  late List<GuardianUser> _dataGuardianUser;
  late List<GdDetail> _dataGdDetail = [];
  late List<FeedbackClass> _dataFeedback = [];

  @override
  void initState() {
    super.initState();
    _dataGuardianUser = widget.data_guardianUser;
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response_gdUser = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=login_parents',
        ),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      var response_gdDetail = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=login_parents',
        ),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      var response_feedback = await http.post(
        Uri.parse(
          APIUrlStudent + 'action=login_parents',
        ),
        body: {
          'guardian_id': widget.data_guardianUser[0].guardian_id,
          'pwd': widget.data_guardianUser[0].pwd,
        },
      );

      if (response_gdUser.statusCode == 200 &&
          response_gdDetail.statusCode == 200 &&
          response_feedback.statusCode == 200) {
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
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Failed to fetch data: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
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
                buildHeight5(),
                Text(
                  'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីអាណាព្យាបាលដែរឬទេ?'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: UBodySize,
                  ),
                ),
                buildHeight5(),
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
                            await prefs.remove('guardian_user');
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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUniversityName(
              UPrimaryColor,
            ),
            Row(
              children: [
                IconButton(
                  splashColor: UTransParentColor,
                  highlightColor: UTransParentColor,
                  icon: Icon(
                    Icons.logout,
                    color: UPrimaryColor,
                    size: 18,
                  ),
                  onPressed: () {
                    _logout();
                  },
                ),
                buildWidth5(),
              ],
            ),
          ],
        ),
        titleSpacing: 5,
        toolbarHeight: 75,
        centerTitle: false,
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
      ),
      body: _dataGdDetail.isEmpty || _dataGuardianUser.isEmpty
          ? buildFutureBuild()
          : ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: UHeight15),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _dataGdDetail.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      highlightColor: UTransParentColor,
                      splashColor: UTransParentColor,
                      onTap: () {
                        Get.to(
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
                          duration: Duration(
                            milliseconds: 100,
                          ),
                        );
                      },
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
                          borderRadius: BorderRadius.circular(
                            URoundedLarge,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: UPdMg10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: UPdMg10,
                                  horizontal: UPdMg20,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        _dataGdDetail[index].profile_pic,
                                      ),
                                      radius: 50,
                                    ),
                                    buildWidth20(),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          buildHeaderDetail(
                                            _dataGdDetail[index].name_kh.isEmpty
                                                ? 'N/A'
                                                : _dataGdDetail[index].name_kh,
                                            UKFontFamily,
                                            UTitleSize16,
                                            UTitleWeight,
                                          ),
                                          buildHeaderDetail(
                                            _dataGdDetail[index].name_en.isEmpty
                                                ? 'N/A'
                                                : _dataGdDetail[index].name_en,
                                            UEFontFamily,
                                            UTitleSize16,
                                            UBodyWeight,
                                          ),
                                          buildHeaderDetail(
                                            _dataGdDetail[index]
                                                    .student_id
                                                    .isEmpty
                                                ? 'N/A'
                                                : _dataGdDetail[index]
                                                    .student_id,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBodyDetail(
                                    'ឆ្នាំ',
                                    _dataGdDetail[index].year_name.isEmpty
                                        ? 'N/A'
                                        : _dataGdDetail[index].year_name,
                                  ),
                                  buildVerticalDividerH_45(),
                                  buildBodyDetail(
                                    'ឆមាស',
                                    _dataGdDetail[index].semester_name.isEmpty
                                        ? 'N/A'
                                        : _dataGdDetail[index].semester_name,
                                  ),
                                  buildVerticalDividerH_45(),
                                  buildBodyDetail(
                                    'ជំនាន់',
                                    _dataGdDetail[index].stage_name.isEmpty
                                        ? 'N/A'
                                        : _dataGdDetail[index].stage_name,
                                  ),
                                  buildVerticalDividerH_45(),
                                  buildBodyDetail(
                                    'វគ្គ',
                                    _dataGdDetail[index].term_name.isEmpty
                                        ? 'N/A'
                                        : _dataGdDetail[index].term_name,
                                  ),
                                  buildVerticalDividerH_45(),
                                  buildBodyDetail(
                                    'ឆ្នាំសិក្សា',
                                    _dataGdDetail[index].academic_year.isEmpty
                                        ? 'N/A'
                                        : _dataGdDetail[index].academic_year,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                buildHeight10(),
                GridView.count(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3.5,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.90,
                  padding: EdgeInsets.symmetric(
                    horizontal: UPdMg7,
                  ),
                  children: List.generate(
                    guardian_Grid_Home_Screen.length,
                    (index) => Card(
                      elevation: 1.5,
                      color: UBackgroundColor,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          UPdMg10,
                        ),
                      ),
                      child: InkWell(
                        highlightColor: UTransParentColor,
                        splashColor: UTransParentColor,
                        onTap: () {
                          _dataFeedback[0].feedback.isNotEmpty
                              ? _launchFeedback()
                              : showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: URedColor,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          URoundedLarge,
                                        ),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(
                                          UPdMg7,
                                        ),
                                        padding: EdgeInsets.all(
                                          UPdMg10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: URedColor,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'សូមអធ្យាស្រ័យ'.tr,
                                              style: TextStyle(
                                                fontSize: UTitleSize,
                                                fontWeight: UTitleWeight,
                                              ),
                                            ),
                                            buildHeight5(),
                                            Text(
                                              'សូមអធ្យាស្រ័យលោកអ្នកមិនទាន់អាចធ្វើការ Feedback បាននៅឡើយទេ!!!'
                                                  .tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: UBodySize,
                                              ),
                                            ),
                                            buildHeight5(),
                                            Container(
                                              height: UHeight50,
                                              padding: EdgeInsets.all(
                                                UPdMg5,
                                              ),
                                              alignment: Alignment.center,
                                              child: TextButton(
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: UPdMg15,
                          ),
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
                                style: TextStyle(
                                  fontSize: UTitleSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
