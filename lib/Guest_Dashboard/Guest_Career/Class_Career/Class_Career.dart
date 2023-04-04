import 'package:json_annotation/json_annotation.dart';
part 'Class_Career.g.dart';

@JsonSerializable()
class Class_Career {
  late final String logo;
  late final String position;
  late final String organization;
  late final String link;

  Class_Career(
      {required this.logo,
      required this.position,
      required this.organization,
      required this.link});

  factory Class_Career.fromJson(Map<String, dynamic> json) =>
      _$Class_CareerFromJson(json);
  Map<String, dynamic> toJson() => _$Class_CareerToJson(this);
}
