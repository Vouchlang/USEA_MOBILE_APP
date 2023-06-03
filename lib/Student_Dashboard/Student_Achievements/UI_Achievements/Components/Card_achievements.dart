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
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/unlocked.png',
                scale: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleTheme(
                  text: 'Unlocked',
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.90,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              achievements.length,
              (index) => Container(
                child: Card(
                  shadowColor: Colors.grey[200],
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      achievements[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/locked.png',
                scale: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleTheme(
                  text: 'Locked',
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.90,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              achievements.length,
              (index) => Container(
                child: Card(
                  shadowColor: Colors.grey[200],
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
