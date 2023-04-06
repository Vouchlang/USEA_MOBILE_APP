import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import 'api_major.dart';

class MySearchApp extends StatefulWidget {
  @override
  _MySearchAppState createState() => _MySearchAppState();
}

class _MySearchAppState extends State<MySearchApp> {
  String _searchQuery = '';
  List data = [];
  List filteredData = [];

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse('http://192.168.3.34/hosting_api/Guest/demo_major.php'),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      setState(() {
        data = jsonData;
        filteredData = jsonData;
      });
      return "Success!";
    } else {
      throw Exception('Failed to load majors');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _filterData(String query) {
    if (data == null || data.isEmpty) return;

    List filtered = [];
    data.forEach((item) {
      if (item['majors'] != null &&
          item['majors']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        filtered.add(item);
      }
    });
    setState(() {
      filteredData = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo[900],
            size: 15,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          onChanged: (value) {
            _filterData(value);
          },
          style: TextStyle(fontSize: 14, fontFamily: 'KhmerOSbattambang'),
          textAlign: TextAlign.left,
          decoration: InputDecoration.collapsed(hintText: "\t\tស្វែងរក".tr),
          cursorColor: Colors.black,
          cursorWidth: 1.5,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredData == null ? 0 : filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               Program_Major_Detail_Main()));
                          // },
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Major_Screen(
                                  majorName:
                                      filteredData[index]['majors'].toString(),
                                ),
                              ),
                            );
                          },

                          child: Text(
                            filteredData[index]['majors'].join("\n").toString(),
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
