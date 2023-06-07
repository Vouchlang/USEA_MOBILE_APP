import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/UI_News_Event/Past_Event.dart';
import 'package:usea_app/theme_builder.dart';

import '../../../Custom_AppBar.dart';
import 'Upcoming_Event.dart';

class New_Event extends StatefulWidget {
  const New_Event({Key? key}) : super(key: key);

  @override
  State<New_Event> createState() => _New_EventState();
}

class _New_EventState extends State<New_Event> {
  List<String> tab_txt = [
    "ព្រឹត្តិការណ៍នាពេលខាងមុខ",
    "ព្រឹត្តិការណ៍មុនៗ",
  ];

  List pages = [
    Upcoming_Event(),
    Past_Event(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ព្រឹត្តិការណ៍'.tr),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(UZeroPixel),
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
                              fontSize: UTitleSize,
                              color: current == index
                                  ? UBackgroundColor
                                  : UTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Flexible(child: pages[current])
          ],
        ),
      ),
    );
  }
}
