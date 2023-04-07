// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Major_Detail _$Major_DetailFromJson(Map<String, dynamic> json) => Major_Detail(
      major_name: json['major_name'] as String,
      knowledge_title: json['knowledge_title'] as String,
      knowledge_desc: json['knowledge_desc'] as String,
      cognitive_title: json['cognitive_title'] as String,
      cognitive_desc: json['cognitive_desc'] as String,
      skill_title: json['skill_title'] as String,
      skill_desc: json['skill_desc'] as String,
      numerical_title: json['numerical_title'] as String,
      numerical_desc: json['numerical_desc'] as String,
    );

Map<String, dynamic> _$Major_DetailToJson(Major_Detail instance) =>
    <String, dynamic>{
      'major_name': instance.major_name,
      'knowledge_title': instance.knowledge_title,
      'knowledge_desc': instance.knowledge_desc,
      'cognitive_title': instance.cognitive_title,
      'cognitive_desc': instance.cognitive_desc,
      'skill_title': instance.skill_title,
      'skill_desc': instance.skill_desc,
      'numerical_title': instance.numerical_title,
      'numerical_desc': instance.numerical_desc,
    };
