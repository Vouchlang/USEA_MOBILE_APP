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
        setState(() {
          _achievementData = AchievementData.fromJson(jsonData);
          isLoading = false;
        });
      } else {
        // Handle error when fetching data
        print(
            'Failed to fetch achievements. Status Code: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Failed to fetch achievements: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: USecondaryColor,
        appBar: Custom_AppBar(title: 'សមិទ្ធិផល'.tr),
        body: _achievementData == null
            ? Center(
                child: Text('No Data'),
              )
            : RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: _achievementData!.achievementData.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          final achievementTypeData =
                              _achievementData!.achievementData[index];
                          final isLastIndex = index ==
                              _achievementData!.achievementData.length - 1;

                          return Column(
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
                                  margin: EdgeInsets.fromLTRB(UPdMg_10,
                                      UPdMg_10, isLastIndex ? 10 : 0, UPdMg_10),
                                  padding: EdgeInsets.all(UPdMg_10),
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color:
                                        _selectedAchievementTypeIndex == index
                                            ? UPrimaryColor
                                            : UBackgroundColor,
                                    borderRadius:
                                        BorderRadius.circular(URoundedMedium),
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
                                          _selectedAchievementTypeIndex == index
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
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: _selectedAchievementTypeIndex >= 0
                            ? _achievementData!
                                .achievementData[_selectedAchievementTypeIndex]
                                .data
                                .length
                            : 0,
                        itemBuilder: (context, index) {
                          return Card(
                            shadowColor: Colors.grey[200],
                            color: UGreyColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(UPdMg_10),
                            ),
                            margin: EdgeInsets.all(UZeroPixel),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(UPdMg_10),
                              child: Image.network(
                                _achievementData!
                                    .achievementData[
                                        _selectedAchievementTypeIndex]
                                    .data[index]
                                    .image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
