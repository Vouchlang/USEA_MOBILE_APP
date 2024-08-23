import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../../Guest_ChangeLanguage/Change_Language.dart';
import '../../Guest_New_Event/UI_News_Event/News_Event.dart';
import '../../Guest_Program/UI_Program/Program.dart';
import '../../Guest_Scholarship/UI_Scholarship/Scholarship.dart';
import '../../Guest_AboutUS/UI_AboutUS/AboutUS.dart';
import '../../Guest_Career/UI_Career/Career.dart';
import '../../Guest_Contact/UI_Contact/Contact.dart';
import '../../Guest_FAQ/UI_FAQ/FAQ.dart';
import '../../Guest_Registration/UI_Registration/Registration.dart';
import '../../Guest_VDO/UI_VDO/Video.dart';

class Home_Screen {
  late final String name, img;
  late final Widget screen;

  Home_Screen({
    required this.name,
    required this.img,
    required this.screen,
  });
}

List<Home_Screen> guest_home_screen = [
  Home_Screen(
    name: 'ព្រឹត្តិការណ៍',
    img: imageAsset + 'Guest_News.png',
    screen: const News_Event(),
  ),
  Home_Screen(
    name: 'ការចុះឈ្មោះ',
    img: imageAsset + 'Guest_Regis.png',
    screen: Registration(),
  ),
  Home_Screen(
    name: 'កម្មវិធីសិក្សា',
    img: imageAsset + 'Guest_Program.png',
    screen: Program(),
  ),
  Home_Screen(
    name: 'អាហារូបករណ៍',
    img: imageAsset + 'Guest_Scholarship.png',
    screen: const Scholarship(),
  ),
  Home_Screen(
    name: 'មជ្ឈមណ្ឌលការងារ',
    img: imageAsset + 'Guest_Career.png',
    screen: const Career(),
  ),
  Home_Screen(
    name: 'វីដេអូ',
    img: imageAsset + 'Guest_VDO.png',
    screen: Video_UI(),
  ),
  Home_Screen(
    name: 'ទំនាក់ទំនង',
    img: imageAsset + 'Guest_Contact.png',
    screen: const Contact(),
  ),
  Home_Screen(
    name: 'FAQ',
    img: imageAsset + 'Guest_QA.png',
    screen: const FAQ(),
  ),
  Home_Screen(
    name: 'ផ្លាស់ប្ដូរភាសា',
    img: imageAsset + 'Guest_Language.png',
    screen: Change_Language(),
  ),
  Home_Screen(
    name: 'អំពីយើង',
    img: imageAsset + 'Guest_About.png',
    screen: const AboutUS(),
  ),
];

List<Home_Screen> st_home_screen = [
  Home_Screen(
    name: 'កាលវិភាគ',
    img: imageAsset + 'Stu_Schedule.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ដំណើរការសិក្សា',
    img: imageAsset + 'Stu_Performance.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'វត្តមាន',
    img: imageAsset + 'Stu_Att.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ការបង់ប្រាក់',
    img: imageAsset + 'Stu_Payment.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ប្រវត្តិការងារ',
    img: imageAsset + 'Stu_Job_History.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ព័ត៌មានការសិក្សា',
    img: imageAsset + 'Stu_Study_Info.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'មតិកែលម្អ',
    img: imageAsset + 'Stu_Survey.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'សមិទ្ធិផល',
    img: imageAsset + 'Stu_Achievement.png',
    screen: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: () {},
    ),
  ),
];
