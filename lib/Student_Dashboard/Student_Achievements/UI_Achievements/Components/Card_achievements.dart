import 'package:flutter/material.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';

import '../Data/Data_achievements.dart';

class CardAchievements extends StatelessWidget {
  const CardAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/unlocked.png',
              width: 16,
              height: 18,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleTheme(
                text: 'Unlocked',
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            primary: false,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              achievements.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(achievements[index].image),
                      SizedBox(
                        width: 100,
                        child: NormalTitleCenterTheme(
                          text: achievements[index].semesterTitle,
                        ),
                      )
                    ],
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
              width: 16,
              height: 18,
              fit: BoxFit.fill,
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
          childAspectRatio: 1.50,
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            achievements.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(achievements[index].image),
                      SizedBox(
                        width: 100,
                        child: Text(
                          achievements[index].semesterTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'KhmerOSbattambang',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
