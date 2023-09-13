class Performance_Class {
  final String yearNo;
  final List<Semester> semesters;

  Performance_Class({
    required this.yearNo,
    required this.semesters,
  });
}

class Semester {
  final String semesterNo, average, gpa, grade, meaning;
  final List<Subject> subjects;

  Semester({
    required this.semesterNo,
    required this.average,
    required this.gpa,
    required this.grade,
    required this.meaning,
    required this.subjects,
  });
}

class Subject {
  final String id,
      name_kh,
      name_en,
      // pscore_attendance,
      // pscore_assignment,
      // pscore_mid_term,
      // pscore_final,
      pscore_total,
      // number_attendance,
      // number_assignment,
      // number_mid_term,
      // number_final,
      // attendance_a,
      // attendance_al,
      // attendance_pm,
      attendance_ps;
  // attendance_all;
  final List<Attendances> attendances;
  final List<Scores> scores;

  Subject({
    required this.id,
    required this.name_kh,
    required this.name_en,
    // required this.pscore_attendance,
    // required this.pscore_assignment,
    // required this.pscore_mid_term,
    // required this.pscore_final,
    required this.pscore_total,
    // required this.number_attendance,
    // required this.number_assignment,
    // required this.number_mid_term,
    // required this.number_final,
    // required this.attendance_a,
    // required this.attendance_al,
    // required this.attendance_pm,
    required this.attendance_ps,
    // required this.attendance_all,
    required this.attendances,
    required this.scores,
  });
}

class Attendances {
  final String attendance_a,
      attendance_pm,
      attendance_al,
      attendance_all,
      attendance_ps;

  Attendances({
    required this.attendance_a,
    required this.attendance_pm,
    required this.attendance_al,
    required this.attendance_all,
    required this.attendance_ps,
  });
}

class Scores {
  final String score_attendance,
      score_assignment,
      score_mid_term,
      score_final,
      number_attendance,
      number_assignment,
      number_mid_term,
      number_final;

  Scores({
    required this.score_attendance,
    required this.score_assignment,
    required this.score_mid_term,
    required this.score_final,
    required this.number_attendance,
    required this.number_assignment,
    required this.number_mid_term,
    required this.number_final,
  });
}
