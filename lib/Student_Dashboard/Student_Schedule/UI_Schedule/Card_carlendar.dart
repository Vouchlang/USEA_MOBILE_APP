import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '/theme_builder.dart';

class CardCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CardCalendar({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CardCalendarState createState() => _CardCalendarState();
}

class _CardCalendarState extends State<CardCalendar> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: UPdMg5,
          horizontal: UPdMg10,
        ),
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
                borderRadius: BorderRadius.circular(
                  UPdMg10,
                ),
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
                    color: UPrimaryColor,
                  ),
                  todayDecoration: BoxDecoration(
                    color: UTransParentColor,
                  ),
                  selectedTextStyle: TextStyle(
                    fontWeight: UTitleWeight,
                    color: USecondaryColor,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: UPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.symmetric(
                    horizontal: UWidth20,
                    vertical: UPdMg10,
                  ),
                  titleTextStyle: TextStyle(
                    color: UPrimaryColor,
                    fontSize: UTitleSize16,
                  ),
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
                firstDay: DateTime(2018, 12, 31),
                lastDay: DateTime(2025, 12, 31),
                onDaySelected: (day, focusedDay) {
                  widget.onDateSelected(day);
                  setState(() {
                    today = day;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _) {
                    return Container(
                      margin: EdgeInsets.all(
                        UPdMg5,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSameDay(date, today)
                            ? UPrimaryColor
                            : UTransParentColor,
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
      ),
    );
  }

  bool isSunday(DateTime date) {
    return date.weekday == DateTime.sunday;
  }
}
