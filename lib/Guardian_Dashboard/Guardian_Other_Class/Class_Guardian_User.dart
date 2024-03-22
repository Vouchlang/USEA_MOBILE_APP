class GuardianUser {
  final String name_kh, guardian_id, pwd;

  GuardianUser({
    required this.name_kh,
    required this.guardian_id,
    required this.pwd,
  });

  Map<String, dynamic> toJson() {
    return {
      'name_kh': name_kh,
      'guardian_id': guardian_id,
      'pwd': pwd,
    };
  }

  factory GuardianUser.fromJson(Map<String, dynamic> json) {
    return GuardianUser(
      name_kh: json['name_kh'],
      guardian_id: json['guardian_id'],
      pwd: json['pwd'],
    );
  }
}
