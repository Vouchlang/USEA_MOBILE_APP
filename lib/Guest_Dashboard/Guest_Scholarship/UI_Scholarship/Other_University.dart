import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/Custom_Widget/CustomText.dart';
import '/Guest_Dashboard/Guest_Scholarship/Class_Scholarship/Class_Scholarship_Out.dart';
import '/theme_builder.dart';

class Out_University extends StatefulWidget {
  const Out_University({Key? key}) : super(key: key);

  @override
  State<Out_University> createState() => _Out_UniversityState();
}

class _Out_UniversityState extends State<Out_University> {
  List<O_Scholarship> o_scholarship = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.34/hosting_api/Guest/fetch_guest_scholarship_o.php"),
      );
      var r = json.decode(res.body);
      if (mounted) {
        if (r is List<dynamic>) {
          o_scholarship = r.map((e) => O_Scholarship.fromJson(e)).toList();
        } else {
          o_scholarship = [O_Scholarship.fromJson(r)];
        }
        setState(() {
          isLoading = false;
        });
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
                itemCount: o_scholarship.length,
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
                                    text: o_scholarship[index].o_school_name)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: o_scholarship[index]
                                        .o_educational_level)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: o_scholarship[index].o_major)),
                            Container(
                                width: UFullWidth,
                                child: NormalTitleTheme(
                                    text: o_scholarship[index].o_expire)),
                            Container(
                                width: UFullWidth,
                                child: BodyTheme(
                                    text: o_scholarship[index].o_expire_date)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    vertical: UPdMg_5,
                                    horizontal: UPdMg_10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(URoundedMedium),
                                    color: UBtnColor,
                                    boxShadow: [
                                      BoxShadow(color: UBtnColor),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () => launchUrlString(
                                        o_scholarship[index].o_link),
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
