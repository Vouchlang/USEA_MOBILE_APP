import 'package:flutter/material.dart';
import '../../Guest_ChangeLanguage/Change_Language.dart';
import '/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';
import '../../Guest_AboutUS/UI_AboutUS/AboutUS.dart';
import '../../Guest_Career/UI_Career/Career.dart';
import '../../Guest_Contact/UI_Contact/Contact.dart';
import '../../Guest_FAQ/UI_FAQ/FAQ.dart';
import '../../Guest_Registration/UI_Registration/Registration.dart';
import '../../Guest_Scholarship/UI_Scholarship/Scholarship.dart';
import '../../Guest_VDO/UI_VDO/Test_API/api_main.dart';
import '../../Guest_VDO/UI_VDO/Video.dart';
import '/Student_Dashboard/Student_Achievements/UI_Achievements/Achievements.dart';
import '/Student_Dashboard/Student_Attendance/UI_Attendance/Attendance.dart';
import '/Student_Dashboard/Student_Payment/UI_Payment/Payment.dart';
import '/Student_Dashboard/Student_Performance/UI_Perfomance/Performance.dart';
import '/Student_Dashboard/Student_Schedule/UI_Schedule/Schedule.dart';
import '/Student_Dashboard/Student_StudyInfo/UI_StudyInfo/StudyInfo.dart';

class Home_Screen {
  late final String name, img;
  late final Widget screen;

  Home_Screen({required this.name, required this.img, required this.screen});
}

List<Home_Screen> guest_home_screen = [
  Home_Screen(
    name: 'ព្រឹត្តិការណ៍',
    img: 'assets/image/Guest_News.png',
    screen: New_Event(),
  ),
  Home_Screen(
    name: 'ការចុះឈ្មោះ',
    img: 'assets/image/Guest_Regis.png',
    screen: Registration(),
  ),
  Home_Screen(
    name: 'កម្មវិធីសិក្សា',
    img: 'assets/image/Guest_Program.png',
    screen: FacultyList(),
  ),
  Home_Screen(
    name: 'អាហារូបករណ៍',
    img: 'assets/image/Guest_Scholarship.png',
    screen: Scholarship(),
  ),
  Home_Screen(
    name: 'ព័ត៌មានការងារ',
    img: 'assets/image/Guest_Career.png',
    screen: Career(),
  ),
  Home_Screen(
    name: 'វីដេអូ',
    img: 'assets/image/Guest_VDO.png',
    screen: Video_UI(),
  ),
  Home_Screen(
    name: 'ទំនាក់ទំនង',
    img: 'assets/image/Guest_Contact.png',
    screen: Contact(),
  ),
  Home_Screen(
    name: 'អំពីយើង',
    img: 'assets/image/Guest_About.png',
    screen: AboutUS(),
  ),
  Home_Screen(
    name: 'ផ្លាស់ប្ដូរភាសា',
    img: 'assets/image/Guest_Language.png',
    screen: Change_Language(),
  ),
  Home_Screen(
    name: 'FAQ',
    img: 'assets/image/Guest_QA.png',
    screen: FAQ(),
  ),
];

List<Home_Screen> st_home_screen = [
  Home_Screen(
    name: 'កាលវិភាគ',
    img: 'assets/image/Stu_Schedule.png',
    screen: Schedule(),
  ),
  Home_Screen(
    name: 'ដំណើរការសិក្សា',
    img: 'assets/image/Stu_Performance.png',
    screen: Performance(),
  ),
  Home_Screen(
    name: 'វត្តមាន',
    img: 'assets/image/Stu_Att.png',
    screen: Attendance(),
  ),
  Home_Screen(
    name: 'ការបង់ប្រាក់',
    img: 'assets/image/Stu_Payment.png',
    screen: Payment(),
  ),
  Home_Screen(
    name: 'ប្រវត្តិការងារ',
    img: 'assets/image/Stu_Job_History.png',
    screen: InkWell(
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'ព័ត៌មានការសិក្សា',
    img: 'assets/image/Stu_Study_Info.png',
    screen: Study_Info(),
  ),
  Home_Screen(
    name: 'មតិកែលម្អ',
    img: 'assets/image/Stu_Survey.png',
    screen: InkWell(
      onTap: () {},
    ),
  ),
  Home_Screen(
    name: 'សម្មិទ្ធផល',
    img: 'assets/image/Stu_Achievement.png',
    screen: Achievements(),
  ),
];
