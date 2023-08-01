import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';
import '../Class_Scholarship/Class_Scholarship_In.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class In_University extends StatefulWidget {
  const In_University({Key? key}) : super(key: key);

  @override
  State<In_University> createState() => _In_UniversityState();
}

class _In_UniversityState extends State<In_University> {
  List<I_Scholarship> i_scholarship = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.51/hosting_api/Guest/fetch_guest_scholarship_i.php"),
      );
      var r = json.decode(res.body);
      if (mounted) {
        if (r is List<dynamic>) {
          i_scholarship = r
              .map(
                (e) => I_Scholarship.fromJson(e),
              )
              .toList();
        } else {
          i_scholarship = [
            I_Scholarship.fromJson(r),
          ];
        }
        setState(
          () {
            isLoading = false;
          },
        );
      }
    } catch (e) {
      print('Error fetching data: $e');
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
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: i_scholarship.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                      UPdMg_10,
                      UZeroPixel,
                      UPdMg_10,
                      UPdMg_5,
                    ),
                    child: Card(
                      elevation: 2,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(UPdMg_10),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(UPdMg_10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: i_scholarship[index].i_school_name)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: i_scholarship[index]
                                        .i_educational_level)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: i_scholarship[index].i_major)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(text: 'ផុតកំណត់៖')),
                            Container(
                                width: UFullWidth,
                                child: BodyTheme(
                                    text: i_scholarship[index].i_expire_date)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: UPdMg_5, horizontal: UPdMg_10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(URoundedMedium),
                                    color: UBtnColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: UBtnColor,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () => launchUrlString(
                                        i_scholarship[index].i_link),
                                    child: CustomTextTheme(
                                      text: 'អានបន្ថែម'.tr,
                                      color: UPrimaryColor,
                                      fontWeight: UTitleWeight,
                                      size: UBodySize,
                                    ),
                                  ),
                                ),
                              ],
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
