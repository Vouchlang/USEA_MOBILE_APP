// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';

import '../Data/Data_Carlendar.dart';

class CardCalendarList extends StatelessWidget {
  const CardCalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildText(String text, double size) {
      return Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontFamily: 'KhmerOSbattambang',
          color: UTextColor,
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: datacalendar.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Card(
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildText(datacalendar[index].weekday, 16),
                              buildText(datacalendar[index].date, 16),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    datacalendar[index].majorTitle,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  buildText(datacalendar[index].classroom, 12),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: buildText(
                                                datacalendar[index].teacherName,
                                                12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            child: buildText(
                                                datacalendar[index].tel, 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
