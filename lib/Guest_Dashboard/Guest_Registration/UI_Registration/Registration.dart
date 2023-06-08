import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Registration/Class_Registration/Class_Registration.dart';
import '../../../Custom_AppBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../theme_builder.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<Class_Registration> registration = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.3.34/hosting_api/Guest/fetch_guest_registration.php"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        registration = r.map((e) => Class_Registration.fromJson(e)).toList();
      } else {
        registration = [
          Class_Registration.fromJson(r),
        ];
      }
    } catch (e) {
      print('Error fetching data: $e');
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'ការចុះឈ្មោះ'.tr),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.all(UPdMg_10 - 1),
                itemCount: registration.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.only(bottom: 15),
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(UPdMg_10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              registration[index].title,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: UTitleSize16,
                                fontFamily: UKFontFamily,
                                fontWeight: UTitleWeight,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child:
                                      Image.asset('assets/image/date_time.png'),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].date,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontFamily: UKFontFamily,
                                      fontWeight: UTitleWeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: UPdMg_15),
                            width: UFullWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/image/detail.png',
                                    scale: 14,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].education1,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontFamily: UKFontFamily,
                                      fontWeight: UTitleWeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].detail1,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: UKFontFamily,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: UPdMg_15),
                            width: UFullWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    'assets/image/detail.png',
                                    scale: 14,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].education2,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontFamily: UKFontFamily,
                                      fontWeight: UTitleWeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            width: UFullWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].detail2,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: UKFontFamily,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: UFullWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child:
                                      Image.asset('assets/image/date_time.png'),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].time,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontFamily: UKFontFamily,
                                      fontWeight: UTitleWeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            width: UFullWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    registration[index].detail3,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: UKFontFamily,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
