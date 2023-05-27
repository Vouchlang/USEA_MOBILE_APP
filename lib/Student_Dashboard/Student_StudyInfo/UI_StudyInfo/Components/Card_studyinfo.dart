// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Data/Data_studyinfo.dart';

class StudyInformationCards extends StatelessWidget {
  const StudyInformationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: studyInformationData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(255, 209, 209, 209),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      shadowColor: Colors.grey,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),

                              /// ! Column1
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /// ! days
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      studyInformationData[index].days,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),
                                    height: 0.5,
                                    color: Colors.grey,
                                  ),

                                  /// ! months
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      studyInformationData[index].months,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 0.5,
                              color: Colors.grey,
                              height: 100,
                            ),

                            /// ! Column2
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// ! semesterTitle
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 5.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    studyInformationData[index].semesterTitle,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Row(children: [
                                  Container(
                                    // width: double.maxFinite,
                                    padding: EdgeInsets.all(10),
                                    width: double.maxFinite,
                                    color: Colors.amber,
                                    height: 20,
                                  ),
                                ]),

                                /// ! majorTitle
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.amber[800],
                                        size: 14,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      studyInformationData[index].majorTitle,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),

                                /// ! roomTitle

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.green[800],
                                        size: 14,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.amber,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        studyInformationData[index].roomTitle,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'KhmerOSbattambang',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                /// ! timeExam
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.blue[800],
                                        size: 14,
                                      ),
                                    ),
                                    Text(
                                      studyInformationData[index].timeExam,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
