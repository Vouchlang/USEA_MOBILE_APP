import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Class_AboutUS/Class_AboutUS.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import 'Build_Custom_AboutUS.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'អំពីយើង'.tr),
      body: buildListAboutUS(),
    );
  }

  Widget buildListAboutUS() {
    return ListView.builder(
      itemCount: about_US.length,
      padding: const EdgeInsets.all(UPdMg10),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: UPdMg5),
          child: buildAboutUSCard(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => about_US[index].screen,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                transitionDuration: const Duration(milliseconds: 100),
              ),
            ),
            img: about_US[index].img,
            text: about_US[index].text.tr,
          ),
        );
      },
    );
  }
}
