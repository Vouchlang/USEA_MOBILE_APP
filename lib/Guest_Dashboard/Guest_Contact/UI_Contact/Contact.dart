import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_Contact/Class_Contact.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ទំនាក់ទំនង'.tr),
      body: ListView(
        padding: EdgeInsets.all(UPdMg_10),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: contact.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          contact[index].icon,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: UWidth10,
                      ),
                      Expanded(
                        child: contact[index].link.isEmpty
                            ? Container(
                                padding: EdgeInsets.only(top: 4),
                                child: buildTitleBody(contact[index].text.tr,
                                    UTitleSize, UBodyWeight),
                              )
                            : InkWell(
                                onTap: () {
                                  void _launchTelegram() async {
                                    if (await canLaunch(contact[index].link)) {
                                      await launch(contact[index].link);
                                    } else {
                                      throw 'Could not launch ${contact[index].link}';
                                    }
                                  }

                                  _launchTelegram();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: buildTitleBody(contact[index].text.tr,
                                      UTitleSize, UBodyWeight),
                                ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: UHeight10,
                  ),
                ],
              );
            },
          ),
          Container(
            height: 200,
            color: UGreyColor,
            child: InkWell(
              onTap: () => launchUrlString(
                  'https://www.google.com/maps/place/University+of+South-East+Asia/@13.35045,103.863545,19z/data=!4m14!1m7!3m6!1s0x311017b78db22261:0x5f0e53c2eeaa7c81!2sThe+university+of+south+east+Asia!8m2!3d13.3632533!4d103.856403!16s%2Fg%2F11sjz02kw7!3m5!1s0x311017793e991fc3:0x106790c63625b714!8m2!3d13.3505943!4d103.863927!16s%2Fm%2F0cp4m02'),
              child: Image.asset(
                'assets/image/Map.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
