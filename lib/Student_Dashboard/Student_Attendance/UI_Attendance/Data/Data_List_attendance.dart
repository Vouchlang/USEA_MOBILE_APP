// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../../Custom_Widget/CustomText.dart';

class Row_Data_List extends StatelessWidget {
  const Row_Data_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTextBody('15/02/2023'.tr, UTextColor),
            buildVerticalDividerAtt(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextBody('Session 1'.tr, UTextColor),
                Container(
                  width: 70,
                  height: 0.5,
                  color: UGreyColor,
                  margin: EdgeInsets.only(
                    bottom: UPdMg_5,
                    top: UPdMg_5,
                  ),
                ),
                buildTextBody('Session 2'.tr, UTextColor),
              ],
            ),
            buildVerticalDividerAtt(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextBody('យឺត'.tr, USecondaryColor),
                Container(
                  width: 50,
                  height: 0.5,
                  color: UGreyColor,
                  margin: EdgeInsets.only(
                    bottom: UPdMg_5,
                    top: UPdMg_5,
                  ),
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
