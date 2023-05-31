// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Data/Data_performance.dart';
import 'Dialog_performance.dart';

class Card_learning_pro_1 extends StatelessWidget {
  const Card_learning_pro_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ! Semester 01
        Container(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(255, 209, 209, 209),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            color: Colors.white,

            /// BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ! Header Card 1
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Color(0xFEE8F0FE),
                  ),

                  /// Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ១".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Row(
                            children: [
                              Text(
                                'វត្តមាន'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff002060),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                                width: 25,
                              ),
                              Text(
                                'ពិន្ទុ'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff002060),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                /// ! Body Card 1
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      class_program_Score_s1[index].subject,
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  /// វត្តមាន & ពិន្ទុ
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ///
                                      /// វត្តមាន
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.green,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),

                                        /// Close button
                                        child: InkWell(
                                          ///
                                          /// ShowDialog
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const CustomDialogWidget(),
                                            );
                                          },
                                          child: Text(
                                            class_program_Score_s1[index]
                                                .hour
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontFamily: 'KhmerOSbattambang',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        width: 50,
                                        thickness: 0.3,
                                      ),

                                      ///
                                      /// ពិន្ទុ
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.green,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const CustomDialogWidget(),
                                            );
                                          },
                                          child: Text(
                                            class_program_Score_s1[index]
                                                .credit
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontFamily: 'KhmerOSbattambang',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ! SizeBox
        SizedBox(
          height: 10,
        ),

        /// ! Semester 02
        Container(
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            color: Colors.white,

            /// BODY CONTENT
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// ! Header Card 2
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Color(0xFEE8F0FE),
                  ),

                  /// Header Table
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "ឆមាសទី ២",
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 16,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Container(
                          child: Text(
                            'វត្តមាន',
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 16,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 0,
                          thickness: 0.5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 0.0,
                          ),
                          child: Text(
                            'ពិន្ទុ',
                            style: TextStyle(
                              color: Color(0xff002060),
                              fontSize: 16,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// ! Body Card 2
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: class_program_Score_s1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      class_program_Score_s1[index].subject,
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  /// វត្តមាន & ពិន្ទុ
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ///
                                      /// វត្តមាន
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.green,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),

                                        /// Close button
                                        child: InkWell(
                                          ///
                                          /// ShowDialog
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const CustomDialogWidget(),
                                            );
                                          },
                                          child: Text(
                                            class_program_Score_s1[index]
                                                .hour
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontFamily: 'KhmerOSbattambang',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      VerticalDivider(
                                        color: Colors.black,
                                        width: 50,
                                        thickness: 0.3,
                                      ),

                                      ///
                                      /// ពិន្ទុ
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.green,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const CustomDialogWidget(),
                                            );
                                          },
                                          child: Text(
                                            class_program_Score_s1[index]
                                                .credit
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontFamily: 'KhmerOSbattambang',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
