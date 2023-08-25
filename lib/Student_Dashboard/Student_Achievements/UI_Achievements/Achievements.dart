import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Custom_AppBar.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Achievements/Class_Achievements.dart';

class Achievements extends StatefulWidget {
  final List<StudentUser> data_studentUser;

  Achievements({
    Key? key,
    required this.data_studentUser,
  }) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  bool isLoading = false;
  AchievementData? _achievementData;
  int _selectedAchievementTypeIndex = 0;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(
            'http://192.168.1.51/hosting_api/Test_student/st_achievement_testing.php'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (mounted) {
          setState(() {
            _achievementData = AchievementData.fromJson(jsonData);
            isLoading = false;
          });
        }
      } else {
        print(
            'Failed to fetch achievements. Status Code: ${response.statusCode}');
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Failed to fetch achievements: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'សមិទ្ធិផល'.tr),
      body: (_achievementData == null ||
              _achievementData!.achievementData.isEmpty)
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
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _achievementData!.achievementData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        final achievementTypeData =
                            _achievementData!.achievementData[index];
                        final isLastIndex = index ==
                            _achievementData!.achievementData.length - 1;
                        return _achievementData!.achievementData.isEmpty
                            ? Center(
                                child: Text('No Data'),
                              )
                            : Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          _selectedAchievementTypeIndex = index;
                                        },
                                      );
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      margin: EdgeInsets.fromLTRB(
                                          UPdMg_10,
                                          UPdMg_10,
                                          isLastIndex ? UPdMg_10 : UZeroPixel,
                                          UPdMg_10),
                                      padding: EdgeInsets.all(UPdMg_10),
                                      width: 165,
                                      decoration: BoxDecoration(
                                        color: _selectedAchievementTypeIndex ==
                                                index
                                            ? UPrimaryColor
                                            : UBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            URoundedMedium),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1,
                                            color: ULightGreyColor,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        achievementTypeData.achievementType,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              _selectedAchievementTypeIndex ==
                                                      index
                                                  ? UBackgroundColor
                                                  : UTextColor,
                                          fontSize: UTitleSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(
                        UPdMg_10, UZeroPixel, UPdMg_10, UPdMg_10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: UPdMg_10,
                      mainAxisSpacing: UPdMg_10,
                    ),
                    itemCount: _achievementData != null &&
                            _selectedAchievementTypeIndex >= 0 &&
                            _selectedAchievementTypeIndex <
                                _achievementData!.achievementData.length
                        ? _achievementData!
                            .achievementData[_selectedAchievementTypeIndex]
                            .data
                            .length
                        : 0,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: UBackgroundColor,
                        color: UGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(UPdMg_10),
                        ),
                        margin: EdgeInsets.all(UZeroPixel),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(UPdMg_10),
                          child: _achievementData != null &&
                                  _selectedAchievementTypeIndex >= 0 &&
                                  _selectedAchievementTypeIndex <
                                      _achievementData!
                                          .achievementData.length &&
                                  _achievementData!
                                      .achievementData[
                                          _selectedAchievementTypeIndex]
                                      .data
                                      .isNotEmpty &&
                                  index <
                                      _achievementData!
                                          .achievementData[
                                              _selectedAchievementTypeIndex]
                                          .data
                                          .length
                              ? Image.network(
                                  _achievementData!
                                      .achievementData[
                                          _selectedAchievementTypeIndex]
                                      .data[index]
                                      .image,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Text('គ្មានទិន្ន័យ'.tr),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
