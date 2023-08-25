import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Class_AboutUS/Class_Recognition.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';

class Recognition extends StatelessWidget {
  const Recognition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការទទួលស្គាល់'.tr),
      body: ListView.builder(
        itemCount: recognition.length,
        itemBuilder: (context, index) {
          final isFinalIndex = index == recognition.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isFinalIndex ? UPdMg_10 : 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(UPdMg_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 175,
                        width: 125,
                        child: Image.asset(
                          recognition[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: UWidth10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              recognition[index].description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: UTitleSize,
                                  fontFamily: UEFontFamily),
                            ),
                            SizedBox(
                              height: UHeight10,
                            ),
                            InkWell(
                              onTap: () =>
                                  launchUrlString(recognition[index].link),
                              child: Container(
                                width: 80,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(UPdMg_5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(URoundedMedium),
                                  color: UBtnColor,
                                ),
                                child: Text(
                                  'អានបន្ថែម'.tr,
                                  style: TextStyle(
                                    fontSize: UBodySize,
                                    fontWeight: UBodyWeight,
                                    color: UPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isFinalIndex) buildDividerAtt(),
              ],
            ),
          );
        },
      ),
    );
  }
}
