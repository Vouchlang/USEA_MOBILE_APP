class JobHistory {
  final String date_start_work;
  final String status_name;
  final String workPlace;
  final String position;
  final String salary;

  JobHistory({
    required this.date_start_work,
    required this.status_name,
    required this.workPlace,
    required this.position,
    required this.salary,
  });

  Map<String, dynamic> toJson() {
    return {
      'date_start_work': date_start_work,
      'status_name': status_name,
      'work_place': workPlace,
      'position': position,
      'salary': salary,
    };
  }

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
