import 'package:flutter/material.dart';
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
      var res = await http
          .get(Uri.parse("https://usea.edu.kh/api/webapi.php?action=faq"));
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        faq = r.map((e) => Class_FAQ.fromJson(e)).toList();
      } else {
        faq = [Class_FAQ.fromJson(r)];
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    } finally {
      setState(
        () {
          isLoading = false;
        },
      );
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
        child: isLoading
            ? Center(
                child: FutureBuilder<void>(
                  future: Future.delayed(Duration(seconds: 3)),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? Text('No Data')
                          : CircularProgressIndicator(),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    final isLastIndex = index == faq.length - 1;

                    return Card(
                      margin: isLastIndex
                          ? EdgeInsets.fromLTRB(0, 10, 0, 10)
                          : EdgeInsets.only(top: 10),
                      elevation: 2,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.fromLTRB(17, 10, 17, 5),
                                    child: buildFAQ(
                                        faq[index].answer, TextAlign.justify),
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
