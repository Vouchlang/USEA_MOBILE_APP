class Student_Detail3 {
  late final String student_icon;
  late final String student_info_name;
  late final String student_info_db;

  Student_Detail3({
    required this.student_icon,
    required this.student_info_name,
    required this.student_info_db,
  });
}

List<Student_Detail3> student_detail1 = [
  Student_Detail3(
    student_icon: 'assets/image/logo3.png',
    student_info_name: 'student_name_kh',
    student_info_db: 'student_name_en',
  ),
];
