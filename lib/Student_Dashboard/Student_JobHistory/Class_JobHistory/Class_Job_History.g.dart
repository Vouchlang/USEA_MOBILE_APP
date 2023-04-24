// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Class_Job_History.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class_JobHistory _$Class_JobHistoryFromJson(Map<String, dynamic> json) =>
    Class_JobHistory(
      date_start_work: json['date_start_work'] as String,
      status_name: json['status_name'] as String,
      work_place: json['work_place'] as String,
      position: json['position'] as String,
      salary: json['salary'] as String,
    );

Map<String, dynamic> _$Class_JobHistoryToJson(Class_JobHistory instance) =>
    <String, dynamic>{
      'date_start_work': instance.date_start_work,
      'status_name': instance.status_name,
      'work_place': instance.work_place,
      'position': instance.position,
      'salary': instance.salary,
    };
