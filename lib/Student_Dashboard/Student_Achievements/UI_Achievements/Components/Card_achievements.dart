import 'package:flutter/material.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../Class_Achievements/Class_Achievements.dart';

class CardAchievements extends StatelessWidget {
  const CardAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Column(
        children: [
          SizedBox(height: UPdMg_10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/unlocked.png',
                scale: 8,
              ),
              Padding(
                padding: EdgeInsets.all(UPdMg_8),
                child: TitleTheme(text: 'Unlocked'),
              ),
            ],
          ),
          // * Unlock body
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: UPdMg_10,
            crossAxisSpacing: UPdMg_10,
            childAspectRatio: 1.90,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              achievements.length,
              (index) => Container(
                child: Card(
                  shadowColor: Colors.grey[200],
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                  ),
                  margin: EdgeInsets.all(UZeroPixel),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                    child: Image.asset(
                      achievements[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/locked.png',
                scale: 8,
              ),
              Padding(
                padding: EdgeInsets.all(UPdMg_8),
                child: TitleTheme(text: 'Locked'),
              ),
            ],
          ),

          // * Lock body
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: UPdMg_10,
            crossAxisSpacing: UPdMg_10,
            childAspectRatio: 1.90,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              achievements.length,
              (index) => Container(
                child: Card(
                  shadowColor: Colors.grey[200],
                  color: UGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                  ),
                  margin: EdgeInsets.all(UZeroPixel),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                    child: Image.asset(
                      achievements[index].image,
                      fit: BoxFit.cover,
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
