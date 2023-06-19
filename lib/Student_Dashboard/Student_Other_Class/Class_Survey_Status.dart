class SurveyStatus {
  final String survey_status;

  SurveyStatus({
    required this.survey_status,
  });

  Map<String, dynamic> toJson() {
    return {
      'survey_status': survey_status,
    };
  }

  factory SurveyStatus.fromJson(Map<String, dynamic> json) {
    return SurveyStatus(
      survey_status: json['survey_status'] as String,
    );
  }
}
