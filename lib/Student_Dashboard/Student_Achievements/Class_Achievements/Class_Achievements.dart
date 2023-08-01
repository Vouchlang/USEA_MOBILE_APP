class AchievementData {
  List<AchievementTypeData> achievementData;

  AchievementData({required this.achievementData});

  factory AchievementData.fromJson(Map<String, dynamic> json) {
    return AchievementData(
      achievementData: (json['achievement_data'] as List<dynamic>)
          .map((e) => AchievementTypeData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'achievement_data': achievementData.map((e) => e.toJson()).toList(),
    };
  }
}

class AchievementTypeData {
  String achievementType;
  List<AchievementImageData> data;

  AchievementTypeData({required this.achievementType, required this.data});

  factory AchievementTypeData.fromJson(Map<String, dynamic> json) {
    return AchievementTypeData(
      achievementType: json['achievement_type'],
      data: (json['data'] as List<dynamic>)
          .map((e) => AchievementImageData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'achievement_type': achievementType,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class AchievementImageData {
  String image;

  AchievementImageData({required this.image});

  factory AchievementImageData.fromJson(Map<String, dynamic> json) {
    return AchievementImageData(
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:usea_app/theme_builder.dart';

// import '../../../Custom_Widget/CustomText.dart';
// import '../Class_Achievements/Class_Achievements.dart';
// import '/Custom_AppBar.dart';

// class Achievements extends StatefulWidget {
//   const Achievements({super.key});

//   @override
//   State<Achievements> createState() => _AchievementsState();
// }

// class _AchievementsState extends State<Achievements> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: USecondaryColor,
//       appBar: Custom_AppBar(title: 'សម្មិទ្ធផល'.tr),
//       body: ListView(
//         shrinkWrap: true,
//         physics: ScrollPhysics(),
//         children: [
//           Column(
//             children: [
//               SizedBox(height: UPdMg_10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/image/unlocked.png',
//                     scale: 8,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(UPdMg_8),
//                     child: TitleTheme(text: 'Unlocked'),
//                   ),
//                 ],
//               ),
//               // * Unlock body
//               GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 mainAxisSpacing: UPdMg_10,
//                 crossAxisSpacing: UPdMg_10,
//                 childAspectRatio: 1.90,
//                 padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                 physics: NeverScrollableScrollPhysics(),
//                 children: List.generate(
//                   achievements.length,
//                   (index) => Card(
//                     shadowColor: ULightGreyColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(UPdMg_10),
//                     ),
//                     margin: EdgeInsets.all(UZeroPixel),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(UPdMg_10),
//                       child: Image.asset(
//                         achievements[index].image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/image/locked.png',
//                     scale: 8,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(UPdMg_8),
//                     child: TitleTheme(text: 'Locked'),
//                   ),
//                 ],
//               ),

//               // * Lock body
//               GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 mainAxisSpacing: UPdMg_10,
//                 crossAxisSpacing: UPdMg_10,
//                 childAspectRatio: 1.90,
//                 padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                 physics: NeverScrollableScrollPhysics(),
//                 children: List.generate(
//                   achievements.length,
//                   (index) => Card(
//                     shadowColor: Colors.grey[200],
//                     color: UGreyColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(UPdMg_10),
//                     ),
//                     margin: EdgeInsets.all(UZeroPixel),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(UPdMg_10),
//                       child: Image.asset(
//                         achievements[index].image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
