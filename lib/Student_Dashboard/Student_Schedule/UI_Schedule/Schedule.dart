import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../Users_API.dart';
import '../../Student_Other_Class/Class_Student_User.dart';
import '../Class_Schedule/Class_Schedule.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Card_carlendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'Custom_Build_Schedule.dart';

class Schedule extends StatefulWidget {
  late final List<StudentUser> data_studentUser;
  late final String sourceScreen;

  Schedule({
    required this.data_studentUser,
    required this.sourceScreen,
  });

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late final DateTime today = DateTime.now();
  late DateTime selectedDate = DateTime.now();
  late bool isLoading = false;
  late List<ScheduleClass> _dataSchedule = [];
  late List<ScheduleClass> selectedDateSchedule = [];

  @override
  void initState() {
    super.initState();
    _onDateSelected(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'កាលវិភាគ'.tr),
      body: RefreshIndicator(
        backgroundColor: UBackgroundColor,
        onRefresh: () async {
          await _sendDateToDatabase(
            selectedDate.year,
            DateFormat('MMMM').format(selectedDate),
            selectedDate.day,
          );
        },
        color: UPrimaryColor,
        child: buildListSchedule(),
      ),
    );
  }

  Widget buildListSchedule() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: UPdMg10),
      children: [
        CardCalendar(onDateSelected: _onDateSelected),
        buildHeight5(),
        Padding(
          padding: const EdgeInsets.all(UPdMg8),
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
            ? buildFutureBuilder()
            : ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedDateSchedule.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.5,
                    shadowColor: ULightGreyColor,
                    color: UBackgroundColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: UBackgroundColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(UPdMg10),
                    ),
                    margin: const EdgeInsets.fromLTRB(
                      UPdMg10,
                      UPdMg5,
                      UPdMg10,
                      UPdMg10,
                    ),
                    child: Column(
                      children: [
                        buildCardSubjectName(selectedDateSchedule[index].subject),
                        buildCardInfo(
                          wday: selectedDateSchedule[index].wday,
                          weekday: selectedDateSchedule[index].weekday,
                          session: selectedDateSchedule[index].session,
                          room: selectedDateSchedule[index].room,
                          teacher: selectedDateSchedule[index].teacher,
                          phoneNumber: selectedDateSchedule[index].phonenumber,
                        )
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }

  Future<void> _onDateSelected(DateTime day) async {
    setState(
      () => selectedDate = day,
    );

    late final int selectedYear = selectedDate.year;
    late final String selectedMonth = DateFormat('MMMM').format(selectedDate);
    late final int selectedDay = selectedDate.day;

    selectedDateSchedule = _dataSchedule.where((schedule) {
      return schedule.wday == DateFormat('dd').format(selectedDate) && schedule.month == selectedMonth;
    }).toList();

    await _sendDateToDatabase(selectedYear, selectedMonth, selectedDay);
  }

  Future<void> _sendDateToDatabase(int year, String month, int day) async {
    try {
      var response = await http.post(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIStScheduleKh : APIStScheduleEn,
        ),
        body: {
          'student_id': widget.data_studentUser[0].student_id,
          'pwd': widget.data_studentUser[0].pwd,
          'guardian_id': widget.sourceScreen == guardian_sourceScreen ? widget.data_studentUser[0].guardian_id : 'N/A',
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
            late final String selectedMonth = DateFormat('MMMM').format(selectedDate);

            selectedDateSchedule = _dataSchedule.where((schedule) {
              return schedule.wday == DateFormat('dd').format(selectedDate) && schedule.month == selectedMonth;
            }).toList();

            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(
            () => isLoading = false,
          );
        }
      }
    } catch (error) {
      print('Failed to fetch schedule: $error');
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }
}
