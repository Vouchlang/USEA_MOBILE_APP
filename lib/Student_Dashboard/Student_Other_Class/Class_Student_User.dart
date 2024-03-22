class StudentUser {
  final String name_kh, student_id, pwd, guardian_id;

  StudentUser({
    required this.name_kh,
    required this.student_id,
    required this.pwd,
    required this.guardian_id,
  });

  Map<String, dynamic> toJson() {
    return {
      'name_kh': name_kh,
      'student_id': student_id,
      'pwd': pwd,
      'guardian_id': guardian_id,
    };
  }

  factory StudentUser.fromJson(Map<String, dynamic> json) {
    return StudentUser(
      name_kh: json['name_kh'] ?? 'N/A',
      student_id: json['student_id'] ?? 'N/A',
      pwd: json['pwd'] ?? 'N/A',
      guardian_id: json['guardian_id'] ?? 'N/A',
    );
  }
}
