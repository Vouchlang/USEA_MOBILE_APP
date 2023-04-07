import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable()
class Major_Detail {
  final String major_name;
  final String knowledge_title;
  final String knowledge_desc;
  final String cognitive_title;
  final String cognitive_desc;
  final String skill_title;
  final String skill_desc;
  final String numerical_title;
  final String numerical_desc;

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

  factory Major_Detail.fromJson(Map<String, dynamic> json) => _$Major_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Major_DetailToJson(this);
}
