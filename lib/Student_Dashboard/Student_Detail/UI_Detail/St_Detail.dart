import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

import '../Class_Detail/Class_St_Detail2.dart';

class Student_Detail extends StatelessWidget {
  final dynamic dataDetail;
  const Student_Detail({super.key, required this.dataDetail});

  String getImage(String image) {
    return 'http://192.168.3.34/hosting_api/Student/profile_pic/$image';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព័ត៌មានលម្អិតរបស់និស្សិត'.tr),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(getImage(dataDetail[0]['profile_pic'])),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          dataDetail[0]['name_kh'],
                          style: TextStyle(
                              color: Theme.of(context).copyWith().primaryColor,
                              fontFamily: 'KhmerOSbattambang',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          dataDetail[0]['name_en'],
                          style: TextStyle(
                              color: Theme.of(context).copyWith().primaryColor,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        child: Text(
                          dataDetail[0]['student_id'],
                          style: TextStyle(
                              color: Theme.of(context).copyWith().primaryColor,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ឆ្នាំ',
                      style: TextStyle(
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 12,
                          color: Theme.of(context).copyWith().primaryColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dataDetail[0]['year_name'],
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[300],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ឆមាស',
                      style: TextStyle(
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 12,
                          color: Theme.of(context).copyWith().primaryColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dataDetail[0]['semester_name'],
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[300],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ជំនាន់',
                      style: TextStyle(
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 12,
                          color: Theme.of(context).copyWith().primaryColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dataDetail[0]['stage_name'],
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[300],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'វគ្គ',
                      style: TextStyle(
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 12,
                          color: Theme.of(context).copyWith().primaryColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dataDetail[0]['term_name'],
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[300],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ឆ្នាំមូលដ្ឋាន',
                      style: TextStyle(
                          fontFamily: 'KhmerOSbattambang',
                          fontSize: 12,
                          color: Theme.of(context).copyWith().primaryColor),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dataDetail[0]['academic_year'],
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
