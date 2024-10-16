import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_AppBar.dart';
import '../../../../theme_builder.dart';
import '../../Class_Program/Class_Program_ACCA.dart';
import 'Custom_Build_Program_ACCA_SHC.dart';

class Program_ACCA extends StatelessWidget {
  final String majorName;
  final String course_hour;
  final List<Subject_Data> educationNames;
  Program_ACCA({
    super.key,
    required this.majorName,
    required this.course_hour,
    required this.educationNames,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: majorName.tr),
      body: buildListSHC(),
    );
  }

  Widget buildListSHC() {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: UPdMg5,
        vertical: UPdMg10,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        Card(
          elevation: 0.5,
          shadowColor: ULightGreyColor,
          color: UBackgroundColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: UBackgroundColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(URoundedLarge),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildRowTitle(),
              Container(
                padding: const EdgeInsets.fromLTRB(
                  UPdMg5,
                  UPdMg10,
                  UPdMg5,
                  UZeroPixel,
                ),
                child: Column(
                    children: educationNames.map((subject) {
                  return buildSubWeekHour(
                    index: subject.no.toString() + '.\t',
                    subjectName: subject.subject.toString().isEmpty
                        ? 'N/A'
                        : subject.subject.toString().tr,
                    subIndex: subject.no.isEmpty
                        ? 'N/A'
                        : subject.no.toString() + '.\t',
                    subHour: subject.hour_per_week.isEmpty
                        ? 'N/A'
                        : subject.hour_per_week.toString().tr +
                            '\tម៉ោង/សប្ដាហ៍'.tr,
                    week: subject.weeks.isEmpty
                        ? 'N/A'
                        : subject.weeks.toString(),
                    subTotalHour: subject.total_hour.isEmpty
                        ? 'N/A'
                        : subject.total_hour.toString(),
                  );
                }).toList()),
              ),
              buildCourseHour(
                course_hour.isEmpty ? 'N/A' : course_hour,
              ),
            ],
          ),
        )
      ],
    );
  }
}
