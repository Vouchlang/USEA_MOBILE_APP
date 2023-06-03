// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:usea_app/Custom_Widget/CustomText.dart';

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
                              NormalTitleTheme(
                                text: datacalendar[index].weekday,
                              ),
                              NormalTitleTheme(
                                text: datacalendar[index].date,
                              ),
                            ],
                          ),

                          // *@ VerticalDivider
                          VerticalDivider(
                            thickness: 0.5,
                            color: Colors.grey,
                            width: 30,
                          ),
                          // *@ End Vertical Divider

                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleSize16_Theme(
                                    text: datacalendar[index].majorTitle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  BodyTheme(
                                    text: datacalendar[index].classroom,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: BodyTheme(
                                              text: datacalendar[index]
                                                  .teacherName,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            child: BodyTheme(
                                              text: datacalendar[index].tel,
                                            ),
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
