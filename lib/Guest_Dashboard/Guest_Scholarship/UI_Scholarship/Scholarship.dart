import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../Custom_AppBar.dart';
import 'In_University.dart';
import 'Other_University.dart';

class Scholarship extends StatefulWidget {
  const Scholarship({Key? key}) : super(key: key);

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  List<String> tab_txt = [
    "ក្នុងសាកលវិទ្យាល័យ",
    "ក្រៅសាកលវិទ្យាល័យ",
  ];

  List pages = [
    In_University(),
    Out_University(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'អាហារូបករណ៍'.tr),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: tab_txt.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              current = index;
                            },
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                              vertical: UPdMg_10, horizontal: UPdMg_5),
                          padding: EdgeInsets.all(UPdMg_10),
                          width: 180,
                          decoration: BoxDecoration(
                            color: current == index
                                ? UPrimaryColor
                                : UBackgroundColor,
                            borderRadius: BorderRadius.circular(URoundedMedium),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: UGreyColor,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            tab_txt[index].tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: current == index
                                  ? UBackgroundColor
                                  : UTextColor,
                              fontSize: UTitleSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Flexible(
              child: pages[current],
            ),
          ],
        ),
      ),
    );
  }
}
