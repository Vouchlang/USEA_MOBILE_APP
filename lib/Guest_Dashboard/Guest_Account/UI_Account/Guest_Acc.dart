import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../Guardian_Dashboard/Guardian_Home/UI_Home/Guardian_Home.dart';
import '../../../Guardian_Dashboard/Guardian_Other_Class/Class_Guardian_User.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: UPrimaryColor,
      ),
    );
  }

  // Navigate to Screen
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

  // Save student user
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

  // Navigate to home screen
  void navigateToSt_HomeScreen(
    List<StudentUser> studentUser,
  ) {
    Get.off(
      () => St_Home(
        data_studentUser: studentUser,
        sourceScreen: st_sourceScreen,
      ),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
  }

  // Save Guadian user
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

  // Navigate to Guardian Screen
  void navigateToGuardian_HomeScreen(
    List<GuardianUser> guardianUser,
  ) {
    Get.off(
      () => Guardian_Home(
        data_guardianUser: guardianUser,
      ),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: USecondaryColor,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.75,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: UPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    25,
                  ),
                  bottomRight: Radius.circular(
                    25,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAsset + 'new_usea_logo.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  buildHeight15(),
                  const Text(
                    'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                    style: TextStyle(
                      fontSize: UTitleSize,
                      fontFamily: 'KhmerOSmuol',
                      color: UBackgroundColor,
                    ),
                  ),
                  const Text(
                    'UNIVERSITY OF SOUTH-EAST ASIA',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: UBackgroundColor,
                      fontWeight: UBodyWeight,
                      fontFamily: UEFontFamily,
                      wordSpacing: 2.2,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0,
              right: 0,
              child: GridView.count(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 3.5,
                crossAxisSpacing: 3,
                childAspectRatio: 1.90,
                padding: const EdgeInsets.symmetric(
                  horizontal: UPdMg7,
                ),
                children: List.generate(
                  account_screen.length,
                  (index) => Card(
                    elevation: 1.5,
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
                          duration: const Duration(
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
                          buildHeight7(),
                          Text(
                            account_screen[index].name.tr,
                            style: const TextStyle(
                              fontSize: UTitleSize,
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
        ),
      ),
    );
  }
}
