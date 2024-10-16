// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClassVisionList {
  late final String title, description;
  ClassVisionList({
    required this.title,
    required this.description,
  });
}

List<ClassVisionList> visionListData = [
  ClassVisionList(
    title: '1. Vision',
    description: 'University of South-East Asia will develop human resources with high competency, virtue, and professional attitude in response to national and international labor market, where they can find employment and live in the era of globalization to contribute to the building of society.',
  ),
  ClassVisionList(
    title: '2. Mission',
    description:
        'University of South-East Asia builds higher education and technical and vocational education systems at all levels in compliance with national and international standards to provide knowledge, know-how, technical skills, soft skills, and professional attitude to learners to meet the needs of national and international labor market.',
  ),
  ClassVisionList(
    title: '3. Educational Philosophy',
    description: 'Your life will be more successful with University of South-East Asia.',
  ),
  ClassVisionList(
    title: '4. Core Value',
    description: 'Knowledge, Skills, Excellence, Society',
  ),
];

class ClassVisionDetail {
  late final String title;
  late final List<DetailData> detailData;
  ClassVisionDetail({
    required this.title,
    required this.detailData,
  });
}

class DetailData {
  late final String data;
  DetailData({
    required this.data,
  });
}

List<ClassVisionDetail> visionDetailData = [
  ClassVisionDetail(
    title: '4.1. Knowledge',
    detailData: detailDataKnowledge,
  ),
  ClassVisionDetail(
    title: '4.2. Skills',
    detailData: detailDataSkills,
  ),
  ClassVisionDetail(
    title: '4.3. Excellence',
    detailData: detailDataExcellence,
  ),
  ClassVisionDetail(
    title: '4.4. Social',
    detailData: detailDataSocial,
  ),
  ClassVisionDetail(
    title: '5. Goal & Objective',
    detailData: detailDataGoals,
  ),
];

List<DetailData> detailDataKnowledge = [
  DetailData(data: 'Enjoy lifelong learning and research'),
  DetailData(data: 'Extensive knowledge'),
  DetailData(data: 'Knowledge of foreign languages that can be used officially'),
  DetailData(data: 'Self-confidence'),
];

List<DetailData> detailDataSkills = [
  DetailData(data: 'Able to use information technology proficiently'),
  DetailData(data: 'Technical Skills'),
  DetailData(data: 'Soft skills'),
  DetailData(data: 'Innovation and Creativity.'),
];

List<DetailData> detailDataExcellence = [
  DetailData(data: 'High commitment and responsibility to perform the work'),
  DetailData(data: 'High commitment and responsibility in teaching'),
  DetailData(data: 'High commitment and responsibility in study and research'),
  DetailData(data: 'Honesty, virtue, accountability, open communication and teamwork'),
];

List<DetailData> detailDataSocial = [
  DetailData(data: 'National Consciousness'),
  DetailData(data: 'Participate in social activities'),
  DetailData(data: 'Preservation and protection of national culture and traditions'),
  DetailData(data: 'Maintain and protect the environment'),
];

List<DetailData> detailDataGoals = [
  DetailData(data: 'Good management and governance'),
  DetailData(data: 'Improving the quality of education to national and international standards'),
  DetailData(data: 'Promoting research and development'),
  DetailData(data: 'International Communication and Cooperation'),
  DetailData(data: 'Recognition of quality of education nationally and internationally'),
];
