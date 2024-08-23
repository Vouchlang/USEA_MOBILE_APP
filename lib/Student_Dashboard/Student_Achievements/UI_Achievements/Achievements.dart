import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
// import '../Class_Achievements/Class_Achievements.dart';
// import 'package:confetti/confetti.dart';

class Achievements extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  final String sourceScreen;

  Achievements({
    Key? key,
    required this.data_studentUser,
    required this.sourceScreen,
  }) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  // bool isLoading = false;
  // AchievementData? _achievementData;
  // int _selectedAchievementTypeIndex = 0;
  // ConfettiController? _confettiController;
  // List<bool> hasSeenPopupList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _confettiController = ConfettiController(
  //     duration: const Duration(
  //       seconds: 3,
  //     ),
  //   );
  //   _refreshData();
  // }

  // @override
  // void dispose() {
  //   _confettiController?.dispose();
  //   super.dispose();
  // }

  // Check and show popups for new achievements immediately.
  // void _initializePopups() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var seenPopups = prefs.getStringList('hasSeenPopupList') ?? [];

  //   // Initialize the hasSeenPopupList with the correct size and default values.
  //   hasSeenPopupList = [];
  //   for (var achievementGroup in _achievementData!.achievementData) {
  //     hasSeenPopupList.addAll(
  //       List<bool>.filled(
  //         achievementGroup.data.length,
  //         false,
  //       ),
  //     );
  //   }

  //   // Ensure the saved list has the same length as the current achievements list.
  //   if (seenPopups.length == hasSeenPopupList.length) {
  //     // Update the hasSeenPopupList with the stored values if they exist.
  //     for (int i = 0; i < seenPopups.length; i++) {
  //       hasSeenPopupList[i] = seenPopups[i] == 'true';
  //     }
  //   } else {
  //     // Clear the saved list if lengths do not match.
  //     await prefs.setStringList('hasSeenPopupList', []);
  //   }

  //   // Check and show popups for new achievements immediately.
  //   _checkAndShowCongratulationsPopups();
  // }

  // void _checkAndShowCongratulationsPopups() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   int index = 0;
  //   for (var achievementGroup in _achievementData!.achievementData) {
  //     for (var achievement in achievementGroup.data) {
  //       if (achievement.image_status == 1 && !hasSeenPopupList[index]) {
  //         _showCongratulationsPopup(achievement);
  //         hasSeenPopupList[index] = true;
  //       }
  //       index++;
  //     }
  //   }

  //   // Save the updated seen popups list.
  //   await prefs.setStringList(
  //     'hasSeenPopupList',
  //     hasSeenPopupList.map((e) => e.toString()).toList(),
  //   );
  // }

  // void _showCongratulationsPopup(AchievementImageData achievement) {
  //   if (achievement.image_status == 1) {
  //     _confettiController?.play();
  //   }

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         elevation: 5,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(
  //               URoundedLarge,
  //             ),
  //           ),
  //         ),
  //         backgroundColor: USecondaryColor,
  //         content: Stack(
  //           children: [
  //             Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     if (achievement.image_status == 1)
  //                       Text(
  //                         'សូមអបអរសាទរ'.tr,
  //                         style: TextStyle(
  //                           fontSize: UTitleSize16,
  //                           fontWeight: UTitleWeight,
  //                           color: UPrimaryColor,
  //                         ),
  //                       ),
  //                     if (achievement.image_status == 0)
  //                       Container(
  //                         alignment: Alignment.center,
  //                         child: Text(
  //                           'មិនទាន់បានបញ្ចប់'.tr,
  //                           style: TextStyle(
  //                             fontSize: UTitleSize16,
  //                             fontWeight: UTitleWeight,
  //                             color: UPrimaryColor,
  //                           ),
  //                         ),
  //                       ),
  //                     if (achievement.image_status == 1)
  //                       ConfettiWidget(
  //                         confettiController: _confettiController!,
  //                         blastDirectionality: BlastDirectionality.explosive,
  //                         blastDirection: 135,
  //                         shouldLoop: false,
  //                         maxBlastForce: 100,
  //                         numberOfParticles: 50,
  //                         colors: [
  //                           URedColor,
  //                           UYellowColor,
  //                           USecondaryColor,
  //                           Colors.blue,
  //                           Colors.teal,
  //                           Colors.purple,
  //                           Colors.amber,
  //                         ],
  //                       ),
  //                   ],
  //                 ),
  //                 buildHeight15(),
  //                 Card(
  //                   elevation: 1,
  //                   shadowColor: ULightGreyColor,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(
  //                       UPdMg10,
  //                     ),
  //                   ),
  //                   child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(
  //                       URoundedLarge,
  //                     ),
  //                     child: ColorFiltered(
  //                       colorFilter: achievement.image_status == 0
  //                           ? ColorFilter.mode(
  //                               UGreyColor,
  //                               BlendMode.saturation,
  //                             )
  //                           : ColorFilter.mode(
  //                               UTransParentColor,
  //                               BlendMode.multiply,
  //                             ),
  //                       child: Image.network(
  //                         'http://192.168.1.108/hosting_api/Test_student/Achievement_Img/' +
  //                             achievement.image,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 buildHeight15(),
  //                 Text(
  //                   achievement.image_title,
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontSize: UTitleSize,
  //                     color: UTextColor,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Positioned(
  //               right: UZeroPixel,
  //               top: UZeroPixel,
  //               height:
  //                   Get.locale?.languageCode == 'kh' ? UHeight30 : UHeight25,
  //               child: InkWell(
  //                 highlightColor: UTransParentColor,
  //                 splashColor: UTransParentColor,
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Image.asset(
  //                   imageAsset + 'close.png',
  //                   scale: UScale10,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<void> _refreshData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     var response = await http.post(
  //       Uri.parse(
  //         'http://192.168.1.108/hosting_api/Test_student/st_achievement_testing.php',
  //       ),
  //       body: {
  //         'student_id': widget.data_studentUser[0].student_id,
  //         'pwd': widget.data_studentUser[0].pwd,
  //         'guardian_id': widget.sourceScreen == "guardian_sourceScreen"
  //             ? widget.data_studentUser[0].guardian_id
  //             : 'N/A',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       if (mounted) {
  //         setState(() {
  //           _achievementData = AchievementData.fromJson(jsonData);
  //           isLoading = false;
  //         });
  //         _initializePopups();
  //       }
  //     } else {
  //       print(
  //           'Failed to fetch achievements. Status Code: ${response.statusCode}');
  //       if (mounted) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //     }
  //   } catch (error) {
  //     print('Failed to fetch achievements: $error');
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'សមិទ្ធិផល'.tr,
      ),
      // body: (_achievementData == null ||
      //         _achievementData!.achievementData.isEmpty)
      //     ? buildFutureBuild()
      //     : RefreshIndicator(
      //         onRefresh: _refreshData,
      //         color: UPrimaryColor,
      //         backgroundColor: UBackgroundColor,
      //         child: Padding(
      //           padding: EdgeInsets.all(
      //             UPdMg5,
      //           ),
      //           child: ListView(
      //             shrinkWrap: true,
      //             children: [
      //               Container(
      //                 alignment: Alignment.center,
      //                 height: 70,
      //                 width: UFullWidth,
      //                 child: ListView.builder(
      //                     shrinkWrap: true,
      //                     physics: BouncingScrollPhysics(),
      //                     itemCount: _achievementData!.achievementData.length,
      //                     scrollDirection: Axis.horizontal,
      //                     itemBuilder: (context, index) {
      //                       final isLastIndex = index ==
      //                           _achievementData!.achievementData.length - 1;
      //                       return GestureDetector(
      //                         onTap: () {
      //                           setState(
      //                             () {
      //                               _selectedAchievementTypeIndex = index;
      //                             },
      //                           );
      //                           _initializePopups(); // Reinitialize popups for new selection
      //                         },
      //                         child: AnimatedContainer(
      //                           alignment: Alignment.center,
      //                           duration: Duration(
      //                             milliseconds: 300,
      //                           ),
      //                           margin: EdgeInsets.fromLTRB(
      //                             UPdMg10,
      //                             UPdMg10,
      //                             isLastIndex ? UPdMg10 : UZeroPixel,
      //                             UPdMg10,
      //                           ),
      //                           padding: EdgeInsets.all(
      //                             UPdMg10,
      //                           ),
      //                           width: 120,
      //                           decoration: BoxDecoration(
      //                             color: _selectedAchievementTypeIndex == index
      //                                 ? UPrimaryColor
      //                                 : UBackgroundColor,
      //                             borderRadius: BorderRadius.circular(
      //                               URoundedMedium,
      //                             ),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 blurRadius: 1,
      //                                 color: ULightGreyColor,
      //                                 offset: Offset(0, 1),
      //                               ),
      //                             ],
      //                           ),
      //                           child: Text(
      //                             'ឆ្នាំទី​ ${_achievementData!.achievementData[index].achievementType}'
      //                                 .tr,
      //                             textAlign: TextAlign.center,
      //                             style: TextStyle(
      //                               fontSize: UTitleSize,
      //                               color:
      //                                   _selectedAchievementTypeIndex == index
      //                                       ? UBackgroundColor
      //                                       : UTextColor,
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     }),
      //               ),
      //               GridView.builder(
      //                 physics: NeverScrollableScrollPhysics(),
      //                 shrinkWrap: true,
      //                 padding: EdgeInsets.all(
      //                   UPdMg10,
      //                 ),
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 3,
      //                   crossAxisSpacing: UWidth10,
      //                   mainAxisSpacing: UHeight10,
      //                 ),
      //                 itemCount: _achievementData!
      //                     .achievementData[_selectedAchievementTypeIndex]
      //                     .data
      //                     .length,
      //                 itemBuilder: (context, index) {
      //                   final achievement = _achievementData!
      //                       .achievementData[_selectedAchievementTypeIndex]
      //                       .data[index];
      //                   return Card(
      //                     elevation: 1,
      //                     shadowColor: ULightGreyColor,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(
      //                         UPdMg10,
      //                       ),
      //                     ),
      //                     child: GridTile(
      //                       child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(
      //                           URoundedLarge,
      //                         ),
      //                         child: ColorFiltered(
      //                           colorFilter: achievement.image_status == 0
      //                               ? ColorFilter.mode(
      //                                   UGreyColor,
      //                                   BlendMode.saturation,
      //                                 )
      //                               : ColorFilter.mode(
      //                                   UTransParentColor,
      //                                   BlendMode.multiply,
      //                                 ),
      //                           child: GestureDetector(
      //                             onTap: () {
      //                               _showCongratulationsPopup(achievement);
      //                             },
      //                             child: Image.network(
      //                               'http://192.168.1.108/hosting_api/Test_student/Achievement_Img/' +
      //                                   achievement.image,
      //                               fit: BoxFit.cover,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      body: buildComingSoon(),
    );
  }
}
