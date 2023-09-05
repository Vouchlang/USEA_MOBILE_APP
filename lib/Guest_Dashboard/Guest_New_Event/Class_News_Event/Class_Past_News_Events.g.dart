// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Past_News_Events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class_Past_Event _$Class_Past_EventFromJson(Map<String, dynamic> json) =>
    Class_Past_Event(
      past_image: json['past_image'] as String,
      past_title: json['past_title'] as String,
      past_desc: json['past_desc'] as String,
      past_date: json['past_date'] as String,
      past_time: json['past_time'] as String,
    );

Map<String, dynamic> _$Class_Past_EventToJson(Class_Past_Event instance) =>
    <String, dynamic>{
      'past_image': instance.past_image,
      'past_title': instance.past_title,
      'past_desc': instance.past_desc,
      'past_date': instance.past_date,
      'past_time': instance.past_time,
    };
