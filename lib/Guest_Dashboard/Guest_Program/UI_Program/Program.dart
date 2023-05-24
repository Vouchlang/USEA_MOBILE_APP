import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Program/UI_Program/Program_Search_Major.dart';
import '../Class_Program/Class_Program.dart';
import 'Program_Major_Detail_Main.dart';

class Program extends StatefulWidget {
  const Program({Key? key}) : super(key: key);

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text('កម្មវិធីសិក្សា'.tr,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
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
            color: Theme.of(context).primaryColor,
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
                          builder: (ctx) => Program_Semester(),
                        ),
                      );
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10),
        children:
            program_List.map((major) => ProgramWidget(major: major)).toList(),
      ),
    );
  }
}

class ProgramWidget extends StatelessWidget {
  final Program_List major;

  const ProgramWidget({
    Key? key,
    required this.major,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = major.title;
    final majors = major.majors;
    final image = major.image;

    if (majors.isEmpty) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => Program_Major_Detail_Main(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xEEEEEEFF),
              ),
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.tr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        elevation: 3,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedIconColor: Theme.of(context).primaryColor,
              iconColor: Theme.of(context).primaryColor,
              textColor: Colors.black,
              key: PageStorageKey(title),
              title: Row(
                children: [
                  Image.asset(
                    image,
                    scale: 6,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              children: majors
                  .map(
                    (major) => ProgramWidget(major: major),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    }
  }
}
