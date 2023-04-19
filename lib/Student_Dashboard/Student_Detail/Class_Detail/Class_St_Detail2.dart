class Student_Detail2 {
  late final String student_year;
  late final String student_semester;
  late final String student_generation;
  late final String student_stage;
  late final String student_academic;

  Student_Detail2(
      {required this.student_year,
      required this.student_semester,
      required this.student_generation,
      required this.student_stage,
      required this.student_academic});
}

List<Student_Detail2> student_detail1 = [
  Student_Detail2(
      student_year: 'assets/image/logo3.png',
      student_semester: 'student_name_kh',
      student_generation: 'student_name_en',
      student_stage: 'student_id',
      student_academic: 'student_id'),
];
