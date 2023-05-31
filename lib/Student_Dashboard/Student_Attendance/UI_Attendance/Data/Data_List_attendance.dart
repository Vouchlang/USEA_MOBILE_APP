// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

class Row_Data_List extends StatelessWidget {
  const Row_Data_List({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildTextBody(String text, Color color) {
      return Container(
        width: 75,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      );
    }

    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTextBody('15/02/2023'.tr, UTextColor),
            VerticalDivider(
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextBody('Session 1'.tr, UTextColor),
                Container(
                  width: 70,
                  height: 0.5,
                  color: Colors.grey,
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                ),
                buildTextBody('Session 2'.tr, UTextColor),
              ],
            ),
            VerticalDivider(
              color: Colors.grey,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextBody('យឺត'.tr, USecondaryColor),
                Container(
                  width: 50,
                  height: 0.5,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(bottom: 5, top: 5),
                ),
                buildTextBody('វត្តមាន\t'.tr, UScoreColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
