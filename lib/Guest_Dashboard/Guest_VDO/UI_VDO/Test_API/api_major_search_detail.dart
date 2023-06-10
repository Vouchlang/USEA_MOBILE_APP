import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';
import '/Custom_AppBar.dart';
import 'api_model.dart';

class Major_Search_Screen extends StatelessWidget {
  final Major_Detail majorName;
  const Major_Search_Screen({super.key, required this.majorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: majorName.major_name),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              child: Text(
                'បន្ទាប់ពីបញ្ចប់ការសិក្សាបរិញ្ញាបត្រវិទ្យាសាស្ត្រ មុខជំនាញព័ត៌មានវិទ្យា​ និស្សិតទទួលបាន សមត្ថភាពមូលដ្ឋាន និងសមត្ថភាពស្នូលដោយចែកចេញជា៖ ',
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontSize: UTitleSize, fontFamily: UKFontFamily),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ConfigurableExpansionTile(
                      header: Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            majorName.knowledge_title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: UPrimaryColor,
                              fontSize: UTitleSize,
                              fontFamily: UKFontFamily,
                              fontWeight: UTitleWeight,
                            ),
                          ),
                        ),
                      ),
                      animatedWidgetFollowingHeader: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 25,
                        color: UPrimaryColor,
                      ),
                      childrenBody: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          majorName.knowledge_desc,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: UTitleSize,
                            fontFamily: UKFontFamily,
                          ),
                        ),
                      )),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ConfigurableExpansionTile(
                      header: Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            majorName.cognitive_title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: UPrimaryColor,
                                fontSize: UTitleSize,
                                fontFamily: UKFontFamily,
                                fontWeight: UTitleWeight),
                          ),
                        ),
                      ),
                      animatedWidgetFollowingHeader: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 25,
                        color: UPrimaryColor,
                      ),
                      childrenBody: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          majorName.cognitive_desc,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: UTitleSize, fontFamily: UKFontFamily),
                        ),
                      )),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ConfigurableExpansionTile(
                      header: Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            majorName.skill_title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: UPrimaryColor,
                                fontSize: UTitleSize,
                                fontFamily: UKFontFamily,
                                fontWeight: UTitleWeight),
                          ),
                        ),
                      ),
                      animatedWidgetFollowingHeader: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 25,
                        color: UPrimaryColor,
                      ),
                      childrenBody: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          majorName.skill_desc,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: UTitleSize, fontFamily: UKFontFamily),
                        ),
                      )),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ConfigurableExpansionTile(
                      header: Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            majorName.numerical_title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: UPrimaryColor,
                                fontSize: UTitleSize,
                                fontFamily: UKFontFamily,
                                fontWeight: UTitleWeight),
                          ),
                        ),
                      ),
                      animatedWidgetFollowingHeader: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 25,
                        color: UPrimaryColor,
                      ),
                      childrenBody: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          majorName.numerical_desc,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: UTitleSize, fontFamily: UKFontFamily),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
