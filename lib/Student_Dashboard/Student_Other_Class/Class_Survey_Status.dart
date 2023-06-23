class SurveyStatus {
  final String survey_status, link;

  SurveyStatus({
    required this.survey_status,
    required this.link,
  });

  Map<String, dynamic> toJson() {
    return {
      'survey_status': survey_status,
      'link': link,
    };
  }

  factory SurveyStatus.fromJson(Map<String, dynamic> json) {
    return SurveyStatus(
      survey_status: json['survey_status'] as String,
      link: json['link'] as String,
    );
  }
}
