// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Row_Data_List extends StatelessWidget {
  const Row_Data_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              /// Comments Points
              /** 
               * * ==========
               * ! First row
               * */
              Text(
                '15/02/2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'KhmerOSbattambang',
                  color: Color(0xff000000),
                ),
              ),

              VerticalDivider(
                color: Colors.black,
                width: 81,
                thickness: 0.5,
              ),

              /// Comments Points
              /** 
               * * ==========
               * ! Second row
               * */
              Column(
                children: [
                  Container(
                    child: Text(
                      'Session 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'KhmerOSbattambang',
                        color: Color(0xff000000),
                      ),
                    ),
                  ),

                  /// Divider
                  Container(
                    width: 60,
                    height: 0.8,
                    color: Colors.grey,
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                  ),

                  Container(
                    child: Text(
                      'Session 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'KhmerOSbattambang',
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),

              VerticalDivider(
                color: Colors.black,
                width: 60,
                thickness: 0.5,
              ),

              /// Comments Points
              /** 
               * * ==========
               * ! Third row
               * */
              Column(
                children: [
                  Container(
                    child: Text(
                      'យឺត',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'KhmerOSbattambang',
                        color: Color(0xffE4AC40),
                      ),
                    ),
                  ),

                  /// Divider
                  Container(
                    width: 45,
                    height: 0.8,
                    color: Colors.grey,
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                  ),

                  Container(
                    child: Text(
                      'វត្តមាន',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'KhmerOSbattambang',
                        color: Color(0xff38920D),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
