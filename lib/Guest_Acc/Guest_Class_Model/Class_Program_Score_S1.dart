import 'package:flutter/material.dart';

class Class_Program_Score_S1 {
  late final String subject;
  late final int hour;
  late final int credit;

  Class_Program_Score_S1(
      {required this.subject, required this.hour, required this.credit});
}

List<Class_Program_Score_S1> class_program_score_s1 = [
  Class_Program_Score_S1(subject: '1. សេដ្ឋកិច្ចវិទ្យា', hour: 45, credit: 3),
  Class_Program_Score_S1(
      subject: '2. ប្រវត្តិ និងវប្បធម៍អាស៊ីអាគ្នេយ៍', hour: 45, credit: 3),
  Class_Program_Score_S1(subject: '3. រដ្ឋបាលសាធារណៈ', hour: 45, credit: 3),
  Class_Program_Score_S1(
      subject: '4. កុំព្យូទ័រសម្រាប់រដ្ឋបាល', hour: 45, credit: 3),
  Class_Program_Score_S1(subject: '5. ភាសារអង់គ្លេស I', hour: 45, credit: 3),
  Class_Program_Score_S1(subject: '6. ភាសាចិន I', hour: 45, credit: 0),
];
