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
    // Initialize selected education name with the first available education
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
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedEducationName = educationName;
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
                      widget.majorInfoData[selectedEducationName]
                              ['major_info'] ??
                          '',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: UTitleSize, fontFamily: UKFontFamily)),
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
                    itemCount: widget
                        .majorInfoData[selectedEducationName]['years'].length,
                    itemBuilder: (context, index) {
                      String yearName = widget
                          .majorInfoData[selectedEducationName]['years'].keys
                          .toList()[index];
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Program_SHC(
                                  majorName: widget.majorName,
                                  educationName: selectedEducationName,
                                  yearName: selectedYearName,
                                  semestersData: widget
                                          .majorInfoData[selectedEducationName]
                                      ['years'][yearName]['semesters'],
                                ),
                              ),
                            );
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
