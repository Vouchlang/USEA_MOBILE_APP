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
  Map<String, dynamic>? programData;
  List<String> majorNames = [];
  List<String> filteredMajorNames = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.51/hosting_api/Test_student/guest_program_testing.php'),
    );

    if (response.statusCode == 200) {
      setState(() {
        programData = jsonDecode(response.body)['program_data'];
        majorNames = programData!.values
            .expand((majorData) => majorData.keys)
            .toList()
            .cast<String>();

        filteredMajorNames = majorNames;
      });
    } else {
      // Handle errors
      print('Failed to load data');
    }
  }

  void performSearch(String query) {
    setState(() {
      filteredMajorNames = majorNames
          .where((majorName) =>
              majorName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
            icon: Icon(
              Icons.search,
              color: UPrimaryColor,
              size: 20,
            ),
            onPressed: () async {
              final selectedMajorName = await showSearch(
                context: context,
                delegate: MajorSearchDelegate(filteredMajorNames,
                    programData: programData),
              );

              if (selectedMajorName != null) {
                // Get the faculty name associated with the selected major name
                String? facultyName;
                programData?.forEach((key, value) {
                  if (value.containsKey(selectedMajorName)) {
                    facultyName = key;
                  }
                });

                if (facultyName != null) {
                  Map<String, dynamic>? educationData =
                      programData?[facultyName]?[selectedMajorName];
                  if (educationData != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MajorDetailsScreen(
                          majorName: selectedMajorName,
                          majorInfoData: educationData,
                          educationNames: educationData.keys.toList(),
                        ),
                      ),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
      body: programData != null
          ? ListView.builder(
              itemCount: programData!.length,
              itemBuilder: (context, index) {
                String facultyName = programData!.keys.elementAt(index);
                Map<String, dynamic> majorData = programData![facultyName];
                String? facultyIcon = majorData['fac_icon'];
                if (facultyIcon == null) {
                  Icon(
                    Icons.error,
                    size: 2,
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
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: UPrimaryColor,
                        iconColor: UPrimaryColor,
                        textColor: UTextColor,
                        key: PageStorageKey(facultyName),
                        title: Row(
                          children: [
                            Image.network(
                              'http://192.168.1.51/hosting_api/Test_student/fac_icon/$facultyIcon',
                              scale: 6,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            SizedBox(width: 10),
                            Expanded(child: Text(facultyName.tr)),
                          ],
                        ),
                        children: majorData.keys.map((majorName) {
                          if (majorName != 'fac_icon') {
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
                                        majorInfoData: majorData[majorName],
                                        educationNames:
                                            majorData[majorName].keys.toList(),
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
                                  padding: EdgeInsets.all(UPdMg_5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        majorName.tr,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: UTitleSize,
                                          color: UTextColor,
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
                          } else {
                            return SizedBox
                                .shrink(); // Skip the faculty icon data
                          }
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class MajorSearchDelegate extends SearchDelegate<String> {
  final List<String> majorNames;
  final Map<String, dynamic>? programData;

  MajorSearchDelegate(this.majorNames, {required this.programData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ""),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredMajorNames = majorNames.where((majorName) {
      return majorName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredMajorNames.length,
      itemBuilder: (context, index) {
        String majorName = filteredMajorNames[index];
        return ListTile(
          title: Text(majorName),
          onTap: () {
            // Get the faculty name associated with the selected major name
            String? facultyName;
            programData?.forEach((key, value) {
              if (value.containsKey(majorName)) {
                facultyName = key;
              }
            });

            if (facultyName != null) {
              Map<String, dynamic>? educationData =
                  programData?[facultyName]?[majorName];
              if (educationData != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MajorDetailsScreen(
                      majorName: majorName,
                      majorInfoData: educationData,
                      educationNames: educationData.keys.toList(),
                    ),
                  ),
                );
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? majorNames.where((majorName) => majorName != 'fac_icon').toList()
        : majorNames.where((majorName) {
            return majorName.toLowerCase().contains(query.toLowerCase()) &&
                majorName !=
                    'fac_icon'; // Exclude 'fac_icon' from the suggestions
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        String suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion.tr),
          onTap: () {
            close(context, suggestion);
          },
        );
      },
    );
  }
}
