// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Custom_AppBar.dart';
import '../Data/Data_List_attendance.dart';

class All_info_major extends StatefulWidget {
  const All_info_major({super.key});

  @override
  State<All_info_major> createState() => _All_info_majorState();
}

class _All_info_majorState extends State<All_info_major> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វត្តមាន'.tr),
      body: SingleChildScrollView(
        ///
        /// ! ONE CARD
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          color: Colors.white,

          /// BODY CONTENT
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///
              /// ! Header
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

                /// Comments Points
                /** 
               * * ============
               * ! Title Table 
               * */
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "សេដ្ធកិច្ចវិទ្យា",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Comments Points
              /** 
               * * =============
               * ! Content Table 
               * */
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    /// Comments Points
                    /** 
               * * ==================
               * ! Header Table Title
               * */
                    Container(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'កាលបរិច្ឆេទ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff002060),
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                width: 70,
                                thickness: 0.5,
                              ),
                              Text(
                                'Session',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff002060),
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                width: 70,
                                thickness: 0.5,
                              ),
                              Text(
                                'វត្តមាន',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff002060),
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),

                    /// Comments Points
                    /** 
               * * ====================
               * ! Body Row Decryption 
               * */
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),

                    /// Divider
                    Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                    Container(
                      child: const Row_Data_List(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
