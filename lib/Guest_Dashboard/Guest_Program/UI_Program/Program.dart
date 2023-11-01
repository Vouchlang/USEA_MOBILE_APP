// ignore_for_file: override_on_non_overriding_member, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_Program/Class_Program_ACCA.dart';
import 'Program_ACCA.dart';
import 'Program_Major_Detail_Main.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  late List<Map<String, dynamic>> programData = [];
  List<String> majorNames = [];
  List<String> filteredMajorNames = [];
  List<ProgramACCA> programACCA = [];

  String searchQuery = '';

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
        Get.locale?.languageCode == 'km'
            ? APIUrlGuest + 'api/webapi.php?action=study_program_kh'
            : APIUrlGuest + 'api/webapi.php?action=study_program_en',
      ),
    );

    final response_acca = await http.get(
      Uri.parse(
        Get.locale?.languageCode == 'km'
            ? APIUrlGuest + 'api/webapi.php?action=acca_kh'
            : APIUrlGuest + 'api/webapi.php?action=acca_en',
      ),
    );

    if (response.statusCode == 200 && response_acca.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> programDataList = jsonData['program_data'];

      // Acca
      final Map<String, dynamic> jsonData_ACCA =
          json.decode(response_acca.body);

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
                subject_data: subject_data);

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
              final majorNamesForFaculty =
                  (data['faculty_data']['major_name'] as List)
                      .map<String>((major) => major['major_name'] as String)
                      .toList();
              majorNames.addAll(majorNamesForFaculty);
            }
            for (final program in programACCA) {
              majorNames.addAll(
                program.fac_data.expand(
                  (facultyData) => facultyData.major_data
                      .map((majorData) => majorData.major_name),
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
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
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
      // Replace this with your actual data fetching logic
      if (programData != null) {
        for (final faculty in programData) {
          final majorNamesData = faculty['faculty_data']['major_name'] as List;
          for (final major in majorNamesData) {
            final majorNameValue = major['major_name'] as String;
            if (majorNameValue == majorName) {
              return major; // Return the major information data
            }
          }
        }
      }
      return {}; // Return an empty map if data not found
    } catch (e) {
      // Handle exceptions
      print('Error during major info data fetching: $e');
      return {}; // Return an empty map in case of errors
    }
  }

  Future<List<String>> fetchEducationNames(String majorName) async {
    try {
      if (programData != null) {
        for (final faculty in programData) {
          final majorNamesData = faculty['faculty_data']['major_name'] as List;
          for (final major in majorNamesData) {
            final majorNameValue = major['major_name'] as String;
            if (majorNameValue == majorName) {
              final degreeData = major['major_data'] as List;
              final educationNames = degreeData
                  .map<String>((data) => data['degree_name'] as String)
                  .toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          'កម្មវិធីសិក្សា'.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: UFontSize18,
            fontWeight: UTitleWeight,
          ),
        ),
        backgroundColor: UBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: UPrimaryColor,
            onPressed: () {
              showSearch(
                context: context,
                delegate: MajorSearchDelegate(
                  majorNames: majorNames,
                  updateSearchQuery: updateSearchQuery,
                  filteredMajorNames: filteredMajorNames,
                  fetchEducationNames: fetchEducationNames,
                  fetchMajorInfoData: fetchMajorInfoData,
                  programACCA: programACCA,
                ),
              );
            },
          ),
        ],
      ),
      body: (programData == null || programData.isEmpty) && programACCA.isEmpty
          ? buildFutureBuild()
          : SingleChildScrollView(
              child: Column(
                children: [
                  programData.isEmpty
                      ? SizedBox.shrink()
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: programData.length,
                          padding: EdgeInsets.only(bottom: UZeroPixel),
                          itemBuilder: (context, index) {
                            final faculty = programData[index];
                            final facultyName = faculty['faculty_name'];
                            final majorNamesData =
                                faculty['faculty_data']['major_name'];
                            final facultyIcon =
                                faculty['faculty_data']['fac_icon'];
                            if (facultyIcon == null) {
                              Icon(
                                Icons.error,
                                size: 2,
                                color: UPrimaryColor,
                              );
                            }
                            return Card(
                              color: UBackgroundColor,
                              margin: EdgeInsets.fromLTRB(
                                UPdMg10,
                                UPdMg10,
                                UPdMg10,
                                UZeroPixel,
                              ),
                              elevation: 2,
                              shadowColor: UGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  URoundedLarge,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: UPdMg5,
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: UTransParentColor,
                                  ),
                                  child: ExpansionTile(
                                    collapsedIconColor: UPrimaryColor,
                                    iconColor: UPrimaryColor,
                                    textColor: UTextColor,
                                    key: PageStorageKey(
                                      facultyName.toString().tr,
                                    ),
                                    title: Row(
                                      children: [
                                        Image.network(
                                          facultyIcon,
                                          scale: 6,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: UWidth10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            facultyName.toString().tr,
                                          ),
                                        ),
                                      ],
                                    ),
                                    children:
                                        majorNamesData.map<Widget>((major) {
                                      final majorName = major['major_name'];
                                      final degreeDetails = major['major_data'];

                                      return Container(
                                        padding: EdgeInsets.fromLTRB(
                                          UPdMg15,
                                          UZeroPixel,
                                          UPdMg15,
                                          UPdMg10,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => MajorDetailsScreen(
                                                majorName: majorName,
                                                majorInfoData: major,
                                                educationNames: degreeDetails
                                                    .map<String>((degree) =>
                                                        degree['degree_name']
                                                            as String)
                                                    .toList(),
                                              ),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: Duration(
                                                milliseconds: 100,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                URoundedMedium,
                                              ),
                                              border: Border.all(
                                                color: UBGLightBlue,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: UPdMg8,
                                              horizontal: UPdMg5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    majorName.toString().tr,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: UTitleSize,
                                                      color: UTextColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: UWidth15,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 14,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                  programACCA.isEmpty
                      ? SizedBox.shrink()
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: programACCA.length,
                          padding: EdgeInsets.only(
                            bottom: UPdMg10,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            final program = programACCA[index];
                            final fac_icon = program.fac_data[0].fac_icon;
                            return Card(
                              color: UBackgroundColor,
                              margin: EdgeInsets.fromLTRB(
                                UPdMg10,
                                UPdMg10,
                                UPdMg10,
                                UZeroPixel,
                              ),
                              elevation: 2,
                              shadowColor: UGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  URoundedLarge,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: UPdMg5,
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: UTransParentColor,
                                  ),
                                  child: ExpansionTile(
                                    collapsedIconColor: UPrimaryColor,
                                    iconColor: UPrimaryColor,
                                    textColor: UTextColor,
                                    key: PageStorageKey(
                                      program.fac_name.toString().tr,
                                    ),
                                    title: Row(
                                      children: [
                                        Image.network(
                                          fac_icon,
                                          scale: UScale6,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: UWidth10,
                                        ),
                                        Text(
                                          program.fac_name,
                                        ),
                                      ],
                                    ),
                                    children: program.fac_data.map((major) {
                                      final majorData = major.major_data[index];
                                      return Container(
                                        padding: EdgeInsets.fromLTRB(
                                          UPdMg15,
                                          UZeroPixel,
                                          UPdMg15,
                                          UPdMg10,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => Program_ACCA(
                                                majorName: majorData.major_name,
                                                course_hour:
                                                    majorData.course_hour,
                                                educationNames:
                                                    majorData.subject_data,
                                              ),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: Duration(
                                                milliseconds: 100,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                URoundedMedium,
                                              ),
                                              border: Border.all(
                                                color: UBGLightBlue,
                                              ),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: UPdMg8,
                                              horizontal: UPdMg5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    majorData.major_name
                                                        .toString()
                                                        .tr,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: UTitleSize,
                                                      color: UTextColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: UWidth15,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 14,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
    );
  }
}

class MajorSearchDelegate extends SearchDelegate<String> {
  final List<String> majorNames;
  final List<String> filteredMajorNames;
  final Function(String) updateSearchQuery;
  final Function(String) fetchEducationNames;
  final Function(String) fetchMajorInfoData;
  final List<ProgramACCA> programACCA;

  MajorSearchDelegate({
    required this.majorNames,
    required this.filteredMajorNames,
    required this.updateSearchQuery,
    required this.fetchEducationNames,
    required this.fetchMajorInfoData,
    required this.programACCA,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: () {
          query = '';
          updateSearchQuery(query);
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    updateSearchQuery(query);

    if (filteredMajorNames.length == 1) {
      final majorName = filteredMajorNames[0];
      navigateToMajorDetails(
        context,
        majorName,
      );
      return Container();
    }

    final regularProgramResults = filteredMajorNames
        .where(
          (major) =>
              major.toLowerCase().contains(query.toLowerCase()) &&
              !major.contains('ACCA'),
        ) // Filter regular program results
        .toList();

    final accaProgramResults = filteredMajorNames
        .where(
          (major) =>
              major.toLowerCase().contains(query.toLowerCase()) &&
              major.contains('ACCA'),
        ) // Filter ACCA program results
        .toList();

    return Column(
      children: [
        // Regular Program Section
        if (regularProgramResults.isNotEmpty)
          _buildSection(
            title: 'Regular Programs',
            results: regularProgramResults,
          ),

        // ACCA Program Section
        if (accaProgramResults.isNotEmpty)
          _buildSection(
            title: 'ACCA Programs',
            results: accaProgramResults,
          ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> results,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(
            UPdMg8,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: UFontSize18,
              color: UPrimaryColor,
            ),
          ),
        ),
        ListView.builder(
          itemCount: results.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final majorName = results[index];
            return ListTile(
              title: Text(majorName),
              onTap: () {
                navigateToMajorDetails(
                  context,
                  majorName,
                );
              },
            );
          },
        ),
      ],
    );
  }

  Future<void> navigateToMajorDetails(
      BuildContext context, String majorName) async {
    if (majorName.contains('ACCA')) {
      // Handle navigation for ACCA programs
      final programACCAObj = programACCA.firstWhere(
        (program) => program.fac_data.any(
          (facultyData) => facultyData.major_data.any(
            (majorData) => majorData.major_name == majorName,
          ),
        ),
      );

      final majorData = programACCAObj.fac_data
          .expand((facultyData) => facultyData.major_data)
          .firstWhere(
            (majorData) => majorData.major_name == majorName,
          );

      Get.to(
        () => Program_ACCA(
          majorName: majorData.major_name,
          course_hour: majorData.course_hour,
          educationNames: majorData.subject_data,
        ),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(
          milliseconds: 100,
        ),
      );
    } else {
      // Handle navigation for regular programs
      final majorInfoData = await fetchMajorInfoData(majorName);
      final educationNames = await fetchEducationNames(majorName);

      if (majorInfoData != null && educationNames != null) {
        Get.to(
          () => MajorDetailsScreen(
            majorName: majorName,
            majorInfoData: majorInfoData,
            educationNames: educationNames,
          ),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(
            milliseconds: 100,
          ),
        );
      } else {
        Center(
          child: Text(
            'គ្មានទិន្ន័យ'.tr,
          ),
        );
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = majorNames
        .where(
          (major) => major.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final majorName = suggestionList[index];

        return ListTile(
          title: Text(
            majorName,
          ),
          onTap: () {
            navigateToMajorDetails(
              context,
              majorName,
            );
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: UBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        centerTitle: false,
        titleSpacing: -10,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        fillColor: UBackgroundColor,
        activeIndicatorBorder: BorderSide(
          color: UPrimaryColor,
        ),
        filled: true,
        hintStyle: TextStyle(
          fontSize: UFontSize18,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => '\tស្វែងរកមុខជំនាញ'.tr;

  @override
  Color get searchIndicatorLabel => UPrimaryColor;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: UPrimaryColor,
        size: 18,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }
}
