import 'package:json_annotation/json_annotation.dart';
part 'Class_Registration.g.dart';

@JsonSerializable()
class Class_Registration {
  late final String title,
      date,
      time,
      education1,
      education2,
      detail1,
      detail2,
      detail3;

  Class_Registration(
      {required this.title,
      required this.date,
      required this.time,
      required this.education1,
      required this.education2,
      required this.detail1,
      required this.detail2,
      required this.detail3});

  factory Class_Registration.fromJson(Map<String, dynamic> json) =>
      _$Class_RegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$Class_RegistrationToJson(this);
}
