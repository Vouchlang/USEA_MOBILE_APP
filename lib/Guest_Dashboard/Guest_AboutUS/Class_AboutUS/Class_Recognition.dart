import 'package:json_annotation/json_annotation.dart';
part 'Class_Recognition.g.dart';

@JsonSerializable()
class Class_Recognition {
  late final String image, title, link;

  Class_Recognition({
    required this.image,
    required this.title,
    required this.link,
  });

  factory Class_Recognition.fromJson(Map<String, dynamic> json) =>
      _$Class_RecognitionFromJson(json);
  Map<String, dynamic> toJson() => _$Class_RecognitionToJson(this);
}
