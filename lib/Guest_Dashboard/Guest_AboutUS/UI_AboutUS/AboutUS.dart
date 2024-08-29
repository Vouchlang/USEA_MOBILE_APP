import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.all(
          UPdMg10,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              bottom: UPdMg5,
            ),
            child: Card(
              elevation: 1,
              color: UBackgroundColor,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  URoundedLarge,
                ),
              ),
              child: InkWell(
                highlightColor: UTransParentColor,
                splashColor: UTransParentColor,
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          about_US[index].screen,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(3.0, UZeroPixel);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        final tween = Tween(begin: begin, end: end).chain(
                          CurveTween(curve: curve),
                        );
                        var forwardAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: forwardAnimation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(
                        milliseconds: 100,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
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
                              scale: 6,
                            ),
                            buildWidth10(),
                            Expanded(
                              child: Text(
                                about_US[index].text.tr,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: UTitleSize16,
                                  fontWeight: UTitleWeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        imageAsset + 'Right_Arrow.png',
                        scale: UScale15,
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
