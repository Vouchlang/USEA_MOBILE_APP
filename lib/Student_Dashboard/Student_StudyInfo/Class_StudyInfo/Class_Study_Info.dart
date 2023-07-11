class StudyInfoData {
  late final String date, month, title, subject, room, time, seat, takeout;

  StudyInfoData({
    required this.date,
    required this.month,
    required this.title,
    required this.subject,
    required this.room,
    required this.time,
    required this.seat,
    required this.takeout,
  });

  factory StudyInfoData.fromJson(Map<String, dynamic> json) {
    return StudyInfoData(
      date: json['date'],
      month: json['month'],
      title: json['title'],
      subject: json['subject'],
      room: json['room'],
      time: json['time'],
      seat: json['seat'],
      takeout: json['takeout'],
    );
  }
}
