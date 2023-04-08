import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:usea_app/Guest_Dashboard/Guest_VDO/UI_VDO/Test_API/test_api_search.dart';
import 'Demo_Lite/api_major_detail.dart';
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
        .get(Uri.parse('http://192.168.3.34/hosting_api/Guest/demo_major.php'));
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
    return 'http://192.168.3.34/hosting_api/Guest/fac_icon/$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('កម្មវិធីសិក្សា'.tr,
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 18,
              fontFamily: 'KhmerOSbattambang',
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo[900],
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                child: Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => TestSearchAPI()));
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.indigo[900],
                    size: 20,
                  )),
            )),
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        elevation: 3,
                        shadowColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.indigo[900],
                            iconColor: Colors.indigo[900],
                            textColor: Colors.black,
                            leading: Image.network(
                              getImageUrl(snapshot.data![index].facIcon),
                              scale: 6,
                            ),
                            title: Text(
                              snapshot.data![index].facName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
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
                                                          Major_Detail_Lite(
                                                            majorData: snapshot
                                                                .data![index],
                                                            index: entry.key,
                                                          )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xEEEEEEFF))),
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
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'KhmerOSbattambang',
                                                          color: Colors.black),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 14,
                                                      color: Colors.indigo[900],
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
