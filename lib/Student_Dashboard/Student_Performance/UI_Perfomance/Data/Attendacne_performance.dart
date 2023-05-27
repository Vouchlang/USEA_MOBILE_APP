class Attendance {
  late final String type;
  // ignore: non_constant_identifier_names
  late final int num_count;

  // ignore: non_constant_identifier_names
  Attendance({
    required this.type,
    required this.num_count,
  });
}

List<Attendance> attendance = [
  Attendance(
    type: "យឺត",
    num_count: 0,
  ),
  Attendance(
    type: "អវត្តមានមានច្បាប់",
    num_count: 0,
  ),
  Attendance(
    type: "អវត្តមានឥតច្បាប់",
    num_count: 0,
  ),
  Attendance(
    type: "វត្តមាន",
    num_count: 30,
  ),
];
