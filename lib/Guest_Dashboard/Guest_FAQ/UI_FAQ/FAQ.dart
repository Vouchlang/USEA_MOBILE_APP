import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_FAQ/Class_FAQ.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<Class_FAQ> faq = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(Uri.parse(Get.locale?.languageCode == 'km'
          ? APIUrlGuest + "api/webapi.php?action=faq"
          : APIUrlGuest + "api/webapi.php?action=faq_en"));
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        faq = r.map((e) => Class_FAQ.fromJson(e)).toList();
      } else {
        faq = [
          Class_FAQ.fromJson(r),
        ];
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    } finally {
      if (mounted) {
        setState(
          () {
            isLoading = false;
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'FAQ'),
      body: Center(
        child: faq.isEmpty
            ? Center(
                child: FutureBuilder<void>(
                  future: Future.delayed(Duration(seconds: 10)),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? Text('គ្មានទិន្ន័យ'.tr)
                          : CircularProgressIndicator(
                              color: UPrimaryColor,
                            ),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: UPdMg_10),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    final isLastIndex = index == faq.length - 1;
                    return Card(
                      margin: isLastIndex
                          ? EdgeInsets.symmetric(vertical: UPdMg_10)
                          : EdgeInsets.only(top: UPdMg_10),
                      elevation: 2,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(URoundedLarge),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: UPdMg_10),
                        child: Column(
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: UPrimaryColor,
                                iconColor: UPrimaryColor,
                                title: buildFAQ(
                                    faq[index].question, TextAlign.left),
                                textColor: UTextColor,
                                children: [
                                  Divider(),
                                  Container(
                                    alignment: Alignment.centerLeft,

                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(URoundedLarge),
                                    ),
                                    padding: EdgeInsets.fromLTRB(
                                      UPdMg_15,
                                      UPdMg_10,
                                      UPdMg_15,
                                      UPdMg_5,
                                    ),
                                    child: buildFAQ(
                                      faq[index].answer,
                                      Get.locale?.languageCode == 'km'
                                          ? TextAlign.left
                                          : TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
