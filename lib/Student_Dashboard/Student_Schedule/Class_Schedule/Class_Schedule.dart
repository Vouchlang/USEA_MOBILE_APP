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
      wday: json['wday'],
      weekday: json['weekday'],
      session: json['session'],
      subject: json['subject'],
      teacher: json['teacher'],
      phonenumber: json['phonenumber'],
      room: json['room'],
    );
  }
}
