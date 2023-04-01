import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';
import '../Class_AboutUS/Class_AboutUS.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: Custom_AppBar(title: 'អំពីយើង'.tr),
      body: Container(
        child: ListView.builder(
            itemCount: aboutUS.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(6, 5, 6, 0),
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => aboutUS[index].screen));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                aboutUS[index].img,
                                scale: 6,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 265,
                                child: Text(
                                  aboutUS[index].text.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Image.asset(
                              'assets/image/Right_Arrow.png',
                              scale: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
