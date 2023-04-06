import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Guest_Program/UI_Program/Program_Major_Detail_Main.dart';

class ProgramSearch extends StatefulWidget {
  const ProgramSearch({Key? key}) : super(key: key);

  @override
  _ProgramSearchState createState() => _ProgramSearchState();
}

class _ProgramSearchState extends State<ProgramSearch> {
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

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search',
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: facultyData
                        .where((program) =>
                            program['majors']?.any((major) =>
                                (major['majors'] != null) &&
                                    (major['majors'] as List?)
                                        ?.map((m) => m.toLowerCase())
                                        ?.contains(
                                            _searchQuery.toLowerCase()) ??
                                false) ??
                            false)
                        .fold<int>(
                            0,
                            (prev, program) =>
                                prev + (program['majors'] as List).length),
                    itemBuilder: (context, index) {
                      final filteredPrograms = facultyData
                          .where((program) => program['majors'].any((major) =>
                              major['majors']
                                  .toLowerCase()
                                  .contains(_searchQuery.toLowerCase())))
                          .toList();

                      final filteredMajors = filteredPrograms
                          .expand((program) => program['majors'])
                          .toList();

                      final filteredMajor = filteredMajors[index];
                      return Container(
                        height: 35,
                        child: ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Program_Major_Detail_Main(),
                                ),
                              );
                            },
                            child: Text(
                              filteredMajor['majors'],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang'),
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
