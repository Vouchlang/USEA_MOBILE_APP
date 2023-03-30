import 'package:flutter/material.dart';


class I_Scholarship {
  late final String i_school_name;
  late final String i_educational_level;
  late final String i_major;
  late final String i_exprire;
  late final String i_expire_date;
  late final String i_link;

  I_Scholarship(
      {required this.i_school_name,
        required this.i_educational_level,
        required this.i_major,
        required this.i_exprire,
        required this.i_expire_date,
        required this.i_link});
}

List<I_Scholarship> i_scholarship = [
  I_Scholarship(
      i_school_name: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      i_educational_level: 'ថា្នក់បរិញ្ញាបត្រ',
      i_major: 'ព័ត៌មានវិទ្យា',
      i_exprire: 'ផុតកំណត់៖',
      i_expire_date: 'ថ្ងៃទី០៧ ខែកុម្ភៈ ឆ្នាំ២០២៣ វេលាម៉ោង១៧ និង៣០នាទី',
      i_link: 'https://www.usea.edu.kh/en/ButtomPages/scholarship.php'),
  I_Scholarship(
      i_school_name: 'បណ្ដាសាកលវិទ្យាល័យនៅប្រទេសចិន',
      i_educational_level: 'គ្រប់ថ្នាក់សិក្សា',
      i_major: 'គ្រប់ជំនាញ',
      i_exprire: 'ផុតកំណត់៖',
      i_expire_date: 'ថ្ងៃទី០៧ ខែកុម្ភៈ ឆ្នាំ២០២៣ វេលាម៉ោង១៧ និង៣០នាទី',
      i_link: 'https://www.usea.edu.kh/en/Pages/index.php'),
];