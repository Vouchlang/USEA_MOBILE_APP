import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_AppBar.dart';
import '../../../../theme_builder.dart';
import 'Custom_Build_ProgramSHC.dart';

class Program_SHC extends StatefulWidget {
  final String majorName, educationName, yearName;
  final List<dynamic> yearsData;

  Program_SHC({
    required this.majorName,
    required this.educationName,
    required this.yearName,
    required this.yearsData,
  });

  @override
  _Program_SHCState createState() => _Program_SHCState();
}

class _Program_SHCState extends State<Program_SHC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: widget.majorName.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: UPdMg10,
          horizontal: UPdMg8,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildSubjectList(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSubjectList() {
    late final subjectsData =
        widget.yearsData[0]['subject_data'] as List<dynamic>;
    late final String total_credit =
        widget.yearsData[0]['total_credit'] ?? 'N/A';
    late int i = 1;

    var subjectWidgets = subjectsData.map<Widget>((subjectData) {
      var subject = subjectData['Subject'];
      var credit = subjectData['Credit'];
      final index = i++;

      return Container(
        padding: const EdgeInsets.fromLTRB(
          UPdMg5,
          UPdMg10,
          UPdMg5,
          UZeroPixel,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRowData(
              index: index.toString() + '.\t',
              subjectName: subject,
              credit:
                  credit.toString().isEmpty || credit == null ? 'N/A' : credit,
            ),
          ],
        ),
      );
    }).toList();

    return [
      Card(
        elevation: 0.5,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: UBackgroundColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(URoundedLarge),
        ),
        color: UBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitleSHC(),
            ...subjectWidgets,
            buildTotalCredit(
              total_credit.toString().isEmpty ? 'N/A' : total_credit.toString(),
            )
          ],
        ),
      ),
    ];
  }
}
