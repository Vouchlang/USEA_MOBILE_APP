class ProgramACCA {
  late String fac_name;
  late List<Faculty_Data> fac_data;

  ProgramACCA({required this.fac_name, required this.fac_data});
}

class Faculty_Data {
  late String fac_icon;
  late List<Major_Data> major_data;

  Faculty_Data({required this.fac_icon, required this.major_data});
}

class Major_Data {
  late String major_name;
  late List<Subject_Data> subject_data;

  Major_Data({required this.major_name, required this.subject_data});
}

class Subject_Data {
  late String subject, hour_per_week, weeks, total_hour;

  Subject_Data({
    required this.subject,
    required this.hour_per_week,
    required this.weeks,
    required this.total_hour,
  });
}
