import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';
import 'package:usea_app/theme_builder.dart';

import 'Components/Screen_Performance.dart';

class Performance extends StatefulWidget {
  const Performance({super.key});

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  List<String> items = [
    "ឆ្នាំទី​ ១",
    "ឆ្នាំទី​ ២",
    "ឆ្នាំទី​ ៣",
    "ឆ្នាំទី​ ៤",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ដំណើរការសិក្សា'.tr),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: 70,
                width: UFullWidth,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        color:
                            current == index ? UPrimaryColor : UBackgroundColor,
                        borderRadius: BorderRadius.circular(URoundedMedium),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: ULightGreyColor,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(UPdMg_5),
                      child: Center(
                        child: Text(
                          items[index].toString().tr,
                          style: TextStyle(
                            fontSize: UTitleSize,
                            color: current == index
                                ? UBackgroundColor
                                : UTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// CONTENT BODY
              Container(child: Card_learning_pro_1()),
            ],
          ),
        ),
      ),
    );
  }
}
