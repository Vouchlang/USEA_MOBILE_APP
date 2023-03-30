import 'package:flutter/material.dart';

class Class_Program_Score_S2 {
  late final String subject;
  late final int hour;
  late final int credit;

  Class_Program_Score_S2(
      {required this.subject, required this.hour, required this.credit});
}

List<Class_Program_Score_S2> class_program_score_s2 = [
  Class_Program_Score_S2(
      subject: '1. គណិតវិទ្យាសម្រាប់កុំព្យូទ័រ', hour: 45, credit: 3),
  Class_Program_Score_S2(
      subject: '2. ការគិតស៊ីជម្រៅ និងអភិវឌ្ឍខ្លួន', hour: 45, credit: 3),
  Class_Program_Score_S2(
      subject: '3. សរសេរកម្មវិធីជាមួយ C/C++', hour: 45, credit: 3),
  Class_Program_Score_S2(
      subject: '4. ប្រព័ន្ធកុំព្យូទ័រជាមួយបណ្ដាញ (ITE)', hour: 45, credit: 3),
  Class_Program_Score_S2(subject: '5. ភាសារអង់គ្លេស II', hour: 45, credit: 3),
  Class_Program_Score_S2(subject: '6. ភាសាចិន II', hour: 45, credit: 0),
];
