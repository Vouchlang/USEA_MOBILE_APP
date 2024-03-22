import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';
import 'package:usea_app/Guardian_Dashboard/Guardian_Home/UI_Home/Guardian_Home.dart';
import 'package:usea_app/Guardian_Dashboard/Guardian_Other_Class/Class_Guardian_User.dart';
import '../../../Student_Dashboard/Student_Other_Class/Class_Student_User.dart';
import '/Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import '/theme_builder.dart';
import '../Class_Account/Class_Account_Screen.dart';

class Guest_Acc extends StatefulWidget {
  const Guest_Acc({Key? key}) : super(key: key);

  @override
  State<Guest_Acc> createState() => Guest_AccState();
}

class Guest_AccState extends State<Guest_Acc> {
  static const String KEYLOGIN = 'login';
  static const String KEYSTUDENT_USER = 'student_user';
  static const String KEYGUARDIAN_USER = 'guardian_user';

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLoggedIn = sharePref.getBool(KEYLOGIN);

    if (isLoggedIn != null && isLoggedIn) {
      List<StudentUser> dataStudentUser = getSavedStudentUser(sharePref);
      if (dataStudentUser.isNotEmpty) {
        navigateToSt_HomeScreen(dataStudentUser);
        return; // Make sure to return to avoid executing the code below
      }
    }

    // If not a student, check for a guardian user
    List<GuardianUser> dataGuardianUser = getSavedGuardianUser(sharePref);
    if (dataGuardianUser.isNotEmpty) {
      navigateToGuardian_HomeScreen(dataGuardianUser);
    }
  }

  List<StudentUser> getSavedStudentUser(SharedPreferences sharedPreferences) {
    final studentUserString = sharedPreferences.getString(KEYSTUDENT_USER);
    if (studentUserString != null) {
      final jsonData = json.decode(studentUserString);
      List<StudentUser> studentUserList = [];
      for (var item in jsonData) {
        StudentUser studentUser = StudentUser.fromJson(item);
        studentUserList.add(studentUser);
      }
      return studentUserList;
    } else {
      return [];
    }
  }

  void navigateToSt_HomeScreen(
    List<StudentUser> studentUser,
  ) {
    Get.off(
      () => St_Home(
        data_studentUser: studentUser,
        sourceScreen: st_sourceScreen,
      ),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(
        milliseconds: 100,
      ),
    );
  }

  List<GuardianUser> getSavedGuardianUser(SharedPreferences sharedPreferences) {
    final guardianUserString = sharedPreferences.getString(KEYGUARDIAN_USER);
    if (guardianUserString != null) {
      final jsonData = json.decode(guardianUserString);
      List<GuardianUser> guardianUserList = [];
      for (var item in jsonData) {
        GuardianUser guardianUser = GuardianUser.fromJson(item);
        guardianUserList.add(guardianUser);
      }
      return guardianUserList;
    } else {
      return [];
    }
  }

  void navigateToGuardian_HomeScreen(
    List<GuardianUser> guardianUser,
  ) {
    Get.off(
      () => Guardian_Home(
        data_guardianUser: guardianUser,
      ),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(
        milliseconds: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: USecondaryColor,
              image: DecorationImage(
                image: AssetImage(
                  'assets/image/guess_acc.png',
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 3.5,
            crossAxisSpacing: 3,
            childAspectRatio: 1.90,
            padding: EdgeInsets.symmetric(
              horizontal: UPdMg7,
            ),
            children: List.generate(
              account_screen.length,
              (index) => Card(
                elevation: 2,
                color: UBackgroundColor,
                shadowColor: ULightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    URoundedLarge,
                  ),
                ),
                child: InkWell(
                  highlightColor: UTransParentColor,
                  splashColor: UTransParentColor,
                  onTap: () {
                    Get.to(
                      () => account_screen[index].screen,
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        account_screen[index].img,
                        scale: UScale6,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        account_screen[index].name.tr,
                        style: TextStyle(
                          fontSize: UTitleSize,
                        ),
                      )
                    ],
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
