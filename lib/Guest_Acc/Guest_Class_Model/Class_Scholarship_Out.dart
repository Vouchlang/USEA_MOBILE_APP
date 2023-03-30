import 'package:flutter/material.dart';


class O_Scholarship {
  late final String o_school_name;
  late final String o_educational_level;
  late final String o_major;
  late final String o_exprire;
  late final String o_expire_date;
  late final String o_link;

  O_Scholarship(
      {required this.o_school_name,
        required this.o_educational_level,
        required this.o_major,
        required this.o_exprire,
        required this.o_expire_date,
        required this.o_link});
}

List<O_Scholarship> o_scholarship = [
  O_Scholarship(
      o_school_name: 'បណ្ដាសាកលវិទ្យាល័យនៅប្រទេសចិន',
      o_educational_level: 'ថ្នាក់បរិញ្ញាបត្រ និងបរិញ្ញាបត្រជាន់ខ្ពស់',
      o_major: 'គ្រប់មុខជំនាញ',
      o_exprire: 'ផុតកំណត់៖',
      o_expire_date: 'ថ្ងៃទី០៧ ខែកុម្ភៈ ឆ្នាំ២០២៣ វេលាម៉ោង១៧ និង៣០នាទី',
      o_link: 'https://www.usea.edu.kh/en/ButtomPages/scholarship.php'),
  O_Scholarship(
      o_school_name: 'បណ្ដាសាកលវិទ្យាល័យនៅប្រទេសចិន',
      o_educational_level: 'ថ្នាក់បរិញ្ញាបត្រ និងបរិញ្ញាបត្រជាន់ខ្ពស់',
      o_major: 'គ្រប់មុខជំនាញ',
      o_exprire: 'ផុតកំណត់៖',
      o_expire_date: 'ថ្ងៃទី០៧ ខែកុម្ភៈ ឆ្នាំ២០២៣ វេលាម៉ោង១៧ និង៣០នាទី',
      o_link: 'https://www.usea.edu.kh/en/Pages/index.php'),
];