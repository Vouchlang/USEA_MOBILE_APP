class ScheduleClass {
  late final String wday,
      month,
      weekday,
      session,
      subject,
      teacher,
      phonenumber,
      room;

  ScheduleClass({
    required this.wday,
    required this.month,
    required this.weekday,
    required this.session,
    required this.subject,
    required this.teacher,
    required this.phonenumber,
    required this.room,
  });

  factory ScheduleClass.fromJson(Map<String, dynamic> json) {
    return ScheduleClass(
      wday: json['date'] ?? 'N/A',
      month: json['month'] ?? 'N/A',
      weekday: json['weekday'] ?? 'N/A',
      session: json['session'] ?? 'N/A',
      subject: json['subject'] ?? 'N/A',
      teacher: json['teacherName'] ?? 'N/A',
      phonenumber: json['tel'] ?? 'N/A',
      room: json['classroom'] ?? 'N/A',
    );
  }
}
