import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import '../../Guest_Class_Model/Class_Program_Associate.dart';
import '../../Guest_Class_Model/Class_Program_Major_Detail.dart';

class Program_Associate extends StatefulWidget {
  const Program_Associate({Key? key}) : super(key: key);

  @override
  State<Program_Associate> createState() => _Program_AssociateState();
}

class _Program_AssociateState extends State<Program_Associate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              child: Text(
                'បន្ទាប់ពីបញ្ចប់ការសិក្សាបរិញ្ញាបត្រវិទ្យាសាស្ត្រ មុខជំនាញព័ត៌មានវិទ្យា​ និស្សិតទទួលបាន សមត្ថភាពមូលដ្ឋាន និងសមត្ថភាពស្នូលដោយចែកចេញជា៖ ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12, fontFamily: 'KhmerOSbattambang'),
              ),
            ),
            Container(
              child: ListView.builder(
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
                              header: Container(
                                width: 323,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  program_major_detail[index].title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 12,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              animatedWidgetFollowingHeader: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 17,
                                color: Colors.indigo[900],
                              ),
                              childrenBody: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  program_major_detail[index].description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'KhmerOSbattambang'),
                                ),
                              )),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.95,
                  // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                  children: List.generate(
                      pro_asso_year.length,
                      (index) => Card(
                            elevation: 3,
                            color: Colors.white,
                            shadowColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            pro_asso_year[index].screen));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      pro_asso_year[index].name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'KhmerOSbattambang'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
