import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

class Grid_Home_Screen {
  late final String name, img;
  late final Widget screen;

  Grid_Home_Screen({
    required this.name,
    required this.img,
    required this.screen,
  });
}

List<Grid_Home_Screen> guardian_Grid_Home_Screen = [
  Grid_Home_Screen(
    name: 'មតិកែលម្អ',
    img: imageAsset + 'Stu_Survey.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
];
