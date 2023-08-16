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
    type: "អវត្តមាន",
    num_count: 0,
  ),
  Attendance(
    type: "វត្តមាន",
    num_count: 30,
  ),
];

class Score {
  late final String type;
  // ignore: non_constant_identifier_names
  late final int num_count;

  // ignore: non_constant_identifier_names
  Score({
    required this.type,
    required this.num_count,
  });
}

List<Score> score = [
  Score(
    type: "វត្តមាន",
    num_count: 100,
  ),
  Score(
    type: "លំហាត់",
    num_count: 100,
  ),
  Score(
    type: "កិច្ចការផ្ទះ",
    num_count: 100,
  ),
  Score(
    type: "កិច្ចការក្រុម",
    num_count: 100,
  ),
  Score(
    type: "ពាក់កណ្ដាលឆមាស",
    num_count: 100,
  ),
  Score(
    type: "ឆមាស",
    num_count: 100,
  ),
];
