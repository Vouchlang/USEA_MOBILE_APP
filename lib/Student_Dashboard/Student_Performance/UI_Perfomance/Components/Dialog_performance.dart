// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';

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
      backgroundColor: UBackgroundColor,
      insetPadding: EdgeInsets.all(UPd_Mg_Medium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(URoundedLarge),
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
            padding: const EdgeInsets.all(UPd_Mg_Medium),
            width: UFullWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(URoundedLarge),
                topRight: Radius.circular(URoundedLarge),
              ),
              color: UBGLightBlue,
            ),

            // ! Header Table
            child: Text(
              'សេដ្ឋកិច្ចវិទ្យា',
              style: TextStyle(
                fontFamily: UFontFamily,
                fontSize: UTitleSize,
                fontWeight: UTitleWeight,
                color: UPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.all(UPd_Mg_Small),
            width: UFullWidth,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: attendance.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: UPd_Mg_ExtraSmall),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextTheme(
                              text: attendance[index].type.tr,
                              fontWeight: UBodyWeight,
                              size: UTitleSize,
                              color: UTextColor,
                            ),
                            CustomTextTheme(
                              text: attendance[index].num_count.toString(),
                              fontWeight: UBodyWeight,
                              size: UTitleSize,
                              color: USecondaryColor,
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

// ! Score Dailog
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
      backgroundColor: UBackgroundColor,
      insetPadding: EdgeInsets.all(UPd_Mg_Medium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(URoundedLarge),
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
            padding: const EdgeInsets.symmetric(
              vertical: UPd_Mg_Medium,
              horizontal: UPd_Mg_Medium,
            ),
            width: UFullWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(URoundedLarge),
                topRight: Radius.circular(URoundedLarge),
              ),
              color: UBGLightBlue,
            ),

            /// ! Header Table
            child: Text(
              'សេដ្ឋកិច្ចវិទ្យា',
              style: TextStyle(
                fontFamily: UFontFamily,
                fontSize: UTitleSize,
                fontWeight: UTitleWeight,
                color: UPrimaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(UPd_Mg_Small),
            width: UFullWidth,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: score.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: UPd_Mg_ExtraSmall),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextTheme(
                              text: score[index].type.tr,
                              color: UTextColor,
                              fontWeight: UBodyWeight,
                              size: UTitleSize,
                            ),
                            CustomTextTheme(
                              text: score[index].num_count.toString(),
                              color: UScoreColor,
                              fontWeight: UBodyWeight,
                              size: UTitleSize,
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
