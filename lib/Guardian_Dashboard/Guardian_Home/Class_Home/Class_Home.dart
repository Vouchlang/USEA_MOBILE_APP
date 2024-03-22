class GdDetail {
  late final String year_name,
      semester_name,
      name_kh,
      name_en,
      student_id,
      password,
      stage_name,
      term_name,
      academic_year,
      profile_pic;

  GdDetail({
    required this.year_name,
    required this.semester_name,
    required this.name_kh,
    required this.name_en,
    required this.student_id,
    required this.password,
    required this.stage_name,
    required this.term_name,
    required this.academic_year,
    required this.profile_pic,
  });

  factory GdDetail.fromJson(Map<String, dynamic> json) {
    return GdDetail(
      year_name: json['year_name'] ?? 'N/A',
      semester_name: json['semester_name'] ?? 'N/A',
      name_kh: json['name_kh'] ?? 'N/A',
      name_en: json['name_en'] ?? 'N/A',
      student_id: json['student_id'] ?? 'N/A',
      password: json['password'] ?? 'N/A',
      stage_name: json['stage_name'] ?? 'N/A',
      term_name: json['term_name'] ?? 'N/A',
      academic_year: json['acad_year'] ?? 'N/A',
      profile_pic: json['profile_pic'] ?? 'N/A',
    );
  }
}
