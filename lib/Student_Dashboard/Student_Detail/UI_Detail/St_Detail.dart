import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usea_app/Custom_AppBar.dart';

import '../../../Guest_Dashboard/Guest_Account/UI_Account/Guest_Acc.dart';
import '../../../Home.dart';
import '../Class_Detail/Class_St_Detail1.dart';

class Student_Detail extends StatefulWidget {
  final List<StDetail> dataDetail;

  const Student_Detail({Key? key, required this.dataDetail}) : super(key: key);

  @override
  State<Student_Detail> createState() => _Student_DetailState();
}

class _Student_DetailState extends State<Student_Detail> {
  String getImage(String image) {
    return 'http://192.168.3.34/hosting_api/Student/profile_pic/$image';
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 3,
          child: Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ចាកចេញ'.tr,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីសិស្សដែរឬទេ?'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'KhmerOSbattambang',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'បោះបង់',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'KhmerOSbattambang',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        VerticalDivider(
                            // thickness: 1,
                            ),
                        TextButton(
                          child: Text(
                            'ចាកចេញ',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'KhmerOSbattambang',
                            ),
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.clear();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Home(),
                              ),
                            );
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'ព័ត៌មានលម្អិតរបស់និស្សិត'.tr,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontFamily: 'KhmerOSbattambang',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
              size: 18,
            ),
            onPressed: () {
              // Perform logout action here
              _logout();
            },
          ),
        ],
      ),
      body: widget.dataDetail.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.dataDetail.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                getImage(widget.dataDetail[index].profile_pic)),
                            radius: 50,
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
                                height: 25,
                                alignment: Alignment.center,
                                child: Text(
                                  widget.dataDetail[index].name_kh,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .copyWith()
                                          .primaryColor,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                child: Text(
                                  widget.dataDetail[index].name_en,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .copyWith()
                                          .primaryColor,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                child: Text(
                                  widget.dataDetail[index].student_id,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .copyWith()
                                          .primaryColor,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
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
                                  color: Theme.of(context)
                                      .copyWith()
                                      .primaryColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.dataDetail[index].year_name,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
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
                                  color: Theme.of(context)
                                      .copyWith()
                                      .primaryColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.dataDetail[index].semester_name,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
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
                                  color: Theme.of(context)
                                      .copyWith()
                                      .primaryColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.dataDetail[index].stage_name,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
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
                                  color: Theme.of(context)
                                      .copyWith()
                                      .primaryColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.dataDetail[index].term_name,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
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
                                  color: Theme.of(context)
                                      .copyWith()
                                      .primaryColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.dataDetail[index].academic_year,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].faculty_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].degree_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].major_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].room_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].shift_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].status_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].date_of_birth,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].phone_number,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].job,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                                        color: Theme.of(context)
                                            .copyWith()
                                            .primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang'),
                                  ),
                                  Text(
                                    widget.dataDetail[index].work_place,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang'),
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
                );
              }),
    );
  }
}
