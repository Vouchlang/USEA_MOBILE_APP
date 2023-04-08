class Program_List {
  final String facIcon;
  final String facName;
  final List<String> majors;

  Program_List({
    required this.facIcon,
    required this.facName,
    required this.majors,
  });

  factory Program_List.fromJson(Map<String, dynamic> json) {
    return Program_List(
      facIcon: json['fac_icon'],
      facName: json['fac_name'],
      majors: List<String>.from(json['majors']),
    );
  }
}
