class StudyInfoAssignmentData {
  late final String room_name,
      subject_name,
      assignment_name,
      expire_date,
      expire_time,
      lecturer_name;

  StudyInfoAssignmentData({
    required this.room_name,
    required this.subject_name,
    required this.assignment_name,
    required this.expire_date,
    required this.expire_time,
    required this.lecturer_name,
  });

  factory StudyInfoAssignmentData.fromJson(Map<String, dynamic> json) {
    return StudyInfoAssignmentData(
      room_name: json['room_name'],
      subject_name: json['subject_name'],
      assignment_name: json['assignment_name'],
      expire_date: json['expire_date'],
      expire_time: json['expire_time'],
      lecturer_name: json['lecturer_name'],
    );
  }
}
