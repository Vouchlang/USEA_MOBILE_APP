import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Custom_AppBar.dart';
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ទំនាក់ទំនង'.tr),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: contact.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Expanded(
                    child: Column(
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
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () =>
                                    launchUrlString(contact[index].link),
                                child: Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    contact[index].text.tr,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14,
                                        // fontFamily: 'KhmerOSbattambang',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 200,
            color: Colors.grey,
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
