class Class_Scholarship {
  late final String scholarship_name;
  late final List<Scholarship_Data> scholarship_data;

  Class_Scholarship({
    required this.scholarship_name,
    required this.scholarship_data,
  });
}

class Scholarship_Data {
  late final String school_name, education_level, major_name, expire_date, link;

  Scholarship_Data({
    required this.school_name,
    required this.education_level,
    required this.major_name,
    required this.expire_date,
    required this.link,
  });
}
