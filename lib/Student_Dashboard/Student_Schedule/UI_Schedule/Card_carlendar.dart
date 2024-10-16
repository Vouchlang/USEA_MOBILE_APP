import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: UPdMg5,
          horizontal: UPdMg10,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                UPdMg5,
                UZeroPixel,
                UPdMg5,
                UPdMg5,
              ),
              decoration: BoxDecoration(
                color: UBackgroundColor,
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 0.5,
                    color: ULightGreyColor,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(UPdMg10),
              ),
              child: TableCalendar(
                daysOfWeekHeight: 25,
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date).substring(0, 2),
                ),
                calendarStyle: CalendarStyle(
                  todayTextStyle: const TextStyle(
                    fontWeight: UTitleWeight,
                    color: UPrimaryColor,
                  ),
                  todayDecoration:
                      const BoxDecoration(color: UTransParentColor),
                  selectedTextStyle: const TextStyle(
                    fontWeight: UTitleWeight,
                    color: USecondaryColor,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: UPrimaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(URoundedMedium),
                  ),
                ),
                headerStyle: HeaderStyle(
                  titleTextFormatter: (date, locale) {
                    return DateFormat.yMMMM(locale).format(date).tr;
                  },
                  headerPadding: const EdgeInsets.symmetric(
                    horizontal: UWidth20,
                    vertical: UPdMg10,
                  ),
                  titleTextStyle: const TextStyle(
                    color: UPrimaryColor,
                    fontSize: UTitleSize16,
                    fontWeight: UTitleWeight,
                    fontFamily: UEFontFamily,
                  ),
                  leftChevronIcon: const Icon(
                    Icons.arrow_left_sharp,
                    size: 35,
                    color: UPrimaryColor,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.arrow_right_sharp,
                    size: 35,
                    color: UPrimaryColor,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime(2018, 1, 1),
                lastDay: DateTime(2028, 12, 31),
                onDaySelected: (day, focusedDay) {
                  widget.onDateSelected(day);
                  setState(
                    () => today = day,
                  );
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _) {
                    return Container(
                      margin: const EdgeInsets.all(UPdMg5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSameDay(
                          date,
                          today,
                        )
                            ? UPrimaryColor
                            : UBtnColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(URoundedMedium),
                      ),
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isSunday(date) ? URedColor : UPrimaryColor,
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
