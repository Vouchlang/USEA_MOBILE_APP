import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Guest_Dashboard/Guest_Program/UI_Program/Program_Bachelor.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Program_Associate.dart';

class Program_Major_Detail_Main extends StatefulWidget {
  const Program_Major_Detail_Main({Key? key}) : super(key: key);

  @override
  State<Program_Major_Detail_Main> createState() =>
      _Program_Major_DetailState();
}

class _Program_Major_DetailState extends State<Program_Major_Detail_Main> {
  List<String> tab_txt = [
    "ថ្នាក់បរិញ្ញាបត្ររង",
    "ថ្នាក់បរិញ្ញាបត្រ",
  ];

  List pages = [
    Program_Associate(),
    Program_Bachelor(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'កម្មវិធីសិក្សា'.tr),
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
                            vertical: UPdMg_10,
                            horizontal: UPdMg_5,
                          ),
                          padding: EdgeInsets.all(UPdMg_10),
                          width: 175,
                          decoration: BoxDecoration(
                            color: current == index
                                ? UPrimaryColor
                                : UBackgroundColor,
                            borderRadius: BorderRadius.circular(URoundedMedium),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: ULightGreyColor,
                                offset: Offset(0, 1),
                              )
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
