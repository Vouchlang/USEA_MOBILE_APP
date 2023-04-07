import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_major_detail.dart';

class Main_Lite extends StatefulWidget {
  @override
  _Main_LiteState createState() => _Main_LiteState();
}

class _Main_LiteState extends State<Main_Lite> {
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
          facultyData = jsonData.map((e) => Faculty.fromJson(e)).toList();
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
                        getImageUrl(facultyData[index].fac_icon),
                        scale: 6,
                      ),
                      title: Text(
                        facultyData[index].fac_name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'KhmerOSbattambang',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      children: <Widget>[
                        Column(
                          children: facultyData[index].majors
                              .map<Widget>(
                                (major) => Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  Major_Detail_Lite(
                                                      majorName:
                                                          facultyData[index])));
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

class Faculty {
  final int id;
  final String facName;
  final String facIcon;
  final List<String> majors;

  Faculty(
      {required this.id,
      required this.facName,
      required this.facIcon,
      required this.majors});

  factory Faculty.fromJson(Map<String, dynamic> json) {
    return Faculty(
      id: json['id'],
      facName: json['fac_name'],
      facIcon: json['fac_icon'],
      majors: List<String>.from(json['majors']),
    );
  }
}
