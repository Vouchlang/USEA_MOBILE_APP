class Student_Detail2 {
  late final String student_year;
  late final String student_semester;
  late final String student_stage;
  late final String student_term;
  late final String student_academic;

  Student_Detail2(
      {required this.student_year,
      required this.student_semester,
      required this.student_term,
      required this.student_stage,
      required this.student_academic});

  factory Student_Detail2.fromJson(Map<String, dynamic> json) {
    return Student_Detail2(
      student_year: json['year_name'],
      student_semester: json['semester_name'],
      student_stage: json['stage_name'],
      student_term: json['term_name'],
      student_academic: json['academic_year'],
    );
  }
}
