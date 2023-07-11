class JobHistory {
  late final String date_start_work, status_name, workPlace, position, salary;

  JobHistory({
    required this.date_start_work,
    required this.status_name,
    required this.workPlace,
    required this.position,
    required this.salary,
  });

  factory JobHistory.fromJson(Map<String, dynamic> json) {
    return JobHistory(
      date_start_work: json['date_start_work'],
      status_name: json['status_name'],
      workPlace: json['work_place'],
      position: json['position'],
      salary: json['salary'],
    );
  }
}
