import 'package:json_annotation/json_annotation.dart';
part 'Class_Scholarship_In.g.dart';

@JsonSerializable()
class I_Scholarship {
  late final String i_school_name,
      i_educational_level,
      i_major,
      i_expire,
      i_expire_date,
      i_link;

  I_Scholarship(
      {required this.i_school_name,
      required this.i_educational_level,
      required this.i_major,
      required this.i_expire,
      required this.i_expire_date,
      required this.i_link});

  factory I_Scholarship.fromJson(Map<String, dynamic> json) =>
      _$I_ScholarshipFromJson(json);
  Map<String, dynamic> toJson() => _$I_ScholarshipToJson(this);
}
