class ProgramACCA {
  late final String fac_name;
  late final List<Faculty_Data> fac_data;

  ProgramACCA({
    required this.fac_name,
    required this.fac_data,
  });
}

class Faculty_Data {
  late final String fac_icon;
  late final List<Major_Data> major_data;

  Faculty_Data({
    required this.fac_icon,
    required this.major_data,
  });
}

class Major_Data {
  late final String major_name, course_hour;
  late final List<Subject_Data> subject_data;

  Major_Data({
    required this.major_name,
    required this.course_hour,
    required this.subject_data,
  });
}

class Subject_Data {
  late final String no, subject, hour_per_week, weeks, total_hour;

  Subject_Data({
    required this.no,
    required this.subject,
    required this.hour_per_week,
    required this.weeks,
    required this.total_hour,
  });
}
