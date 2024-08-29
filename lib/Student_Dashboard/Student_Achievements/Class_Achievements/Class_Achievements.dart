class AchievementData {
  late final List<AchievementTypeData> achievementData;

  AchievementData({
    required this.achievementData,
  });

  factory AchievementData.fromJson(Map<String, dynamic> json) {
    return AchievementData(
      achievementData: (json['achievement_data'] as List<dynamic>)
          .map((e) => AchievementTypeData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'achievement_data': achievementData.map((e) => e.toJson()).toList(),
    };
  }
}

class AchievementTypeData {
  late final String achievementType;
  late final List<AchievementImageData> data;

  AchievementTypeData({
    required this.achievementType,
    required this.data,
  });

  factory AchievementTypeData.fromJson(Map<String, dynamic> json) {
    return AchievementTypeData(
      achievementType: json['achievement_type'],
      data: (json['data'] as List<dynamic>)
          .map((e) => AchievementImageData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'achievement_type': achievementType,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class AchievementImageData {
  late final String image, image_title;
  late final int image_status;

  AchievementImageData({
    required this.image,
    required this.image_title,
    required this.image_status,
  });

  factory AchievementImageData.fromJson(Map<String, dynamic> json) {
    return AchievementImageData(
      image: json['image'],
      image_title: json['image_title'],
      image_status: json['image_status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image_title': image_title,
      'image_status': image_status,
    };
  }
}
