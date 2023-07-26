class ScheduleClass {
  late final String wday, weekday, session, subject, teacher, phonenumber, room;

  ScheduleClass({
    required this.wday,
    required this.weekday,
    required this.session,
    required this.subject,
    required this.teacher,
    required this.phonenumber,
    required this.room,
  });

  factory ScheduleClass.fromJson(Map<String, dynamic> json) {
    return ScheduleClass(
      wday: json['date'],
      weekday: json['weekday'],
      session: json['session'],
      subject: json['subject'],
      teacher: json['teacherName'],
      phonenumber: json['tel'],
      room: json['classroom'],
    );
  }
}
