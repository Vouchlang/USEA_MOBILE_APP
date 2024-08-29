class SurveyStatus {
  late final String survey_status, times, link;

  SurveyStatus({
    required this.survey_status,
    required this.times,
    required this.link,
  });

  factory SurveyStatus.fromJson(Map<String, dynamic> json) {
    return SurveyStatus(
      survey_status: json['survey_status'] as String,
      times: json['times'] as String,
      link: json['link'] as String,
    );
  }
}
