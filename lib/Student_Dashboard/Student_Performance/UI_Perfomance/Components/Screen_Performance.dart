// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_Performance/Class_Data_performance.dart';
import 'Dialog_performance.dart';

class Card_learning_pro_1 extends StatelessWidget {
  const Card_learning_pro_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildSemesterPerformance(
          semester: 'ឆមាសទី 1',
          itemCount: class_program_Score_s1.length,
          subject: class_program_Score_s1.map((e) => e.subject).toList(),
          dialog1: CustomAttDialog(),
          attend: class_program_Score_s1.map((e) => e.att).toList(),
          dialog2: CustomScoreDialog(),
          score: class_program_Score_s1.map((e) => e.score).toList(),
          totalScore: class_program_Score_s1
              .fold(
                0.0,
                (sum, data) =>
                    sum + (data.score) / class_program_Score_s1.length,
              )
              .toString()
              .substring(0, 5),
          rank: (class_program_Score_s1.indexWhere(
                      (data) => data.score == class_program_Score_s1[0].score) +
                  1)
              .toString(),
          gpa: (class_program_Score_s1.fold(
                    0.0,
                    (sum, data) =>
                        sum + (data.score) / class_program_Score_s1.length,
                  ) /
                  113)
              .toStringAsFixed(2),
        ),
        BuildSemesterPerformance(
          semester: 'ឆមាសទី 2',
          itemCount: class_program_Score_s2.length,
          subject: class_program_Score_s2.map((e) => e.subject).toList(),
          dialog1: CustomAttDialog(),
          attend: class_program_Score_s2.map((e) => e.att).toList(),
          dialog2: CustomScoreDialog(),
          score: class_program_Score_s2.map((e) => e.score).toList(),
          totalScore: class_program_Score_s2
              .fold(
                0.0,
                (sum, data) =>
                    sum + (data.score) / class_program_Score_s2.length,
              )
              .toString()
              .substring(0, 5),
          rank: (class_program_Score_s2.indexWhere(
                      (data) => data.score == class_program_Score_s2[0].score) +
                  1)
              .toString(),
          gpa: (class_program_Score_s2.fold(
                    0.0,
                    (sum, data) =>
                        sum + (data.score) / class_program_Score_s2.length,
                  ) /
                  113)
              .toStringAsFixed(2),
        ),
      ],
    );
  }
}
