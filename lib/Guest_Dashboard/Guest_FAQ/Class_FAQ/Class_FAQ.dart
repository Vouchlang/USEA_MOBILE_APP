import 'package:json_annotation/json_annotation.dart';
part 'Class_FAQ.g.dart';

@JsonSerializable()
class Class_FAQ {
  late final String question;
  late final String answer;

  Class_FAQ({required this.question, required this.answer});

  factory Class_FAQ.fromJson(Map<String, dynamic> json) =>
      _$Class_FAQFromJson(json);
  Map<String, dynamic> toJson() => _$Class_FAQToJson(this);
}
