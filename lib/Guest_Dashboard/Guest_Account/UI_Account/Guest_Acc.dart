import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Student_Dashboard/Student_Home/UI_Home/St_Home.dart';
import '../../../Student_Dashboard/Student_LogIn/Student_LogIn.dart';
import '../../../Student_Dashboard/Student_LogIn/testing_log.dart';
import '../../../Student_Dashboard/Student_LogIn/testing_log_detail.dart';
import '../../../Student_Dashboard/Student_LogIn/testing_log_detail_copy.dart';
import '/Guest_Dashboard/Guest_Account/Class_Account/Class_Account_Screen.dart';
import '/Guest_Dashboard/Guest_New_Event/UI_News_Event/News_Event.dart';

class Guest_Acc extends StatefulWidget {
  const Guest_Acc({Key? key}) : super(key: key);

  @override
  State<Guest_Acc> createState() => Guest_AccState();
}

class Guest_AccState extends State<Guest_Acc> {
  static const String KEYLOGIN = 'login';
  var studentLogIn = Student_LogIn();
  final List<Account_Screen> account_screen = [
    Account_Screen(
      name: 'គណនីនិស្សិត',
      img: 'assets/image/Acc_Student.png',
      screen: Student_LogIn(),
    ),
    Account_Screen(
        name: 'គណនីអាណាព្យាបាល',
        img: 'assets/image/Acc_Guardian.png',
        screen: LoginPage1()),
    Account_Screen(
        name: 'គណនីបុគ្គលិក',
        img: 'assets/image/Acc_Staff.png',
        screen: New_Event()),
    Account_Screen(
        name: 'គណនីសាស្ត្រាចារ្យ',
        img: 'assets/image/Acc_Lecturer.png',
        screen: New_Event()),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sharePref();
  }

  void sharePref() async {
    var sharePref = await SharedPreferences.getInstance();
    var isLoggedIn = sharePref.getBool(KEYLOGIN);

    if (isLoggedIn != null) {
      if (isLoggedIn) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => St_Home(
                      data: Student_LogIn,
                      data_jobhistory: [], data_stdetail: [],
                    )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Student_LogIn()));
      }
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Student_LogIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
            height: 600,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/usea_bg.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 270,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.95,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                  children: List.generate(
                      account_screen.length,
                      (index) => Card(
                            elevation: 3,
                            color: Colors.white,
                            shadowColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () {
                                // if (index.isEqual(0)) {
                                //   sharePref();
                                // } else {
                                //   Navigator.push(context, MaterialPageRoute(
                                //       builder: (BuildContext context) {
                                //     return account_screen[index].screen;
                                //   }));
                                // }
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return account_screen[index].screen;
                                }));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      account_screen[index].img,
                                      scale: 7,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      account_screen[index].name.tr,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'KhmerOSbattambang'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ],
            )),
      ],
    ));
  }
}
