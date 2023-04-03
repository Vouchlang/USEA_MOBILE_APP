import 'package:json_annotation/json_annotation.dart';
part 'Class_Scholarship_Out.g.dart';

@JsonSerializable()
class O_Scholarship {
  late final String o_school_name;
  late final String o_educational_level;
  late final String o_major;
  late final String o_expire;
  late final String o_expire_date;
  late final String o_link;

  O_Scholarship(
      {required this.o_school_name,
      required this.o_educational_level,
      required this.o_major,
      required this.o_expire,
      required this.o_expire_date,
      required this.o_link});

  factory O_Scholarship.fromJson(Map<String, dynamic> json) =>
      _$O_ScholarshipFromJson(json);
  Map<String, dynamic> toJson() => _$O_ScholarshipToJson(this);
}
