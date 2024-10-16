import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'Custom_Build_Program.dart';
import 'dart:convert';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../../Guest_API.dart';
import '../../Class_Program/Class_Program_ACCA.dart';
import 'Major_Search.dart';
import '../Program_SHC_ACCA/Program_ACCA.dart';
import '../Program_Detail/Program_Major_Detail_Main.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  late List<Map<String, dynamic>> programData = [];
  late List<String> majorNames = [];
  late List<String> filteredMajorNames = [];
  late List<ProgramACCA> programACCA = [];
  late String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        titleSpacing: UZeroPixel,
        centerTitle: false,
        title: Text(
          'កម្មវិធីសិក្សា'.tr,
          style: const TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
        surfaceTintColor: UBackgroundColor,
        backgroundColor: UBackgroundColor,
        shadowColor: ULightGreyColor,
        elevation: 1,
        scrolledUnderElevation: 1,
        iconTheme: const IconThemeData.fallback(),
        leading: buildBackBtn(
          () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: UPrimaryColor,
            onPressed: () => showSearch(
              context: context,
              delegate: MajorSearchDelegate(
                majorNames: majorNames,
                updateSearchQuery: updateSearchQuery,
                filteredMajorNames: filteredMajorNames,
                fetchEducationNames: fetchEducationNames,
                fetchMajorInfoData: fetchMajorInfoData,
                programACCA: programACCA,
              ),
            ),
          ),
        ],
      ),
      body: programData.isEmpty && programACCA.isEmpty
          ? buildFutureBuilder()
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                programData.isEmpty ? const SizedBox.shrink() : buildProgram(),
                programACCA.isEmpty ? const SizedBox.shrink() : buildProgramACCA(),
              ],
            ),
    );
  }

  Widget buildProgram() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: programData.length,
      padding: const EdgeInsets.only(top: UPdMg5),
      itemBuilder: (context, index) {
        final faculty = programData[index];
        final facultyName = faculty['faculty_name'];
        final majorNamesData = faculty['faculty_data']['major_name'];
        final facultyIcon = faculty['faculty_data']['fac_icon'];
        if (facultyIcon == null) {
          const Icon(
            Icons.error,
            size: 2,
            color: UPrimaryColor,
          );
        }
        return buildProgramCard(
            themeData: Theme.of(context).copyWith(dividerColor: UTransParentColor),
            facKey: facultyName.toString().tr,
            facultyIcon: facultyIcon,
            facultyName: facultyName,
            dynamicData: majorNamesData.map<Widget>((major) {
              final majorName = major['major_name'];
              final degreeDetails = major['major_data'];
              return Container(
                padding: const EdgeInsets.fromLTRB(
                  UPdMg15,
                  UZeroPixel,
                  UPdMg15,
                  UPdMg10,
                ),
                child: buildMajorNav(
                  onTap: () => Get.to(
                    () => MajorDetailsScreen(
                      majorName: majorName,
                      majorInfoData: major,
                      educationNames: degreeDetails
                          .map<String>(
                            (degree) => degree['degree_name'] as String,
                          )
                          .toList(),
                    ),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 100),
                  ),
                  majorName: majorName.toString().tr,
                ),
              );
            }).toList());
      },
    );
  }

  Widget buildProgramACCA() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: programACCA.length,
      padding: const EdgeInsets.only(bottom: UPdMg15),
      itemBuilder: (BuildContext context, index) {
        final program = programACCA[index];
        final fac_icon = program.fac_data[index].fac_icon;
        return buildProgramCard(
          themeData: Theme.of(context).copyWith(dividerColor: UTransParentColor),
          facKey: program.fac_name.toString().tr,
          facultyIcon: fac_icon,
          facultyName: program.fac_name,
          dynamicData: program.fac_data.map((major) {
            final majorData = major.major_data[index];
            return Container(
              padding: const EdgeInsets.fromLTRB(
                UPdMg15,
                UZeroPixel,
                UPdMg15,
                UPdMg10,
              ),
              child: buildMajorNav(
                onTap: () => Get.to(
                  () => Program_ACCA(
                    majorName: majorData.major_name,
                    course_hour: majorData.course_hour,
                    educationNames: majorData.subject_data,
                  ),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 100),
                ),
                majorName: majorData.major_name.toString().tr,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIGuestProgramKh : APIGuestProgramEn,
        ),
      );

      final response_acca = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIGuestProgramACCAKh : APIGuestProgramACCAEn,
        ),
      );

      if (response.statusCode == 200 && response_acca.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> programDataList = jsonData['program_data'];

        // Acca
        final Map<String, dynamic> jsonData_ACCA = json.decode(response_acca.body);

        List<ProgramACCA> accaList = [];

        jsonData_ACCA['program_acca']?.forEach((facData) {
          List<Faculty_Data> fac_data = [];

          facData['faculty_data']?.forEach((majorData) {
            List<Major_Data> major_data = [];

            majorData['major_data']?.forEach((subjectData) {
              List<Subject_Data> subject_data = [];

              subjectData['subject_data']?.forEach((data) {
                Subject_Data subObj = Subject_Data(
                  no: data['No'] ?? 'N/A',
                  subject: data['subject'] ?? 'N/A',
                  hour_per_week: data['hour_per_week'] ?? 'N/A',
                  weeks: data['weeks'] ?? 'N/A',
                  total_hour: data['total_hour'] ?? 'N/A',
                );

                subject_data.add(subObj);
              });

              Major_Data majorObj = Major_Data(
                major_name: subjectData['major_name'] ?? 'N/A',
                course_hour: subjectData['course_hour'] ?? 'N/A',
                subject_data: subject_data,
              );

              major_data.add(majorObj); // Add majorObj to major_data
            });

            Faculty_Data facObj = Faculty_Data(
              fac_icon: majorData['fac_icon'] ?? 'N/A',
              major_data: major_data,
            );

            fac_data.add(facObj); // Add facObj to fac_data
          });

          ProgramACCA programacca = ProgramACCA(
            fac_name: facData['faculty_name'] ?? 'N/A',
            fac_data: fac_data,
          );

          accaList.add(programacca);
        });

        if (mounted) {
          setState(
            () {
              programACCA = accaList;
              programData = List<Map<String, dynamic>>.from(programDataList);
              majorNames = [...majorNames];
              for (final data in programData) {
                final majorNamesForFaculty = (data['faculty_data']['major_name'] as List).map<String>((major) => major['major_name'] as String).toList();
                majorNames.addAll(majorNamesForFaculty);
              }
              for (final program in programACCA) {
                majorNames.addAll(
                  program.fac_data.expand(
                    (facultyData) => facultyData.major_data.map((majorData) => majorData.major_name),
                  ),
                );
              }
              filteredMajorNames = majorNames;
            },
          );
        }
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Failed to fetch program: $e');
    }
  }

  void updateSearchQuery(String query) {
    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() {
          searchQuery = query;
          final translatedQuery = query.tr;
          filteredMajorNames = majorNames
              .where(
                (major) => major.toLowerCase().contains(
                      translatedQuery.toLowerCase(),
                    ),
              )
              .toList();
        });
      }
    });
  }

  Future<Map<String, dynamic>> fetchMajorInfoData(String majorName) async {
    try {
      if (programData.isNotEmpty) {
        for (final faculty in programData) {
          final majorNamesData = faculty['faculty_data']['major_name'] as List;
          for (final major in majorNamesData) {
            final majorNameValue = major['major_name'] as String;
            if (majorNameValue == majorName) {
              return major;
            }
          }
        }
      }
      return {};
    } catch (e) {
      // Handle exceptions
      print('Error during major info data fetching: $e');
      return {}; // Return an empty map in case of errors
    }
  }

  Future<List<String>> fetchEducationNames(String majorName) async {
    try {
      if (programData.isNotEmpty) {
        for (final faculty in programData) {
          final majorNamesData = faculty['faculty_data']['major_name'] as List;
          for (final major in majorNamesData) {
            final majorNameValue = major['major_name'] as String;
            if (majorNameValue == majorName) {
              final degreeData = major['major_data'] as List;
              final educationNames = degreeData.map<String>((data) => data['degree_name'] as String).toList();
              return educationNames;
            }
          }
        }
      }
      return [];
    } catch (e) {
      // Handle exceptions
      print('Error during data fetching: $e');
      return [];
    }
  }
}
