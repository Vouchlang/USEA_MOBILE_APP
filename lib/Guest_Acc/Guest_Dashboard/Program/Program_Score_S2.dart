import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Guest_Class_Model/Class_Program_Score_S2.dart';

class Program_Score_S2 extends StatefulWidget {
  const Program_Score_S2({super.key});

  @override
  State<Program_Score_S2> createState() => _Program_Score_S2State();
}

class _Program_Score_S2State extends State<Program_Score_S2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      body: Card(
        elevation: 3,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            width: double.infinity,
            color: Color.fromRGBO(232, 240, 254, 100),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'មុខវិជ្ជា'.tr,
                      style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('ម៉ោង'.tr,
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Text('ក្រេឌីត'.tr,
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 12,
                                fontFamily: 'KhmerOSbattambang',
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  )
                ]),
          ),
          Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              color: Colors.white,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: class_program_score_s2.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 250,
                                  child: Text(
                                    class_program_score_s2[index].subject,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      child: Text(
                                          class_program_score_s2[index]
                                              .hour
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          )),
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                          class_program_score_s2[index]
                                              .credit
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          )),
                                    ),
                                  ],
                                )
                              ]),
                        ]));
                  })),
          Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'សរុប'.tr,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 12,
                        fontFamily: 'KhmerOSbattambang',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        alignment: Alignment.center,
                        child: Text(
                            class_program_score_s2
                                .fold(0, (sum, data) => sum + data.hour)
                                .toString(),
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 30,
                        alignment: Alignment.center,
                        child: Text(
                            class_program_score_s2
                                .fold(0, (sum, data) => sum + data.credit)
                                .toString(),
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            )),
                      ),
                    ],
                  )
                ]),
          ),
        ]),
      ),
    );
  }
}
