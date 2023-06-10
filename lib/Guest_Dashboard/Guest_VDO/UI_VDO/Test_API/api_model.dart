import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable()
class Major_Detail {
  final String major_name,
      knowledge_title,
      knowledge_desc,
      cognitive_title,
      cognitive_desc,
      skill_title,
      skill_desc,
      numerical_title,
      numerical_desc;

  Major_Detail(
      {required this.major_name,
      required this.knowledge_title,
      required this.knowledge_desc,
      required this.cognitive_title,
      required this.cognitive_desc,
      required this.skill_title,
      required this.skill_desc,
      required this.numerical_title,
      required this.numerical_desc});

  factory Major_Detail.fromJson(Map<String, dynamic> json) =>
      _$Major_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Major_DetailToJson(this);
}
