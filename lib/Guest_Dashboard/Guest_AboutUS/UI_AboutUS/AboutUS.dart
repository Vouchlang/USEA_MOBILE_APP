import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/History.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/President_Message.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Recognition.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Stucture.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Vision.dart';
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
              UPdMg_5,
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
                    Get.to(
                      () => History(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  } else if (index.isEqual(1)) {
                    Get.to(
                      () => Structure(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  } else if (index.isEqual(2)) {
                    Get.to(
                      () => President(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  } else if (index.isEqual(3)) {
                    Get.to(
                      () => Vision(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  } else if (index.isEqual(4)) {
                    Get.to(
                      () => Recognition(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UPdMg_15,
                    horizontal: UPdMg_10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              about_US[index].img,
                              scale: 6,
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
