import 'package:json_annotation/json_annotation.dart';
part 'Class_Video.g.dart';

@JsonSerializable()
class VDO_Class {
  final String youtube_thumbnail, title, caption, link;

  VDO_Class(
      {required this.youtube_thumbnail,
      required this.title,
      required this.caption,
      required this.link});

  factory VDO_Class.fromJson(Map<String, dynamic> json) =>
      _$VDO_ClassFromJson(json);
  Map<String, dynamic> toJson() => _$VDO_ClassToJson(this);
}
