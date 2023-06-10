import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Program_Score_S1.dart';
import 'Program_Score_S2.dart';

class Program_Score_Main extends StatefulWidget {
  const Program_Score_Main({super.key});

  @override
  State<Program_Score_Main> createState() => _Program_Score_MainState();
}

class _Program_Score_MainState extends State<Program_Score_Main> {
  List<String> tab_txt = [
    "ឆមាសទី១",
    "ឆមាសទី២",
  ];

  List pages = [
    Program_Score_S1(),
    Program_Score_S2(),
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
                            borderRadius: BorderRadius.circular(UPdMg_5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: UGreyColor,
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
