// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Scholarship_In.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

I_Scholarship _$I_ScholarshipFromJson(Map<String, dynamic> json) =>
    I_Scholarship(
      i_school_name: json['i_school_name'] as String,
      i_educational_level: json['i_educational_level'] as String,
      i_major: json['i_major'] as String,
      i_expire: json['i_expire'] as String,
      i_expire_date: json['i_expire_date'] as String,
      i_link: json['i_link'] as String,
    );

Map<String, dynamic> _$I_ScholarshipToJson(I_Scholarship instance) =>
    <String, dynamic>{
      'i_school_name': instance.i_school_name,
      'i_educational_level': instance.i_educational_level,
      'i_major': instance.i_major,
      'i_expire': instance.i_expire,
      'i_expire_date': instance.i_expire_date,
      'i_link': instance.i_link,
    };
