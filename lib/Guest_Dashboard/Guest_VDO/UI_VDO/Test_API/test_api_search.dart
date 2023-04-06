import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Guest_Dashboard/Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_major.dart';

class TestSearchAPI extends StatefulWidget {
  const TestSearchAPI({Key? key}) : super(key: key);

  @override
  State<TestSearchAPI> createState() => _TestSearchAPIState();
}

class _TestSearchAPIState extends State<TestSearchAPI> {
  String _searchQuery = '';
  List data = [];
  List filteredData = [];

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse('http://192.168.3.34/hosting_api/Guest/demo_major_list.php'),
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
      if (item['major_name'] != null &&
          item['major_name']
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
            size: 18,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              shrinkWrap: true,
              itemCount: filteredData == null ? 0 : filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 35,
                  child: ListTile(
                    dense: true,
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Major_Screen(
                              majorName: filteredData[index]['major_name'],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        filteredData[index]['major_name'].toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          color: Colors.black,
                        ),
                      ),
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
