import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import 'api_major_search_detail.dart';
import 'api_model.dart';

class TestSearchAPI extends StatefulWidget {
  const TestSearchAPI({Key? key}) : super(key: key);

  @override
  State<TestSearchAPI> createState() => _TestSearchAPIState();
}

class _TestSearchAPIState extends State<TestSearchAPI> {
  String _searchQuery = '';
  List<Major_Detail> filteredData = [];
  List<Major_Detail> major_detail = [];

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse('http://192.168.3.34/hosting_api/Guest/demo_major_list.php'),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      setState(() {
        major_detail =
            jsonData.map((data) => Major_Detail.fromJson(data)).toList();
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
    if (major_detail == null || major_detail.isEmpty) return;

    List<Major_Detail> filtered = [];
    major_detail.forEach((item) {
      if (item.major_name != null &&
          item.major_name
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
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
            child: (_searchQuery.isEmpty &&
                    major_detail != null &&
                    major_detail.isNotEmpty)
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    shrinkWrap: true,
                    itemCount: major_detail.length,
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
                                  builder: (BuildContext context) =>
                                      //     Major_Search_Screen(
                                      //   majorName: major_detail[index],
                                      // ),
                                      Program_Major_Detail_Main(),
                                ),
                              );
                            },
                            child: Text(
                              major_detail[index].major_name.toString(),
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
                  )
                : filteredData.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        shrinkWrap: true,
                        itemCount: filteredData.length,
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
                                      builder: (BuildContext context) =>
                                          //     Major_Search_Screen(
                                          //   majorName: filteredData[index],
                                          // ),
                                          Program_Major_Detail_Main(),
                                    ),
                                  );
                                },
                                child: Text(
                                  filteredData[index].major_name.toString(),
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
                      )
                    : Center(
                        child: Text(
                          "No major found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
