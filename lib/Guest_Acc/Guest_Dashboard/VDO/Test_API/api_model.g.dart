// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      upcoming_image: json['upcoming_image'] as String,
      upcoming_title: json['upcoming_title'] as String,
      upcoming_detail: json['upcoming_detail'] as String,
      upcoming_day: json['upcoming_day'] as String,
      upcoming_date: json['upcoming_date'] as String,
      upcoming_month: json['upcoming_month'] as String,
      upcoming_year: json['upcoming_year'] as String,
      upcoming_time: json['upcoming_time'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'upcoming_image': instance.upcoming_image,
      'upcoming_detail': instance.upcoming_detail,
      'upcoming_day': instance.upcoming_day,
      'upcoming_date': instance.upcoming_date,
      'upcoming_month': instance.upcoming_month,
      'upcoming_year': instance.upcoming_year,
      'upcoming_time': instance.upcoming_time,
    };
