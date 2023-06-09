import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:usea_app/theme_builder.dart';

class CardCalendar extends StatefulWidget {
  const CardCalendar({Key? key}) : super(key: key);

  @override
  _CardCalendarState createState() => _CardCalendarState();
}

class _CardCalendarState extends State<CardCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: UBackgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  color: UGreyColor,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              daysOfWeekHeight: 25,
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat.E(locale).format(date).substring(0, 2),
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(
                  fontWeight: UTitleWeight,
                  color: UScoreColor,
                ),
                todayDecoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                selectedTextStyle: TextStyle(
                  fontWeight: UTitleWeight,
                  color: UScoreColor,
                  decoration: TextDecoration.underline,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              headerStyle: HeaderStyle(
                headerPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                titleTextStyle:
                    TextStyle(color: UPrimaryColor, fontSize: UTitleSize16),
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: UPrimaryColor,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: UPrimaryColor,
                ),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime(2010, 10, 16),
              lastDay: DateTime(2030, 3, 14),
              onDaySelected: _onDaySelected,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSameDay(date, today)
                          ? UScoreColor
                          : Colors.transparent,
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isSunday(date) ? URedColor : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isSunday(DateTime date) {
    return date.weekday == DateTime.sunday;
  }
}
