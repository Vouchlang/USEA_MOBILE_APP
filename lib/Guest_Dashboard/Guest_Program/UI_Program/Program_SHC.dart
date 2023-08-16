import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

class Program_SHC extends StatefulWidget {
  final String majorName;
  final String educationName;
  final String yearName;
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
  String selectedSemesterName = '';

  @override
  void initState() {
    super.initState();
    if (widget.yearsData.isNotEmpty) {
      selectedSemesterName = widget.yearsData[0]['semester_name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: widget.majorName.tr),
      body: Column(
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.yearsData.length,
              itemBuilder: (context, index) {
                var yearData = widget.yearsData[index] as Map<dynamic, dynamic>;
                var semesterName = yearData['semester_name'];
                final isLastIndex = index == widget.yearsData.length - 1;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedSemesterName = semesterName;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.fromLTRB(
                        UPdMg_10, UPdMg_10, isLastIndex ? 10 : 0, UPdMg_10),
                    padding: EdgeInsets.all(UPdMg_10),
                    width: 165,
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
                      semesterName.toString().tr,
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(UPdMg_10),
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
    var selectedYearData = widget.yearsData.firstWhere((yearData) {
      if (yearData is Map<dynamic, dynamic>) {
        return yearData['semester_name'] == selectedSemesterName;
      }
      return false;
    }, orElse: () => {});

    if (selectedYearData.isEmpty) {
      return [
        Text('No information available for the selected semester.'),
      ];
    }

    var semesterData = selectedYearData['semester_data'] as List<dynamic>;

    var subjectWidgets = semesterData.map<Widget>((subjectData) {
      var subject = subjectData['Subject'];
      var hour = subjectData['Hour'];
      var credit = subjectData['Credit'];

      return Container(
        padding: EdgeInsets.symmetric(vertical: UPdMg_5, horizontal: UPdMg_5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                subject,
                style: TextStyle(
                  height: 1.5,
                  fontSize: UTitleSize,
                  fontWeight: UBodyWeight,
                  color: UTextColor,
                  fontFamily: UKFontFamily,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 55,
                  child: NoWeightTitleTheme(text: hour.toString()),
                ),
                SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  margin: EdgeInsets.only(right: UPdMg_10),
                  child: NoWeightTitleTheme(text: credit.toString()),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();

    int totalHours = 0;
    int totalCredits = 0;

    semesterData.forEach((subjectData) {
      var hour = subjectData['Hour'];
      var credit = subjectData['Credit'];
      totalHours += int.parse(hour ?? '0');
      totalCredits += int.parse(credit ?? '0');
    });

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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ...subjectWidgets,
            Container(
              padding:
                  EdgeInsets.fromLTRB(UPdMg_5, UPdMg_10, UPdMg_5, UPdMg_15),
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
                        width: 55,
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
