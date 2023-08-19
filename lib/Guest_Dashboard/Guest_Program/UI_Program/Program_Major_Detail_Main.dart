import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import 'Program_SHC.dart';

class MajorDetailsScreen extends StatefulWidget {
  final String majorName;
  final Map<String, dynamic> majorInfoData;
  final List<String> educationNames;

  MajorDetailsScreen({
    required this.majorName,
    required this.majorInfoData,
    required this.educationNames,
  });

  @override
  _MajorDetailsScreenState createState() => _MajorDetailsScreenState();
}

class _MajorDetailsScreenState extends State<MajorDetailsScreen> {
  String selectedEducationName = '';
  String selectedYearName = '';

  @override
  void initState() {
    super.initState();
    if (widget.educationNames.isNotEmpty) {
      selectedEducationName = widget.educationNames[0];
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
              itemCount: widget.educationNames.length,
              itemBuilder: (context, index) {
                String educationName = widget.educationNames[index];
                final isLastIndex = index == widget.educationNames.length - 1;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedEducationName = educationName;
                    });
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.fromLTRB(
                        UPdMg_10, UPdMg_10, isLastIndex ? 10 : 0, UPdMg_10),
                    padding: EdgeInsets.all(UPdMg_10),
                    width: 165,
                    decoration: BoxDecoration(
                      color: educationName == selectedEducationName
                          ? UPrimaryColor
                          : UBackgroundColor,
                      borderRadius: BorderRadius.circular(URoundedMedium),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: ULightGreyColor,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Text(
                      educationName.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: educationName == selectedEducationName
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
                children: [
                  Text(
                    (widget.majorInfoData['major_data'] != null)
                        ? (widget.majorInfoData['major_data'].firstWhere(
                                    (degree) =>
                                        degree['degree_name'] ==
                                        selectedEducationName,
                                    orElse: () => {})['degree_detail']
                                ['major_info'] ??
                            'No major information available')
                        : 'No major information available',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: UTitleSize, fontFamily: UKFontFamily),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1.90,
                    ),
                    itemCount: (widget.majorInfoData['major_data'] != null &&
                            widget.majorInfoData['major_data'] is List &&
                            widget.majorInfoData['major_data'].isNotEmpty &&
                            widget.majorInfoData['major_data'].any(
                              (degree) =>
                                  degree['degree_name'] ==
                                  selectedEducationName,
                            ))
                        ? (widget.majorInfoData['major_data'].firstWhere(
                            (degree) =>
                                degree['degree_name'] == selectedEducationName,
                          )['degree_detail']['degree_data'] as List<dynamic>)
                            .length
                        : 0,
                    itemBuilder: (context, index) {
                      List<dynamic> degreeData = widget
                              .majorInfoData['major_data']
                              .firstWhere((degree) =>
                                  degree['degree_name'] ==
                                  selectedEducationName)['degree_detail']
                          ['degree_data'];

                      if (degreeData != null && degreeData.isNotEmpty) {
                        Map<String, dynamic> yearData = degreeData[index];
                        String yearName = yearData['year_name'];

                        return Card(
                          elevation: 2,
                          color: UBackgroundColor,
                          shadowColor: ULightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(URoundedLarge),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedYearName = yearName;
                              });
                              Map<String, dynamic> selectedYearData =
                                  yearData['year_data'][0];

                              if (selectedYearData != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Program_SHC(
                                      majorName: widget.majorName,
                                      educationName: selectedEducationName,
                                      yearName: selectedYearName,
                                      yearsData: yearData['year_data'],
                                    ),
                                  ),
                                );
                              } else {
                                // Handle the case where selectedYearData is null or not available
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 7),
                                NormalTitleTheme(text: yearName.tr)
                              ],
                            ),
                          ),
                        );
                      } else {
                        return SizedBox
                            .shrink(); // Return an empty widget if degreeData is null
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
