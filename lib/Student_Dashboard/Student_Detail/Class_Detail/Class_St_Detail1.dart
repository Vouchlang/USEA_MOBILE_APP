class Student_Detail1 {
  late final String student_profile_pic;
  late final String student_name_kh;
  late final String student_name_en;
  late final String student_id;

  Student_Detail1(
      {required this.student_profile_pic,
      required this.student_name_kh,
      required this.student_name_en,
      required this.student_id});
}

List<Student_Detail1> student_detail1 = [
  Student_Detail1(
      student_profile_pic: 'assets/image/logo3.png',
      student_name_kh: 'student_name_kh',
      student_name_en: 'student_name_en',
      student_id: 'student_id'),
];
