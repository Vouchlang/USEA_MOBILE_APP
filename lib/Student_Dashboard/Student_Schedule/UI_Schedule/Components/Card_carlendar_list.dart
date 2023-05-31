// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Data/Data_Carlendar.dart';

class CardCalendarList extends StatelessWidget {
  const CardCalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: datacalendar.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                datacalendar[index].weekday,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                datacalendar[index].date,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  datacalendar[index].majorTitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  datacalendar[index].classroom,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  datacalendar[index].teacherName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  datacalendar[index].tel,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
