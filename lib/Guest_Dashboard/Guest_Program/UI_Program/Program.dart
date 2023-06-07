import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Program/UI_Program/Program_Search_Major.dart';
import 'package:usea_app/theme_builder.dart';
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
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(UPdMg_10),
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
                    color: UPrimaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: UPdMg_10),
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
        padding: EdgeInsets.fromLTRB(
          UPdMg_15,
          UZeroPixel,
          UPdMg_15,
          UPdMg_10,
        ),
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
              borderRadius: BorderRadius.circular(URoundedMedium),
              border: Border.all(color: UBGLightBlue),
            ),
            padding: EdgeInsets.all(UPdMg_5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.tr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: UTitleSize,
                    color: UTextColor,
                  ),
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
        margin: EdgeInsets.fromLTRB(
          UPdMg_10,
          UPdMg_10,
          UPdMg_10,
          UZeroPixel,
        ),
        elevation: 3,
        shadowColor: UGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UPdMg_10),
        ),
        child: Container(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedIconColor: Theme.of(context).primaryColor,
              iconColor: UPrimaryColor,
              textColor: UTextColor,
              key: PageStorageKey(title),
              title: Row(
                children: [
                  Image.asset(
                    image,
                    scale: 6,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: UTitleSize,
                        fontFamily: UKFontFamily,
                        fontWeight: UTitleWeight,
                        color: UTextColor,
                      ),
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
