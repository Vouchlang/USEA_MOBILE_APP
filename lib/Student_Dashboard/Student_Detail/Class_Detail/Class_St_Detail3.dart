// import 'package:json_annotation/json_annotation.dart';
// part 'Class_St_Detail3.g.dart';

// @JsonSerializable()
// class Student_Detail3 {
//   late final String student_icon;
//   late final String student_info_name;
//   late final String student_info_db;

//   Student_Detail3({
//     required this.student_icon,
//     required this.student_info_name,
//     required this.student_info_db,
//   });

//   factory Student_Detail3.fromJson(Map<String, dynamic> json) =>
//       _$Student_Detail3FromJson(json);
//   Map<String, dynamic> toJson() => _$Student_Detail3tToJson(this);
// }

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
