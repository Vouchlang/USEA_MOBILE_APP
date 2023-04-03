import 'package:json_annotation/json_annotation.dart';
part 'Class_Past_News_Events.g.dart';

@JsonSerializable()
class Class_Past_Event {
  final String past_image;
  final String past_title;
  final String past_detail;
  final String past_day;
  final String past_date;
  final String past_month;
  final String past_year;
  final String past_time;

  Class_Past_Event(
      {required this.past_image,
      required this.past_title,
      required this.past_detail,
      required this.past_day,
      required this.past_date,
      required this.past_month,
      required this.past_year,
      required this.past_time});

  factory Class_Past_Event.fromJson(Map<String, dynamic> json) =>
      _$Class_Past_EventFromJson(json);
  Map<String, dynamic> toJson() => _$Class_Past_EventToJson(this);
}
