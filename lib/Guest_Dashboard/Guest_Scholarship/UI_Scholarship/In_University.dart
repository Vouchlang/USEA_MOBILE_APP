import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
            "http://192.168.3.34/hosting_api/Guest/fetch_guest_scholarship_i.php"),
      );
      var r = json.decode(res.body);
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
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Container(
                child: ListView.builder(
                  itemCount: i_scholarship.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Card(
                        elevation: 3,
                        shadowColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Text(
                                  i_scholarship[index].i_school_name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  i_scholarship[index].i_educational_level,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  i_scholarship[index].i_major,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  i_scholarship[index].i_expire,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  i_scholarship[index].i_expire_date,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 80,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0x142D74F5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x142D74F5),
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () => launchUrlString(
                                          i_scholarship[index].i_link),
                                      child: Text(
                                        'អានបន្ថែម'.tr,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor),
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
      ),
    );
  }
}
