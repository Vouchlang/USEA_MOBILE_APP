import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_Career/Class_Career.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Career extends StatefulWidget {
  const Career({Key? key}) : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  List<Class_Career> career = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.51/hosting_api/Guest/fetch_guest_career.php"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        career = r.map((e) => Class_Career.fromJson(e)).toList();
      } else {
        career = [Class_Career.fromJson(r)];
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

  String getLogo(String imageName) {
    return 'http://192.168.1.51/hosting_api/Guest/career/$imageName';
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
      appBar: Custom_AppBar(title: 'ព័ត៌មានការងារ'.tr),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: career.length,
                itemBuilder: (context, index) {
                  final isFinalIndex = index == career.length - 1;
                  return Padding(
                    padding: EdgeInsets.only(bottom: isFinalIndex ? 10 : 0),
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: () => launchUrlString(career[index].link),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    getLogo(career[index].logo),
                                  ),
                                  radius: 35,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextTheme(
                                        color: UTextColor,
                                        fontWeight: UBodyWeight,
                                        size: UTitleSize,
                                        text: career[index].position,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      BodyTheme(
                                        text: career[index].organization,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (!isFinalIndex)
                              Divider(
                                thickness: 0.5,
                                height: 25,
                                color: UGreyColor,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
