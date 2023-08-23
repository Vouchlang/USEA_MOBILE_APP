import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../theme_builder.dart';
import 'Program_Major_Detail_Main.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  List<Map<String, dynamic>>? programData;
  List<String> majorNames = [];
  List<String> filteredMajorNames = [];
  String searchQuery = '';

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(Get.locale?.languageCode == 'km'
          ? 'https://usea.edu.kh/api/webapi.php?action=study_program'
          : 'https://usea.edu.kh/api/webapi.php?action=study_program_en'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      final List<dynamic> programDataList = jsonData['program_data'];

      if (mounted) {
        setState(() {
          programData = List<Map<String, dynamic>>.from(programDataList);
          majorNames = [];
          for (final data in programData!) {
            final majorNamesForFaculty =
                (data['faculty_data']['major_name'] as List)
                    .map<String>((major) => major['major_name'] as String)
                    .toList();
            majorNames.addAll(majorNamesForFaculty);
          }
          filteredMajorNames = majorNames;
        });
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
              .where((major) =>
                  major.toLowerCase().contains(translatedQuery.toLowerCase()))
              .toList();
        });
      }
    });
  }

  Future<Map<String, dynamic>> fetchMajorInfoData(String majorName) async {
    try {
      // Replace this with your actual data fetching logic
      if (programData != null) {
        for (final faculty in programData!) {
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
        for (final faculty in programData!) {
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
        centerTitle: false,
        title: Text('កម្មវិធីសិក្សា'.tr,
            style: TextStyle(
              color: UPrimaryColor,
              fontSize: 18,
              fontWeight: UTitleWeight,
            )),
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
                ),
              );
            },
          ),
        ],
      ),
      body: programData == null || programData!.isEmpty
          ? Center(
              child: Center(
                child: FutureBuilder<void>(
                  future: Future.delayed(Duration(seconds: 3)),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? Text('គ្មានទិន្ន័យ'.tr)
                          : CircularProgressIndicator(),
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: UPdMg_10),
              itemCount: programData!.length,
              itemBuilder: (context, index) {
                final faculty = programData![index];
                final facultyName = faculty['faculty_name'];
                final majorNamesData = faculty['faculty_data']['major_name'];
                final facultyIcon = faculty['faculty_data']['fac_icon'];
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
                    UPdMg_10,
                    UPdMg_10,
                    UPdMg_10,
                    UZeroPixel,
                  ),
                  elevation: 2,
                  shadowColor: UGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UPdMg_10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: UPdMg_5),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: UPrimaryColor,
                        iconColor: UPrimaryColor,
                        textColor: UTextColor,
                        key: PageStorageKey(facultyName.toString().tr),
                        title: Row(
                          children: [
                            Image.network(
                              facultyIcon,
                              scale: 6,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            SizedBox(width: UPdMg_10),
                            Expanded(child: Text(facultyName.toString().tr)),
                          ],
                        ),
                        children: majorNamesData.map<Widget>((major) {
                          final majorName = major['major_name'];
                          final degreeDetails = major['major_data'];

                          return Container(
                            padding: EdgeInsets.fromLTRB(
                              UPdMg_15,
                              UZeroPixel,
                              UPdMg_15,
                              UPdMg_10,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MajorDetailsScreen(
                                      majorName: majorName,
                                      majorInfoData: major,
                                      educationNames: degreeDetails
                                          .map<String>((degree) =>
                                              degree['degree_name'] as String)
                                          .toList(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(URoundedMedium),
                                  border: Border.all(color: UBGLightBlue),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: UPdMg_8, horizontal: UPdMg_5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: Theme.of(context).primaryColor,
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
    );
  }
}

class MajorSearchDelegate extends SearchDelegate<String> {
  final List<String> majorNames;
  final List<String> filteredMajorNames;
  final Function(String) updateSearchQuery;
  final Future<Map<String, dynamic>> Function(String) fetchMajorInfoData;
  final Future<List<String>> Function(String) fetchEducationNames;

  MajorSearchDelegate({
    required this.majorNames,
    required this.filteredMajorNames,
    required this.updateSearchQuery,
    required this.fetchMajorInfoData,
    required this.fetchEducationNames,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          size: 18,
        ),
        color: UPrimaryColor,
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
      navigateToMajorDetails(context, majorName);
      return Container();
    }

    return ListView.builder(
      itemCount: filteredMajorNames.length,
      itemBuilder: (context, index) {
        final majorName = filteredMajorNames[index];

        return ListTile(
          title: Text(majorName),
          onTap: () {
            navigateToMajorDetails(context, majorName);
          },
        );
      },
    );
  }

  void navigateToMajorDetails(BuildContext context, String majorName) async {
    final majorInfoData = await fetchMajorInfoData(majorName);
    final educationNames = await fetchEducationNames(majorName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MajorDetailsScreen(
          majorName: majorName,
          majorInfoData: majorInfoData,
          educationNames: educationNames,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = majorNames
        .where((major) => major.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final majorName = suggestionList[index];
        return InkWell(
          onTap: () {
            navigateToMajorDetails(context, majorName);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(UPdMg_10, UPdMg_15, UPdMg_10, 0),
            child: Text(
              majorName.tr,
            ),
          ),
        );
      },
    );
  }

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
