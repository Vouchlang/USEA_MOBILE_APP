// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Scholarship_Out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

O_Scholarship _$O_ScholarshipFromJson(Map<String, dynamic> json) =>
    O_Scholarship(
      o_school_name: json['o_school_name'] as String,
      o_educational_level: json['o_educational_level'] as String,
      o_major: json['o_major'] as String,
      o_expire_date: json['o_expire_date'] as String,
      o_link: json['o_link'] as String,
    );

Map<String, dynamic> _$O_ScholarshipToJson(O_Scholarship instance) =>
    <String, dynamic>{
      'o_school_name': instance.o_school_name,
      'o_educational_level': instance.o_educational_level,
      'o_major': instance.o_major,
      'o_expire_date': instance.o_expire_date,
      'o_link': instance.o_link,
    };
