import '../../../Custom_Widget/CustomText.dart';

class ClassHistoryLogo {
  late final String logo;
  ClassHistoryLogo({
    required this.logo,
  });
}

List<ClassHistoryLogo> getClassHistoryLogo = [
  ClassHistoryLogo(logo: imageAsset + 'logonew1.png'),
  ClassHistoryLogo(logo: imageAsset + 'logo2.png'),
  ClassHistoryLogo(logo: imageAsset + 'logo3.png'),
];

class ClassHistoryDetail {
  late final String data;
  ClassHistoryDetail({
    required this.data,
  });
}

List<ClassHistoryDetail> getClassHistoryDetail = [
  ClassHistoryDetail(
    data: 'The picture of the golden rice panicles around the circle symbolizes the university’s strength, development and sustainability.',
  ),
  ClassHistoryDetail(
    data: 'The dark blue phrases written in both Khmer and English around the circle and the word USEA with the light blue color on the book symbolize the name of the University of South-East Asia.',
  ),
  ClassHistoryDetail(
    data: 'The picture of the light blue globe inside the circle represents fame, national and international recognition, and regional and global integration.',
  ),
  ClassHistoryDetail(
    data: 'The pictures of the blue hat and spearhead on the book symbolize high quality education and research, resulting in excellent leadership with professional ethics, creativity, social understanding, and commitment to promoting national. ',
  ),
];
