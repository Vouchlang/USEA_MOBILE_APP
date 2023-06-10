import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Home/Class_Home/Class_Home_Screen.dart';
import 'package:usea_app/Student_Dashboard/Student_Detail/UI_Detail/St_Detail.dart';
import 'package:usea_app/Student_Dashboard/Student_JobHistory/UI_JobHistory/St_JobHistory.dart';
import 'package:usea_app/theme_builder.dart';

import '../../Student_Detail/Class_Detail/Class_St_Detail.dart';
import '../../Student_JobHistory/Class_JobHistory/Class_Job_History.dart';

class Student_Home extends StatefulWidget {
  final dynamic dataDetail;
  final List<JobHistory> data_jobhistory;
  final List<StDetail> data_stdetail;
  Student_Home(
      {Key? key,
      required this.dataDetail,
      required this.data_jobhistory,
      required this.data_stdetail})
      : super(key: key);

  @override
  State<Student_Home> createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home> {
  int activeIndex = 0;

  final Uri urlFb = Uri.parse("https://www.facebook.com/usea.edu.kh");

  String getImage(String image) {
    return 'http://192.168.3.34/hosting_api/Student/profile_pic/$image';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/image/usea_logo.png',
                    scale: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                          style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: 11,
                              fontFamily: 'KhmerOSmuol'),
                        ),
                        Text(
                          'UNIVERSITY OF SOUTH-EAST ASIA',
                          style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: 13,
                              fontFamily: UEFontFamily,
                              fontWeight: UBodyWeight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Student_Detail(
                      dataDetail: widget.data_stdetail,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  getImage(widget.data_stdetail[0].profile_pic),
                ),
                radius: 25,
              ),
            ),
          ],
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: UBackgroundColor,
        elevation: 1,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 175,
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: DChartPie(
                    data: [
                      {'domain': 'Flutter', 'measure': 58},
                      {'domain': 'React Native', 'measure': 20},
                      {'domain': 'React JS', 'measure': 22},
                    ],
                    fillColor: (pieData, index) => UPrimaryColor,
                    donutWidth: 30,
                    labelColor: UBackgroundColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: UOrangeColor,
                          ),
                          Text('ចំនួនក្រឌីតសរុប'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: UPrimaryColor,
                          ),
                          Text('ចំនួនក្រឌីតបានបំពេញ'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 3.5,
              crossAxisSpacing: 3,
              childAspectRatio: 1.90,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
              children: List.generate(
                st_home_screen.length,
                (index) => Card(
                  elevation: 2,
                  shadowColor: ULightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (index.isEqual(6)) {
                        launchUrl(urlFb);
                      } else if (index.isEqual(4)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Job_History(
                                data_jobhistory: widget.data_jobhistory),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  st_home_screen[index].screen),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            st_home_screen[index].img,
                            scale: 6,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            st_home_screen[index].name.tr,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
