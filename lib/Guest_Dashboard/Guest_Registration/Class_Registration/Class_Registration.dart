class EducationData {
  late final String title;
  late final List<EducationDetail> details;

  EducationData({
    required this.title,
    required this.details,
  });

  factory EducationData.fromJson(Map<String, dynamic> json) {
    return EducationData(
      title: json['title'],
      details: List<EducationDetail>.from(
          json['details'].map((x) => EducationDetail.fromJson(x))),
    );
  }
}

class EducationDetail {
  late final String dateTitle, timeTitle, timeDetail;
  late final List<EducationItem> educationList;

  EducationDetail({
    required this.dateTitle,
    required this.educationList,
    required this.timeTitle,
    required this.timeDetail,
  });

  factory EducationDetail.fromJson(Map<String, dynamic> json) {
    return EducationDetail(
      dateTitle: json['date_title'],
      educationList: List<EducationItem>.from(
          json['education_list'].map((x) => EducationItem.fromJson(x))),
      timeTitle: json['time_title'],
      timeDetail: json['time_detail'],
    );
  }
}

class EducationItem {
  late final String educationName;
  late final List<InfoList> infoList;

  EducationItem({
    required this.educationName,
    required this.infoList,
  });

  factory EducationItem.fromJson(Map<String, dynamic> json) {
    return EducationItem(
      educationName: json['education_name'],
      infoList: List<InfoList>.from(json['list'].map((x) => x['info'])),
    );
  }
}

class InfoList {
  late final String info_text;

  InfoList({
    required this.info_text,
  });

  factory InfoList.fromJson(Map<String, dynamic> json) {
    return InfoList(
      info_text: json['info'],
    );
  }
}
