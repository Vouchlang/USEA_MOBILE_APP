import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../Guest_Class_Model/Class_Scholarship_Out.dart';

class Out_University extends StatefulWidget {
  const Out_University({Key? key}) : super(key: key);

  @override
  State<Out_University> createState() => _Out_UniversityState();
}

class _Out_UniversityState extends State<Out_University> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      body: Container(
        child: ListView.builder(
            itemCount: o_scholarship.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: (Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text(
                            o_scholarship[index].o_school_name,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            o_scholarship[index].o_educational_level,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            o_scholarship[index].o_major,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            o_scholarship[index].o_exprire,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            o_scholarship[index].o_expire_date,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0x142D74F5),
                              ),
                              child: InkWell(
                                onTap: () =>
                                    launchUrlString(o_scholarship[index].o_link),
                                child: Text(
                                  'អានបន្ថែម'.tr,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.indigo[900]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
