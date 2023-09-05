import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Schedule/Class_Schedule.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Card_carlendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  final List<StudentUser> data_studentUser;
  Schedule({
    required this.data_studentUser,
  });

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  bool isLoading = false;
  List<ScheduleClass> _dataSchedule = [];
  List<ScheduleClass> selectedDateSchedule = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(Get.locale?.languageCode == 'km'
            ? 'http://192.168.3.87/usea/api/apidata.php?action=study_schedule'
            : 'http://192.168.3.87/usea/api/student_schedule_en.php?action=login_student'),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (mounted) {
          setState(() {
            _dataSchedule = List<ScheduleClass>.from(
              data['schedule_data'].map(
                (data) => ScheduleClass.fromJson(data),
              ),
            );
            String selectedMonth = DateFormat('MMMM').format(selectedDate);

            selectedDateSchedule = _dataSchedule.where((schedule) {
              return schedule.wday == DateFormat('dd').format(selectedDate) &&
                  schedule.month == selectedMonth;
            }).toList();

            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print('Error: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _onDateSelected(DateTime day) {
    setState(() {
      selectedDate = day;
    });

    String selectedMonth = DateFormat('MMMM').format(selectedDate);
    selectedDateSchedule = _dataSchedule.where((schedule) {
      return schedule.wday == DateFormat('dd').format(selectedDate) &&
          schedule.month == selectedMonth;
    }).toList();

    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'កាលវិភាគ'.tr),
      body: _dataSchedule.isEmpty
          ? FutureBuilder(
              future: Future.delayed(Duration(seconds: 10)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: UPrimaryColor,
                    ),
                  );
                } else {
                  return Center(child: Text('គ្មានទិន្ន័យ'.tr));
                }
              },
            )
          : RefreshIndicator(
              onRefresh: _refreshData,
              color: UPrimaryColor,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: UPdMg_10),
                children: [
                  CardCalendar(onDateSelected: _onDateSelected),
                  SizedBox(
                    height: UHeight5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(UPdMg_8),
                    child: Text(
                      'កាលវិភាគសិក្សា'.tr,
                      style: TextStyle(
                        fontSize: UTitleSize16,
                        color: UPrimaryColor,
                      ),
                    ),
                  ),
                  selectedDateSchedule.isEmpty
                      ? FutureBuilder(
                          future: Future.delayed(Duration(seconds: 3)),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Center(child: Text('គ្មានទិន្ន័យ'.tr));
                            }
                          },
                        )
                      : ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: selectedDateSchedule.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      UPdMg_5, UZeroPixel, UPdMg_5, UPdMg_5),
                                  child: Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(UPdMg_10)),
                                    child: Container(
                                      padding: EdgeInsets.all(UPdMg_10),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 40,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ScheduleDate(
                                                    selectedDateSchedule[index]
                                                        .wday,
                                                  ),
                                                  ScheduleDate(
                                                    selectedDateSchedule[index]
                                                        .weekday,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            VerticalDivider(
                                              thickness: 0.5,
                                              color: UGreyColor,
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ScheduleTitle(
                                                    selectedDateSchedule[index]
                                                        .subject,
                                                  ),
                                                  SizedBox(
                                                    height: UHeight5,
                                                  ),
                                                  ScheduleBody(
                                                    selectedDateSchedule[index]
                                                        .session,
                                                  ),
                                                  ScheduleBody(
                                                    selectedDateSchedule[index]
                                                        .room,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: ScheduleBody(
                                                          selectedDateSchedule[
                                                                  index]
                                                              .teacher,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: ScheduleBody(
                                                            selectedDateSchedule[
                                                                    index]
                                                                .phonenumber,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ],
              ),
            ),
    );
  }
}
