import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Custom_AppBar.dart';

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
              SizedBox(
                height: 50,
                width: double.infinity,
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
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: current == index
                            ? const Color(0xff002060)
                            : const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 1))
                        ],
                      ),
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          items[index].toString().tr,
                          style: TextStyle(
                            fontSize: 14,
                            color: current == index
                                ? Color(0xffFFFFFF)
                                : Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// CONTENT BODY
              Container(
                child: const Card_learning_pro_1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
