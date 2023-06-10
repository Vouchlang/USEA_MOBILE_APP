import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/theme_builder.dart';
import '/Custom_Widget/CustomText.dart';
import '/Home.dart';
import '../Class_Detail/Class_St_Detail.dart';

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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10,
          )),
          child: Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: UBackgroundColor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ចាកចេញ'.tr,
                  style: TextStyle(
                    fontSize: UTitleSize,
                    fontWeight: UTitleWeight,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'តើអ្នកប្រាកដថាអ្នកនឹងចាកចេញពីគណនីនិសិ្សតដែរឬទេ?'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: UBodySize,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'បោះបង់'.tr,
                            style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: UBodySize,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        buildVerticalDividerAtt(),
                        TextButton(
                          child: Text(
                            'ចាកចេញ'.tr,
                            style: TextStyle(
                              color: URedColor,
                              fontSize: UBodySize,
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
                    ),
                  ),
                ),
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
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'ព័ត៌មានលម្អិតរបស់និស្សិត'.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: 18,
            fontWeight: UTitleWeight,
          ),
        ),
        backgroundColor: UBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: UPrimaryColor,
              size: 18,
            ),
            onPressed: () {
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
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              getImage(
                                widget.dataDetail[index].profile_pic,
                              ),
                            ),
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
                              buildHeaderDetail(
                                  widget.dataDetail[index].name_kh,
                                  UKFontFamily,
                                  UTitleSize16,
                                  UTitleWeight),
                              buildHeaderDetail(
                                  widget.dataDetail[index].name_en,
                                  UEFontFamily,
                                  UTitleSize16,
                                  UBodyWeight),
                              buildHeaderDetail(
                                  widget.dataDetail[index].student_id,
                                  UEFontFamily,
                                  UBodySize,
                                  UBodyWeight),
                            ],
                          )
                        ],
                      ),
                    ),
                    buildDividerStDetail(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildBodyDetail(
                            'ឆ្នាំ', widget.dataDetail[index].year_name),
                        buildVerticalDividerH_45(),
                        buildBodyDetail(
                            'ឆមាស', widget.dataDetail[index].semester_name),
                        buildVerticalDividerH_45(),
                        buildBodyDetail(
                            'ជំនាន់', widget.dataDetail[index].stage_name),
                        buildVerticalDividerH_45(),
                        buildBodyDetail(
                            'វគ្គ', widget.dataDetail[index].term_name),
                        buildVerticalDividerH_45(),
                        buildBodyDetail('ឆ្នាំមូលដ្ឋាន',
                            widget.dataDetail[index].academic_year),
                      ],
                    ),
                    buildDividerStDetail(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Flexible(
                        child: Column(
                          children: [
                            buildTailDetail(
                                'assets/image/Stu_Faculty.png',
                                'មហាវិទ្យាល័យ'.tr,
                                widget.dataDetail[index].faculty_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Degree.png',
                                'កម្រិតសិក្សា'.tr,
                                widget.dataDetail[index].degree_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Major.png',
                                'មុខជំនាញ'.tr,
                                widget.dataDetail[index].major_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Room.png',
                                'បន្ទប់សិក្សា'.tr,
                                widget.dataDetail[index].room_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Shift.png',
                                'វេនសិក្សា'.tr,
                                widget.dataDetail[index].shift_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Status.png',
                                'ស្ថានភាពសិក្សា'.tr,
                                widget.dataDetail[index].status_name),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_DOB.png',
                                'ថ្ងៃកំណើត'.tr,
                                widget.dataDetail[index].date_of_birth),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Tel.png',
                                'លេខទូរស័ព្ទ'.tr,
                                widget.dataDetail[index].phone_number),
                            buildDividerStDetail(),
                            buildTailDetail('assets/image/Stu_Job.png',
                                'មុខតំណែង'.tr, widget.dataDetail[index].job),
                            buildDividerStDetail(),
                            buildTailDetail(
                                'assets/image/Stu_Workplace.png',
                                'ស្ថាប័ន'.tr,
                                widget.dataDetail[index].work_place),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
