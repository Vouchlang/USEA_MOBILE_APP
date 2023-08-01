import 'package:json_annotation/json_annotation.dart';
part 'Class_Up_News_Events.g.dart';

@JsonSerializable()
class Class_Upcoming_Event {
  final String upcoming_image,
      upcoming_title,
      upcoming_desc,
      upcoming_day,
      upcoming_date,
      upcoming_month,
      upcoming_year,
      upcoming_time;

  Class_Upcoming_Event(
      {required this.upcoming_image,
      required this.upcoming_title,
      required this.upcoming_desc,
      required this.upcoming_day,
      required this.upcoming_date,
      required this.upcoming_month,
      required this.upcoming_year,
      required this.upcoming_time});

  factory Class_Upcoming_Event.fromJson(Map<String, dynamic> json) =>
      _$Class_Upcoming_EventFromJson(json);
  Map<String, dynamic> toJson() => _$Class_Upcoming_EventToJson(this);
}
