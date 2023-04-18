import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:usea_app/Guest_Dashboard/Guest_AboutUS/Class_AboutUS/Class_Recognition.dart';

import '../../../Custom_AppBar.dart';

class Recognition extends StatefulWidget {
  const Recognition({Key? key}) : super(key: key);

  @override
  State<Recognition> createState() => _RecognitionState();
}

class _RecognitionState extends State<Recognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ការទទួលស្គាល់'.tr),
      body: Container(
        child: ListView.builder(
          itemCount: recognition.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
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
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                recognition[index].description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () =>
                                  launchUrlString(recognition[index].link),
                              child: Container(
                                width: 75,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0x142D74F5)),
                                child: Text(
                                  'អានបន្ថែម'.tr,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
