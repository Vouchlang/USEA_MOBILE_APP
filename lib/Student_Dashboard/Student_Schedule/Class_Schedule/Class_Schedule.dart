class ScheduleClass {
  late final String wday, weekday, session, subject, teacher, phonenumber, room;

  /// ! Contractor
  ScheduleClass({
    required this.wday,
    required this.weekday,
    required this.session,
    required this.subject,
    required this.teacher,
    required this.phonenumber,
    required this.room,
  });

  Map<String, dynamic> toJson() {
    return {
      'wday': wday,
      'weekday': weekday,
      'session': session,
      'subject': subject,
      'teacher': teacher,
      'phonenumber': phonenumber,
      'room': room,
    };
  }

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
