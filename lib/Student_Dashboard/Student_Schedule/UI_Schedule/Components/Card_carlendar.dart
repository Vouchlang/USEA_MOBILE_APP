import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CardCalendar extends StatefulWidget {
  const CardCalendar({super.key});

  @override
  State<CardCalendar> createState() => _CardCalendarState();
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  color: Colors.grey,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(
                  color: Colors.green,
                ),
                todayDecoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
              ),
              headerStyle: HeaderStyle(
                headerPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                      shape: BoxShape.circle,
                      color: isSameDay(date, today)
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isSunday(date) ? Colors.red : null,
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
