import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../Custom_AppBar.dart';
import '../../../../theme_builder.dart';
import '../Program_SHC/Program_SHC.dart';
import 'Custom_Build_Program_Detail.dart';

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
  late String selectedEducationName = '';
  late String selectedYearName = '';

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
          buildHeight5(),
          buildEducationNameButton(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(UPdMg10),
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                widget.majorInfoData['major_data'] != null
                    ? Text(
                        widget.majorInfoData['major_data'].firstWhere((degree) => degree['degree_name'] == selectedEducationName, orElse: () => {})['degree_detail']['major_info'] ?? 'គ្មានទិន្ន័យ'.tr,
                        textAlign: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
                        style: const TextStyle(
                          fontSize: UTitleSize,
                          fontFamily: UKFontFamily,
                          height: UTextHeight,
                        ),
                      )
                    : buildFutureBuilder(),
                buildHeight5(),
                buildGridview(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEducationNameButton() {
    return Container(
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
            highlightColor: UTransParentColor,
            splashColor: UTransParentColor,
            onTap: () => setState(
              () => selectedEducationName = educationName,
            ),
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.fromLTRB(
                UPdMg10,
                UPdMg10,
                isLastIndex ? UPdMg10 : UZeroPixel,
                UPdMg10,
              ),
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                color: educationName == selectedEducationName ? UPrimaryColor : UBackgroundColor,
                borderRadius: BorderRadius.circular(URoundedMedium),
                boxShadow: const [
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
                  color: educationName == selectedEducationName ? UBackgroundColor : UTextColor,
                  fontSize: UTitleSize,
                  fontWeight: UTitleWeight,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridview() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        childAspectRatio: 1.90,
      ),
      itemCount: (widget.majorInfoData['major_data'] != null &&
              widget.majorInfoData['major_data'] is List &&
              widget.majorInfoData['major_data'].isNotEmpty &&
              widget.majorInfoData['major_data'].any(
                (degree) => degree['degree_name'] == selectedEducationName,
              ))
          ? (widget.majorInfoData['major_data'].firstWhere(
              (degree) => degree['degree_name'] == selectedEducationName,
            )['degree_detail']['degree_data'] as List<dynamic>)
              .length
          : 0,
      itemBuilder: (context, index) {
        List<dynamic> degreeData = widget.majorInfoData['major_data'].firstWhere((degree) => degree['degree_name'] == selectedEducationName)['degree_detail']['degree_data'];

        if (degreeData.isNotEmpty) {
          Map<String, dynamic> yearData = degreeData[index];
          String yearName = yearData['year_name'];

          return buildYearNameCard(
            onTap: () {
              setState(
                () => selectedYearName = yearName,
              );
              Map<String, dynamic> selectedYearData = yearData['year_data'][0];

              if (selectedYearData.isNotEmpty) {
                Get.to(
                  () => Program_SHC(
                    majorName: widget.majorName,
                    educationName: selectedEducationName,
                    yearName: selectedYearName,
                    yearsData: yearData['year_data'],
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                );
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => buildYearNameDialog(),
                );
              }
            },
            yearName: yearName.tr,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
