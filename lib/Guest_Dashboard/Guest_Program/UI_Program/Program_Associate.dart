import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_Widget/CustomText.dart';
import '/Guest_Dashboard/Guest_Program/Class_Program/Class_Program_Major_Detail.dart';
import '/theme_builder.dart';
import '../Class_Program/Class_Program_Associate.dart';

class Program_Associate extends StatefulWidget {
  const Program_Associate({Key? key}) : super(key: key);

  @override
  State<Program_Associate> createState() => _Program_AssociateState();
}

class _Program_AssociateState extends State<Program_Associate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Container(
        padding: EdgeInsets.all(UPdMg_10),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Text(
              'បន្ទាប់ពីបញ្ចប់ការសិក្សាបរិញ្ញាបត្រវិទ្យាសាស្ត្រ មុខជំនាញព័ត៌មានវិទ្យា​ និស្សិតទទួលបាន សមត្ថភាពមូលដ្ឋាន និងសមត្ថភាពស្នូលដោយចែកចេញជា៖ ',
              textAlign: TextAlign.justify,
              style:
                  TextStyle(fontSize: UTitleSize, fontFamily: UKFontFamily),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: program_major_detail.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
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
                                program_major_detail[index].title,
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
                            padding: EdgeInsets.symmetric(horizontal: UPdMg_10),
                            child: Text(
                              program_major_detail[index].description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: UTitleSize,
                                fontFamily: UKFontFamily,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Column(
              children: [
                SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.90,
                  children: List.generate(
                    pro_asso_year.length,
                    (index) => Card(
                      elevation: 2,
                      color: UBackgroundColor,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(URoundedLarge),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => pro_asso_year[index].screen),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 7),
                            NormalTitleTheme(text: pro_asso_year[index].name.tr)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
