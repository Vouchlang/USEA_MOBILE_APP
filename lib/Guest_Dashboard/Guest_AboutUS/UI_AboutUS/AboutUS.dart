import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/History.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/President_Message.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Recognition.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Stucture.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Vision.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../Class_AboutUS/Class_AboutUS.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'អំពីយើង'.tr,
      ),
      body: ListView.builder(
        itemCount: about_US.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(
              6,
              UPdMg5,
              6,
              UZeroPixel,
            ),
            child: Card(
              elevation: 2,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  URoundedLarge,
                ),
              ),
              child: InkWell(
                onTap: () {
                  if (index.isEqual(0)) {
                    pushWithTransition(
                      context,
                      History(),
                    );
                  } else if (index.isEqual(1)) {
                    pushWithTransition(
                      context,
                      Structure(),
                    );
                  } else if (index.isEqual(2)) {
                    pushWithTransition(
                      context,
                      President(),
                    );
                  } else if (index.isEqual(3)) {
                    pushWithTransition(
                      context,
                      Vision(),
                    );
                  } else if (index.isEqual(4)) {
                    pushWithTransition(
                      context,
                      Recognition(),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg15,
                    horizontal: UPdMg10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              about_US[index].img,
                              scale: UScale6,
                            ),
                            SizedBox(
                              width: UWidth10,
                            ),
                            Expanded(
                              child: Text(
                                about_US[index].text.tr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: UTitleSize16,
                                  fontWeight: UBodyWeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/image/Right_Arrow.png',
                          scale: UScale15,
                        ),
                      ),
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
