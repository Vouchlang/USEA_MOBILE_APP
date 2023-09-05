import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../theme_builder.dart';
import '../Class_Program/Class_Program_ACCA.dart';
// import 'Program_ACCA.dart';
import 'Program_Major_Detail_Main.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  List<Map<String, dynamic>>? programData;
  List<String> majorNames = [];
  List<String> filteredMajorNames = [];
  List<ProgramACCA> programACCA = [];

  String searchQuery = '';

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(Get.locale?.languageCode == 'km'
          ? 'https://usea.edu.kh/api/webapi.php?action=study_program'
          : 'https://usea.edu.kh/api/webapi.php?action=study_program_en'),
    );

    // final response_acca = await http.get(
    //   Uri.parse(
    //       'http://192.168.1.51/hosting_api/Test_student/guest_program_testing_acca.php'),
    // );

    if (response.statusCode == 200
        //  && response_acca.statusCode == 200
        ) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> programDataList = jsonData['program_data'];

      // Acca
      // final Map<String, dynamic> jsonData_ACCA =
      //     json.decode(response_acca.body);

      List<ProgramACCA> accaList = [];

      // jsonData_ACCA['program_acca']?.forEach((facData) {
      //   List<Faculty_Data> fac_data = [];

      //   facData['faculty_data']?.forEach((majorData) {
      //     List<Major_Data> major_data = [];

      //     majorData['major_data']?.forEach((subjectData) {
      //       List<Subject_Data> subject_data = [];

      //       subjectData['subject_data']?.forEach((data) {
      //         Subject_Data subObj = Subject_Data(
      //           subject: data['subject'] ?? 'N/A',
      //           hour_per_week: data['hour_per_week'] ?? 'N/A',
      //           weeks: data['weeks'] ?? 'N/A',
      //           total_hour: data['total_hour'] ?? 'N/A',
      //         );

      //         subject_data.add(subObj);
      //       });

      //       Major_Data majorObj = Major_Data(
      //           major_name: subjectData['major_name'] ?? 'N/A',
      //           subject_data: subject_data);

      //       major_data.add(majorObj); // Add majorObj to major_data
      //     });

      //     Faculty_Data facObj = Faculty_Data(
      //       fac_icon: majorData['fac_icon'] ?? 'N/A',
      //       major_data: major_data,
      //     );

      //     fac_data.add(facObj); // Add facObj to fac_data
      //   });

      //   ProgramACCA programacca = ProgramACCA(
      //     fac_name: facData['faculty_name'] ?? 'N/A',
      //     fac_data: fac_data,
      //   );

      //   accaList.add(programacca);
      // });

      if (mounted) {
        setState(() {
          // programACCA = accaList;

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
                  future: Future.delayed(Duration(seconds: 10)),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? Text('គ្មានទិន្ន័យ'.tr)
                          : CircularProgressIndicator(
                              color: UPrimaryColor,
                            ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: programData!.length,
                    itemBuilder: (context, index) {
                      final faculty = programData![index];
                      final facultyName = faculty['faculty_name'];
                      final majorNamesData =
                          faculty['faculty_data']['major_name'];
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
                          borderRadius: BorderRadius.circular(URoundedLarge),
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
                                  SizedBox(width: UWidth10),
                                  Expanded(
                                      child: Text(facultyName.toString().tr)),
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
                                      Get.to(() => MajorDetailsScreen(
                                            majorName: majorName,
                                            majorInfoData: major,
                                            educationNames: degreeDetails
                                                .map<String>((degree) =>
                                                    degree['degree_name']
                                                        as String)
                                                .toList(),
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            URoundedMedium),
                                        border: Border.all(color: UBGLightBlue),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: UPdMg_8,
                                          horizontal: UPdMg_5),
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
                                          SizedBox(
                                            width: UWidth15,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color:
                                                Theme.of(context).primaryColor,
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
                  // ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: programACCA.length,
                  //   padding: EdgeInsets.only(bottom: UPdMg_10),
                  //   itemBuilder: (BuildContext context, index) {
                  //     final program = programACCA[index];
                  //     final fac_icon = program.fac_data[0].fac_icon;
                  //     return Card(
                  //       color: UBackgroundColor,
                  //       margin: EdgeInsets.fromLTRB(
                  //         UPdMg_10,
                  //         UPdMg_10,
                  //         UPdMg_10,
                  //         UZeroPixel,
                  //       ),
                  //       elevation: 2,
                  //       shadowColor: UGreyColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(URoundedLarge),
                  //       ),
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(vertical: UPdMg_5),
                  //         child: Theme(
                  //           data: Theme.of(context)
                  //               .copyWith(dividerColor: Colors.transparent),
                  //           child: ExpansionTile(
                  //             collapsedIconColor: UPrimaryColor,
                  //             iconColor: UPrimaryColor,
                  //             textColor: UTextColor,
                  //             key: PageStorageKey(
                  //                 program.fac_name.toString().tr),
                  //             title: Row(
                  //               children: [
                  //                 Image.network(
                  //                   'http://192.168.1.51/hosting_api/Test_student/fac_icon/$fac_icon',
                  //                   scale: 6,
                  //                   errorBuilder: (context, error, stackTrace) {
                  //                     return Icon(Icons.error);
                  //                   },
                  //                 ),
                  //                 SizedBox(width: UWidth10),
                  //                 Text(program.fac_name),
                  //               ],
                  //             ),
                  //             children: program.fac_data.map((major) {
                  //               final majorData = major.major_data[0];
                  //               return Container(
                  //                 padding: EdgeInsets.fromLTRB(
                  //                   UPdMg_15,
                  //                   UZeroPixel,
                  //                   UPdMg_15,
                  //                   UPdMg_10,
                  //                 ),
                  //                 child: InkWell(
                  //                   onTap: () {
                  //                     Get.to(() => Program_ACCA(
                  //                           major_name: majorData.major_name,
                  //                           subject_data:
                  //                               majorData.subject_data,
                  //                         ));
                  //                   },
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.circular(
                  //                           URoundedMedium),
                  //                       border: Border.all(color: UBGLightBlue),
                  //                     ),
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: UPdMg_8,
                  //                         horizontal: UPdMg_5),
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Expanded(
                  //                           child: Text(
                  //                             majorData.major_name
                  //                                 .toString()
                  //                                 .tr,
                  //                             textAlign: TextAlign.left,
                  //                             style: TextStyle(
                  //                               fontSize: UTitleSize,
                  //                               color: UTextColor,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: UWidth15,
                  //                         ),
                  //                         Icon(
                  //                           Icons.arrow_forward_ios,
                  //                           size: 14,
                  //                           color:
                  //                               Theme.of(context).primaryColor,
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
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

    Get.to(
      () => MajorDetailsScreen(
        majorName: majorName,
        majorInfoData: majorInfoData,
        educationNames: educationNames,
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
        var isLastIndex = index == suggestionList.length - 1;
        return InkWell(
          onTap: () {
            navigateToMajorDetails(context, majorName);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(UPdMg_10, UPdMg_15, UPdMg_10,
                isLastIndex ? UPdMg_15 : UZeroPixel),
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
