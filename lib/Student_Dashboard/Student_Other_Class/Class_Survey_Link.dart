import 'package:json_annotation/json_annotation.dart';
part 'Class_Survey_Link.g.dart';

@JsonSerializable()
class Class_Survey_Link {
  late final String survey_link;

  Class_Survey_Link({
    required this.survey_link,
  });

  factory Class_Survey_Link.fromJson(Map<String, dynamic> json) =>
      _$Class_Survey_LinkFromJson(json);
  Map<String, dynamic> toJson() => _$Class_Survey_LinkToJson(this);
}
