import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

class Program_SHC extends StatefulWidget {
  final String majorName;
  final String educationName;
  final String yearName;
  final Map<String, dynamic> semestersData;

  Program_SHC({
    required this.majorName,
    required this.educationName,
    required this.yearName,
    required this.semestersData,
  });

  @override
  _Program_SHCState createState() => _Program_SHCState();
}

class _Program_SHCState extends State<Program_SHC> {
  String selectedSemesterName = '';

  @override
  void initState() {
    super.initState();
    // Initialize selected semester name with the first available semester
    selectedSemesterName = widget.semestersData.keys.toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: widget.majorName.tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.semestersData.length,
                itemBuilder: (context, index) {
                  String semesterName =
                      widget.semestersData.keys.toList()[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedSemesterName = semesterName;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(
                        vertical: UPdMg_10,
                        horizontal: UPdMg_5,
                      ),
                      padding: EdgeInsets.all(UPdMg_10),
                      width: 175,
                      decoration: BoxDecoration(
                        color: selectedSemesterName == semesterName
                            ? UPrimaryColor
                            : UBackgroundColor,
                        borderRadius: BorderRadius.circular(UPdMg_5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: UGreyColor,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: Text(
                        semesterName.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedSemesterName == semesterName
                              ? UBackgroundColor
                              : UTextColor,
                          fontSize: UTitleSize,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (widget.semestersData.containsKey(selectedSemesterName))
              ..._buildSubjectWidgets(
                  widget.semestersData[selectedSemesterName]['subjects']),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSubjectWidgets(List<dynamic>? subjectsData) {
    if (subjectsData == null || subjectsData.isEmpty) {
      return [];
    }

    int totalHours = 0;
    int totalCredits = 0;
    for (var subjectData in subjectsData) {
      String subjectHour = subjectData['Hour'] ?? '0';
      String subjectCredit = subjectData['Credit'] ?? '0';
      totalHours += int.parse(subjectHour);
      totalCredits += int.parse(subjectCredit);
    }

    return [
      Card(
        elevation: 2,
        shadowColor: ULightGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(URoundedLarge),
        ),
        margin: EdgeInsets.all(UPdMg_10),
        color: UBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: UPdMg_15,
                horizontal: UPdMg_5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                color: UBGLightBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTheme(
                    text: 'មុខវិជ្ជា'.tr,
                  ),
                  Row(
                    children: [
                      TitleTheme(
                        text: 'ម៉ោង'.tr,
                      ),
                      SizedBox(width: 15),
                      TitleTheme(
                        text: 'ក្រេឌីត'.tr,
                      )
                    ],
                  )
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.all(UPdMg_5),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subjectsData.length,
              itemBuilder: (context, index) {
                String subjectName = subjectsData[index]['Subject'] ?? '';
                String subjectHour = subjectsData[index]['Hour'] ?? '0';
                String subjectCredit = subjectsData[index]['Credit'] ?? '0';

                return Container(
                  padding: EdgeInsets.symmetric(vertical: UPdMg_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NoWeightTitleTheme(text: subjectName),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 30,
                              child: NoWeightTitleTheme(
                                  text: subjectHour.toString())),
                          SizedBox(width: 10),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            margin: EdgeInsets.only(right: UPdMg_10),
                            child: NoWeightTitleTheme(
                              text: subjectCredit.toString(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTheme(
                    text: 'សរុប'.tr,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        alignment: Alignment.center,
                        child: TitleTheme(text: totalHours.toString()),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: UPdMg_10),
                        child: TitleTheme(text: totalCredits.toString()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
