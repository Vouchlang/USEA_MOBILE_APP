import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

      if (isLoggedIn) {
        navigateToSt_HomeScreen(dataStudentUser);
      }
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
                image: AssetImage('assets/image/guess_acc.png'),
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
            padding: EdgeInsets.symmetric(horizontal: 7),
            children: List.generate(
              account_screen.length,
              (index) => Card(
                elevation: 2,
                color: UBackgroundColor,
                shadowColor: ULightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(URoundedLarge),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => account_screen[index].screen);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        account_screen[index].img,
                        scale: 6,
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
