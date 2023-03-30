import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Guest_Class_Model/Class_Program.dart';
import '../../Guest_Class_Model/Class_Program_Associate.dart';
import 'Program_Major_Detail_Main.dart';

class Program_Semester extends StatefulWidget {
  const Program_Semester({
    super.key,
  });

  @override
  State<Program_Semester> createState() => _Program_SemesterState();
}

class _Program_SemesterState extends State<Program_Semester> {
  String _searchQuery = '';
  String nametoFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
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
            setState(() {
              _searchQuery = value;
            });
          },
          style: TextStyle(fontSize: 12, fontFamily: 'KhmerOSbattambang'),
          textAlign: TextAlign.left,
          decoration: InputDecoration.collapsed(hintText: "\tSearch"),
          cursorColor: Colors.black,
          cursorWidth: 1.5,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: program_List
                  .where((program) => program.majors.any((major) => major.title
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase())))
                  .expand((program) => program.majors)
                  .toList()
                  .length,
              itemBuilder: (context, index) {
                final filteredMajor = program_List
                    .where((program) => program.majors.any((major) => major
                        .title
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase())))
                    .expand((program) => program.majors)
                    .toList();
                return Container(
                  height: 35,
                  child: ListTile(
                    title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Program_Major_Detail_Main()));
                        },
                        child: Text(
                          filteredMajor[index].title,
                          style: TextStyle(
                              fontSize: 12, fontFamily: 'KhmerOSbattambang'),
                        )),
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
