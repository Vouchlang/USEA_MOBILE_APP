import 'package:json_annotation/json_annotation.dart';
part 'Class_Registration.g.dart';

@JsonSerializable()
class Class_Registration {
  late final String title;
  late final String date;
  late final String time;
  late final String education1;
  late final String education2;
  late final String detail1;
  late final String detail2;
  late final String detail3;

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
