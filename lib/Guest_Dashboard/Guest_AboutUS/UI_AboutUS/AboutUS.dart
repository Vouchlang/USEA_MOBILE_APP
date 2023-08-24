import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '../Class_AboutUS/Class_AboutUS.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'អំពីយើង'.tr),
      body: ListView.builder(
        itemCount: aboutUS.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(6, 5, 6, 0),
            child: Card(
              elevation: 2,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => aboutUS[index].screen),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
          );
        },
      ),
    );
  }
}
