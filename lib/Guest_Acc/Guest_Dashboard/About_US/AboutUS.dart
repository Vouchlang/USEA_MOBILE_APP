import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Guest_Class_Model/Class_AboutUS.dart';

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
      appBar: AppBar(
        centerTitle: false,
        title: Text('អំពីយើង'.tr,
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 16,
              fontFamily: 'KhmerOSbattambang',
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo[900],
            size: 15,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            aboutUS[index].img,
                            scale: 7,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              aboutUS[index].text.tr,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                  fontWeight: FontWeight.w600),
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
            }),
      ),
    );
  }
}
