import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_AppBar.dart';
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'កម្មវិធីសិក្សា'.tr),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 67,
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
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          padding: EdgeInsets.all(10),
                          width: 180,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: Text(
                            tab_txt[index].tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: current == index
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'KhmerOSbattambang',
                                fontSize: 14),
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
