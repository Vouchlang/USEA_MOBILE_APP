import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';
import 'Components/Card_achievements.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'សម្មិទ្ធផល'.tr),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Column(children: [CardAchievements()]),
        ],
      ),
    );
  }
}
