class Performance_Class {
  late final String yearNo;
  late final List<Semester> semesters;

  Performance_Class({
    required this.yearNo,
    required this.semesters,
  });
}

class Semester {
  late final String semesterNo, average, gpa, grade, meaning;
  late final List<Subject> subjects;

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
  late final String id, name_kh, name_en, pscore_total, attendance_ps;
  late final List<Attendances> attendances;
  late final List<Scores> scores;

  Subject({
    required this.id,
    required this.name_kh,
    required this.name_en,
    required this.pscore_total,
    required this.attendance_ps,
    required this.attendances,
    required this.scores,
  });
}

class Attendances {
  late final String title,
      attendance_a,
      attendance_pm,
      attendance_al,
      attendance_all,
      attendance_ps;

  Attendances({
    required this.title,
    required this.attendance_a,
    required this.attendance_pm,
    required this.attendance_al,
    required this.attendance_all,
    required this.attendance_ps,
  });
}

class Scores {
  late final String title,
      score_attendance,
      score_assignment,
      score_mid_term,
      score_final,
      number_attendance,
      number_assignment,
      number_mid_term,
      number_final;

  Scores({
    required this.title,
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
