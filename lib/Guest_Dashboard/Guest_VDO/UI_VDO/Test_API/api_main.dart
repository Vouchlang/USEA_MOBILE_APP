import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import '../../../Guest_Program/UI_Program/Program_Search_Major.dart';

class FacultyList extends StatefulWidget {
  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
  bool isLoading = false;
  List facultyData = [];

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('http://192.168.3.34/hosting_api/Guest/demo_major.php'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          facultyData = jsonData;
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        throw Exception('Error occurred while parsing data');
      }
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String getImageUrl(String imageName) {
    return 'http://192.168.3.34/hosting_api/Guest/fac_icon/$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => Program_Semester()));
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
          : ListView.builder(
              itemCount: facultyData.length,
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
                        getImageUrl(facultyData[index]['fac_icon']),
                        scale: 6,
                      ),
                      title: Text(
                        facultyData[index]['fac_name'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'KhmerOSbattambang',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      children: <Widget>[
                        Column(
                          children: facultyData[index]['majors']
                              .map<Widget>(
                                (major) => Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  Program_Major_Detail_Main()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Color(0xEEEEEEFF))),
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              major,
                                              textAlign: TextAlign.justify,
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
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
