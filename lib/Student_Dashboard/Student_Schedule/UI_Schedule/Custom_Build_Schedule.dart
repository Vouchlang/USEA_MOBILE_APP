import 'package:flutter/material.dart';
import '../../../theme_builder.dart';

// Schedule Title
Widget ScheduleTitle(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize16,
      fontWeight: UTitleWeight,
      color: UPrimaryColor,
    ),
  );
}

// Date Schedule
Widget ScheduleDate(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}

// Schedule Body
Widget ScheduleSubjectData(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}

Widget buildCardSubjectName(final String subjectName) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg15,
      horizontal: UPdMg10,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    child: ScheduleTitle(subjectName),
  );
}

Widget buildCardInfo({
  required final String wday,
  weekday,
  session,
  room,
  teacher,
  phoneNumber,
}) {
  return Padding(
    padding: const EdgeInsets.all(UPdMg10),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: UWidth40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScheduleDate(wday),
                const SizedBox(height: 2),
                ScheduleDate(weekday),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 0.5,
            color: UGreyColor,
            width: UWidth30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScheduleSubjectData(session),
                const SizedBox(height: 2),
                ScheduleSubjectData(room),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ScheduleSubjectData(teacher),
                    ),
                    Expanded(
                      child: ScheduleSubjectData(phoneNumber),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
