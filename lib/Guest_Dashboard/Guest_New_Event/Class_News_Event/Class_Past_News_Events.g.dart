// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Past_News_Events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class_Past_Event _$Class_Past_EventFromJson(Map<String, dynamic> json) =>
    Class_Past_Event(
      past_image: json['past_image'] as String,
      past_title: json['past_title'] as String,
      past_detail: json['past_detail'] as String,
      past_day: json['past_day'] as String,
      past_date: json['past_date'] as String,
      past_month: json['past_month'] as String,
      past_year: json['past_year'] as String,
      past_time: json['past_time'] as String,
    );

Map<String, dynamic> _$Class_Past_EventToJson(Class_Past_Event instance) =>
    <String, dynamic>{
      'past_image': instance.past_image,
      'past_title': instance.past_title,
      'past_detail': instance.past_detail,
      'past_day': instance.past_day,
      'past_date': instance.past_date,
      'past_month': instance.past_month,
      'past_year': instance.past_year,
      'past_time': instance.past_time,
    };
