// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Up_News_Events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class_Upcoming_Event _$Class_Upcoming_EventFromJson(
        Map<String, dynamic> json) =>
    Class_Upcoming_Event(
      upcoming_image: json['upcoming_image'] as String,
      upcoming_title: json['upcoming_title'] as String,
      upcoming_desc: json['upcoming_desc'] as String,
      upcoming_day: json['upcoming_day'] as String,
      upcoming_date: json['upcoming_date'] as String,
      upcoming_month: json['upcoming_month'] as String,
      upcoming_year: json['upcoming_year'] as String,
      upcoming_time: json['upcoming_time'] as String,
    );

Map<String, dynamic> _$Class_Upcoming_EventToJson(
        Class_Upcoming_Event instance) =>
    <String, dynamic>{
      'upcoming_image': instance.upcoming_image,
      'upcoming_title': instance.upcoming_title,
      'upcoming_desc': instance.upcoming_desc,
      'upcoming_day': instance.upcoming_day,
      'upcoming_date': instance.upcoming_date,
      'upcoming_month': instance.upcoming_month,
      'upcoming_year': instance.upcoming_year,
      'upcoming_time': instance.upcoming_time,
    };
