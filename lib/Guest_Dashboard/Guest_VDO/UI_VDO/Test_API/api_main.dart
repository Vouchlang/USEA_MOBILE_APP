import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/Guest_Dashboard/Guest_VDO/UI_VDO/Test_API/test_api_search.dart';
import '/theme_builder.dart';
import '../../../Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import 'Demo_Lite/class_demo.dart';

class FacultyList extends StatefulWidget {
  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  late final Future<List<Program_List>> futureProgram_List;
  bool isLoading = false;

  Future<List<Program_List>> fetchProgram_List() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.34/hosting_api/Guest/demo_major.php'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Program_List.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load FacModels from API');
    }
  }

  @override
  void initState() {
    super.initState();
    futureProgram_List = fetchProgram_List();
  }

  String getImageUrl(String imageName) {
    return 'http://192.168.1.34/hosting_api/Guest/fac_icon/$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'កម្មវិធីសិក្សា'.tr,
          style: TextStyle(
            color: UPrimaryColor,
            fontSize: 18,
            fontFamily: UKFontFamily,
            fontWeight: UTitleWeight,
          ),
        ),
        backgroundColor: UBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => TestSearchAPI(),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Program_List>>(
              future: futureProgram_List,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: UBackgroundColor,
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        elevation: 2,
                        shadowColor: ULightGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            collapsedIconColor: UPrimaryColor,
                            iconColor: UPrimaryColor,
                            textColor: UTextColor,
                            leading: Image.network(
                              getImageUrl(snapshot.data![index].facIcon),
                              scale: 4.75,
                            ),
                            title: Text(
                              snapshot.data![index].facName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: UTitleSize,
                                  fontFamily: UKFontFamily,
                                  fontWeight: UTitleWeight,
                                  color: UTextColor),
                            ),
                            children: [
                              Column(
                                children: snapshot.data![index].majors
                                    .asMap()
                                    .entries
                                    .map<Widget>((entry) => Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 0, 15, 10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Program_Major_Detail_Main(),
                                                  //     Major_Detail_Lite(
                                                  //   majorData:
                                                  //       snapshot.data![index],
                                                  //   index: entry.key,
                                                  // ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: UBGLightBlue,
                                                ),
                                              ),
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      entry.value,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: UTitleSize,
                                                          fontFamily:
                                                              UKFontFamily,
                                                          color: UTextColor),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: UTitleSize,
                                                      color: UPrimaryColor,
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }

                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            ),
    );
  }
}
