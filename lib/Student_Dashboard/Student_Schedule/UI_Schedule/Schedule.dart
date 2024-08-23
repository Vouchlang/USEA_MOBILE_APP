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
  final String sourceScreen;

  Schedule({
    required this.data_studentUser,
    required this.sourceScreen,
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
    _onDateSelected(selectedDate);
  }

  Future<void> _onDateSelected(DateTime day) async {
    setState(() {
      selectedDate = day;
    });

    int selectedYear = selectedDate.year;
    String selectedMonth = DateFormat('MMMM').format(selectedDate);
    int selectedDay = selectedDate.day;

    selectedDateSchedule = _dataSchedule.where((schedule) {
      return schedule.wday == DateFormat('dd').format(selectedDate) &&
          schedule.month == selectedMonth;
    }).toList();

    await _sendDateToDatabase(selectedYear, selectedMonth, selectedDay);
  }

  Future<void> _sendDateToDatabase(int year, String month, int day) async {
    try {
      var response = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlStudent + 'action=study_schedule'
              : APIUrlStudentEn + 'action=study_schedule',
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen
              ? widget.data_studentUser[0].guardian_id
              : 'N/A',
          'date': '$day-$month-$year',
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
      print('Failed to fetch schedule: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'កាលវិភាគ'.tr,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _sendDateToDatabase(
            selectedDate.year,
            DateFormat('MMMM').format(selectedDate),
            selectedDate.day,
          );
        },
        color: UPrimaryColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: UPdMg10,
          ),
          children: [
            CardCalendar(
              onDateSelected: _onDateSelected,
            ),
            buildHeight5(),
            Padding(
              padding: const EdgeInsets.all(
                UPdMg8,
              ),
              child: Text(
                'កាលវិភាគសិក្សា'.tr,
                style: const TextStyle(
                  fontSize: UTitleSize16,
                  fontWeight: UTitleWeight,
                  color: UPrimaryColor,
                ),
              ),
            ),
            selectedDateSchedule.isEmpty
                ? buildFutureBuild()
                : ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: selectedDateSchedule.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 1,
                            color: UBackgroundColor,
                            shadowColor: ULightGreyColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                UPdMg10,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(
                              UPdMg10,
                              UPdMg5,
                              UPdMg10,
                              UPdMg10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: UPdMg15,
                                    horizontal: UPdMg10,
                                  ),
                                  width: UFullWidth,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        URoundedLarge,
                                      ),
                                      topRight: Radius.circular(
                                        URoundedLarge,
                                      ),
                                    ),
                                    color: UBGLightBlue,
                                  ),
                                  child: ScheduleTitle(
                                    selectedDateSchedule[index].subject,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                    UPdMg10,
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: UWidth40,
                                          child: IntrinsicHeight(
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
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                ScheduleDate(
                                                  selectedDateSchedule[index]
                                                      .weekday,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          thickness: 0.5,
                                          color: UGreyColor,
                                          width: UWidth30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ScheduleBody(
                                                selectedDateSchedule[index]
                                                    .session,
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              ScheduleBody(
                                                selectedDateSchedule[index]
                                                    .room,
                                              ),
                                              const SizedBox(
                                                height: 2,
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
                                                      alignment:
                                                          Alignment.topRight,
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
                              ],
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
