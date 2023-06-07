import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/theme_builder.dart';

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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                child: Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => aboutUS[index].screen),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  aboutUS[index].img,
                                  scale: 6,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    aboutUS[index].text.tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: UTitleSize16,
                                        fontWeight: UBodyWeight),
                                  ),
                                ),
                              ],
                            ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
