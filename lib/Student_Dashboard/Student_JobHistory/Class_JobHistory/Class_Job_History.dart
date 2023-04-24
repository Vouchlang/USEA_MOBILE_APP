import 'package:json_annotation/json_annotation.dart';
part 'Class_Job_History.g.dart';

@JsonSerializable()
class Class_JobHistory {
  late final String date_start_work;
  late final String status_name;
  late final String work_place;
  late final String position;
  late final String salary;

  Class_JobHistory({
    required this.date_start_work,
    required this.status_name,
    required this.work_place,
    required this.position,
    required this.salary,
  });

  factory Class_JobHistory.fromJson(Map<String, dynamic> json) =>
      _$Class_JobHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$Class_JobHistoryToJson(this);
}
