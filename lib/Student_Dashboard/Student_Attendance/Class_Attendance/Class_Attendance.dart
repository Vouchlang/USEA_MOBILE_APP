class Attendances {
  final String year_no;
  final List<Semester> semesters;

  Attendances({
    required this.year_no,
    required this.semesters,
  });
}

class Semester {
  final String semester_no;
  final List<Subject> subjects;

  Semester({
    required this.semester_no,
    required this.subjects,
  });
}

class Subject {
  final String id,
      code,
      name_kh,
      hour,
      credit,
      attendance_a,
      attendance_pm,
      attendance_al,
      attendance_all,
      attendance_ps;
  final List<Dates> dates;

  Subject({
    required this.id,
    required this.code,
    required this.name_kh,
    required this.hour,
    required this.credit,
    required this.attendance_a,
    required this.attendance_pm,
    required this.attendance_al,
    required this.attendance_all,
    required this.attendance_ps,
    required this.dates,
  });
}

class Dates {
  final String date_name;
  final List<Sessions> sessions;

  Dates({
    required this.date_name,
    required this.sessions,
  });
}

class Sessions {
  final String date, session, session_all, absent_status;

  Sessions({
    required this.date,
    required this.session,
    required this.session_all,
    required this.absent_status,
  });
}
