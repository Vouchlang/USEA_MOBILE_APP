// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../Class_Performance/Class_Attendacne_performance.dart';

class CustomAttDialog extends StatefulWidget {
  const CustomAttDialog({super.key});

  @override
  State<CustomAttDialog> createState() => _CustomAttDialogState();
}

class _CustomAttDialogState extends State<CustomAttDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: [
          CardDailog(),
          Positioned(
            right: 0,
            top: 0,
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/image/close.png',
                scale: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container CardDailog() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Color(0xFEE8F0FE),
            ),

            /// ! Header Table
            child: Row(
              children: [
                Container(
                  child: Text(
                    "សេដ្ឋកិច្ចវិទ្យា",
                    style: TextStyle(
                      color: UPrimaryColor,
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: attendance.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              attendance[index].type.tr,
                              style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              attendance[index].num_count.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: USecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class CustomScoreDialog extends StatefulWidget {
  const CustomScoreDialog({super.key});

  @override
  State<CustomScoreDialog> createState() => _CustomScoreDialogState();
}

class _CustomScoreDialogState extends State<CustomScoreDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: [
          CardDailog(),
          Positioned(
            right: 0,
            top: 0,
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/image/close.png',
                scale: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container CardDailog() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Color(0xFEE8F0FE),
            ),

            /// ! Header Table
            child: Row(
              children: [
                Container(
                  child: Text(
                    "សេដ្ឋកិច្ចវិទ្យា",
                    style: TextStyle(
                      color: UPrimaryColor,
                      fontSize: 14,
                      fontFamily: 'KhmerOSbattambang',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: score.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              score[index].type.tr,
                              style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              score[index].num_count.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: UScoreColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
