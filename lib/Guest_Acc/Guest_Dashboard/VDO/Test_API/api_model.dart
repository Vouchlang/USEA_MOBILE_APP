import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable()
class Event {
  final String upcoming_image;
  final String upcoming_title;
  final String upcoming_detail;
  final String upcoming_day;
  final String upcoming_date;
  final String upcoming_month;
  final String upcoming_year;
  final String upcoming_time;

  Event(
      {required this.upcoming_image,
      required this.upcoming_title,
      required this.upcoming_detail,
      required this.upcoming_day,
      required this.upcoming_date,
      required this.upcoming_month,
      required this.upcoming_year,
      required this.upcoming_time});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
