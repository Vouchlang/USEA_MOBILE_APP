// ignore_for_file: camel_case_types, non_constant_identifier_names

class Attendance_Data {
  late final String subject;
  late final int credit, hour;

  Attendance_Data(
      {required this.subject, required this.hour, required this.credit});
}

List<Attendance_Data> attendance_data = [
  Attendance_Data(subject: "សេដ្ធកិច្ចវិទ្យា", hour: 45, credit: 3),
  Attendance_Data(
      subject: "ប្រវត្តិ និងវប្បធម៏អាសុីអាគ្នេយ៏", hour: 45, credit: 3),
  Attendance_Data(subject: "រដ្ធបាលសាធារណៈ", hour: 45, credit: 3),
  Attendance_Data(subject: "កុំព្រូទ័រសម្រាប់រដ្ធបាល", hour: 45, credit: 3),
  Attendance_Data(subject: "ភាសាអង់គ្លេស I", hour: 45, credit: 3),
  Attendance_Data(subject: "ភាសាចិន I", hour: 45, credit: 3),
];
