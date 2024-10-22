import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Guest_API.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_FAQ/Class_FAQ.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Custom_Build_FAQ.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  late List<Class_FAQ> faq = [];
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: const Custom_AppBar(title: 'FAQ'),
      body: faq.isEmpty ? buildFutureBuilder() : buildFaqCard(),
    );
  }

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIGuestFAQKh : APIGuestFAQEn,
        ),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        faq = r.map((e) => Class_FAQ.fromJson(e)).toList();
      } else {
        faq = [
          Class_FAQ.fromJson(r),
        ];
      }
    } catch (e) {
      print('Failed to fetch FAQ: $e');
      // handle the error here
    } finally {
      if (mounted)
        setState(
          () => isLoading = false,
        );
    }
  }

  Widget buildFaqCard() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: UPdMg10,
          vertical: UPdMg5,
        ),
        width: UFullWidth,
        child: ListView.builder(
          itemCount: faq.length,
          itemBuilder: (context, index) {
            final isLastIndex = index == faq.length - 1;
            return Card(
              margin: isLastIndex ? const EdgeInsets.symmetric(vertical: UPdMg10) : const EdgeInsets.only(top: UPdMg10),
              elevation: 1.5,
              color: UBackgroundColor,
              shadowColor: ULightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(URoundedLarge),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: UPdMg10),
                child: Column(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: UTransParentColor),
                      child: ExpansionTile(
                        collapsedIconColor: UPrimaryColor,
                        iconColor: UPrimaryColor,
                        title: buildFAQ(
                          text: faq[index].question,
                          align: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
                        ),
                        textColor: UTextColor,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(URoundedLarge),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              UPdMg15,
                              UPdMg10,
                              UPdMg15,
                              UPdMg5,
                            ),
                            child: buildFAQ(
                              text: faq[index].answer,
                              align: Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
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
    );
  }
}
