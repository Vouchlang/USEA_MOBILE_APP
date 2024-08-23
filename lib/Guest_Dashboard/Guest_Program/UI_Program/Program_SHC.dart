// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

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
      appBar: Custom_AppBar(
        title: widget.majorName.tr,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                UPdMg8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildSubjectList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSubjectList() {
    final subjectsData = widget.yearsData[0]['subject_data'] as List<dynamic>;
    String total_credit = widget.yearsData[0]['total_credit'] ?? 'N/A';
    int i = 1;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: UPdMg5,
                        ),
                        child: NoWeightTitleTheme(
                          index.toString() + '. ',
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: UPdMg15,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: UPdMg5,
                          ),
                          child: Text(
                            subject,
                            style: const TextStyle(
                              fontSize: UTitleSize,
                              fontWeight: UBodyWeight,
                              color: UTextColor,
                              height: UTextHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildWidth15(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: UPdMg5,
                  ),
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(
                    right: UPdMg15,
                  ),
                  child: NoWeightTitleTheme(
                    credit.toString().isEmpty || credit == null
                        ? 'N/A'
                        : credit,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();

    return [
      Card(
        elevation: 1,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            URoundedLarge,
          ),
        ),
        color: UBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: UPdMg15,
                horizontal: UPdMg5,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    UPdMg10,
                  ),
                ),
                color: UBGLightBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTheme(
                    'មុខវិជ្ជា'.tr,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 55,
                    child: TitleTheme(
                      'ក្រេឌីត'.tr,
                    ),
                  ),
                ],
              ),
            ),
            ...subjectWidgets,
            Container(
              padding: const EdgeInsets.fromLTRB(
                UPdMg5,
                UPdMg15,
                UPdMg5,
                UPdMg15,
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTheme(
                    'សរុប'.tr,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(
                      right: UPdMg15,
                    ),
                    child: TitleTheme(
                      total_credit.toString().isEmpty || total_credit == null
                          ? 'N/A'
                          : total_credit.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
