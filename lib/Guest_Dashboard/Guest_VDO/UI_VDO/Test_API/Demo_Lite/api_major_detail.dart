import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:usea_app/Custom_AppBar.dart';

class Major_Detail_Lite extends StatelessWidget {
  final List majorName;
  const Major_Detail_Lite({Key? key, required this.majorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> majors = majorName[0]['majors'][0];
    return Scaffold(
      appBar: Custom_AppBar(title: majors['majors']),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            Container(
              child: Text(
                'បន្ទាប់ពីបញ្ចប់ការសិក្សាបរិញ្ញាបត្រវិទ្យាសាស្ត្រ មុខជំនាញព័ត៌មានវិទ្យា​ និស្សិតទទួលបាន សមត្ថភាពមូលដ្ឋាន និងសមត្ថភាពស្នូលដោយចែកចេញជា៖ ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, fontFamily: 'KhmerOSbattambang'),
              ),
            ),
            Container(
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
                              majorName.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        animatedWidgetFollowingHeader: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25,
                          color: Colors.indigo[900],
                        ),
                        childrenBody: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            majorName.toString(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'KhmerOSbattambang'),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
