import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '/Guest_Dashboard/Guest_Program/UI_Program/Program_Major_Detail_Main.dart';
import '../Class_Program/Class_Program.dart';

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
      backgroundColor: USecondaryColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: UBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 15,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          onChanged: (value) {
            setState(
              () {
                _searchQuery = value;
              },
            );
          },
          style: TextStyle(
            fontSize: UTitleSize,
            fontFamily: UKFontFamily,
          ),
          textAlign: TextAlign.left,
          decoration: InputDecoration.collapsed(hintText: "\t\tស្វែងរក".tr),
          cursorColor: UTextColor,
          cursorWidth: 1.5,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: program_List
                  .where(
                    (program) => program.majors.any(
                      (major) => major.title.tr.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ),
                    ),
                  )
                  .expand((program) => program.majors)
                  .toList()
                  .length,
              itemBuilder: (context, index) {
                final filteredMajor = program_List
                    .where(
                      (program) => program.majors.any(
                        (major) => major.title.tr.toLowerCase().contains(
                              _searchQuery.toLowerCase(),
                            ),
                      ),
                    )
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
                                Program_Major_Detail_Main(),
                          ),
                        );
                      },
                      child: NormalTitleTheme(
                        text: filteredMajor[index].title.tr,
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
