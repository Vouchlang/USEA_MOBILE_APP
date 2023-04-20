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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Flexible(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Faculty.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'មហាវិទ្យាល័យ',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['faculty_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Degree.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'កម្រិតសិក្សា',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['degree_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Major.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'មុខជំនាញ',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['major_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Room.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'បន្ទប់សិក្សា',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['room_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Shift.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'វេនសិក្សា',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['shift_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Status.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ស្ថានភាពសិក្សា',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['status_name'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_DOB.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ថ្ងៃកំណើត',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['date_of_birth'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Tel.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'លេខទូរស័ព្ទ',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['phone_number'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Job.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'មុខតំណែង',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['job'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/Stu_Workplace.png',
                        scale: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ស្ថាប័ន',
                            style: TextStyle(
                                color:
                                    Theme.of(context).copyWith().primaryColor,
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang'),
                          ),
                          Text(
                            dataDetail[0]['work_place'],
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
