import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usea_app/Guest_Dashboard/Guest_New_Event/UI_News_Event/Upcoming_Event_Detail.dart';
import '../../../theme_builder.dart';
import '../Class_News_Event/Class_Up_News_Events.dart';

class Upcoming_Event extends StatefulWidget {
  const Upcoming_Event({Key? key});

  @override
  _Upcoming_EventState createState() => _Upcoming_EventState();
}

class _Upcoming_EventState extends State<Upcoming_Event> {
  List<Class_Upcoming_Event> up_events = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(Uri.parse(
          "http://192.168.3.34/hosting_api/Guest/fetch_guest_event_upcoming.php"));
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        up_events = r.map((e) => Class_Upcoming_Event.fromJson(e)).toList();
      } else {
        up_events = [Class_Upcoming_Event.fromJson(r)];
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

  String getImageUrl(String imageName) {
    return 'http://192.168.3.34/hosting_api/Guest/event_image/$imageName';
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
            ? CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.fromLTRB(
                  UPdMg_10,
                  UZeroPixel,
                  UPdMg_10,
                  UPdMg_10,
                ),
                itemCount: up_events.length,
                itemBuilder: (context, index) {
                  var up_event = up_events[index];
                  return Container(
                    child: Card(
                      elevation: 3,
                      shadowColor: ULightGreyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(URoundedLarge),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Up_Event_Detail(data: up_event),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 150,
                                width: double.maxFinite,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(URoundedLarge),
                                  child: Image.network(
                                    getImageUrl(up_event.upcoming_image),
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  UPdMg_10,
                                  UZeroPixel,
                                  UPdMg_10,
                                  UPdMg_10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        up_event.upcoming_title,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: UTitleSize,
                                          fontWeight: UTitleWeight,
                                          fontFamily: UKFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        up_event.upcoming_detail,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: UBodySize,
                                          fontWeight: UBodyWeight,
                                          fontFamily: UKFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/image/Event_Date.png',
                                                  width: 14,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                child: Text(
                                                  'ថ្ងៃ' +
                                                      up_event.upcoming_day,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: UBodyWeight,
                                                    fontFamily: UKFontFamily,
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 2),
                                              Container(
                                                child: Text(
                                                  'ទី' + up_event.upcoming_date,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: UBodyWeight,
                                                    fontFamily: UKFontFamily,
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 2),
                                              Container(
                                                child: Text(
                                                  'ខែ' +
                                                      up_event.upcoming_month,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: UBodyWeight,
                                                    fontFamily: UKFontFamily,
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 2),
                                              Container(
                                                child: Text(
                                                  'ឆ្នាំ' +
                                                      up_event.upcoming_year,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: UBodyWeight,
                                                    fontFamily: UKFontFamily,
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/image/Event_Time.png',
                                                  width: 14,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                child: Text(
                                                  up_event.upcoming_time,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: UBodyWeight,
                                                    fontFamily: UKFontFamily,
                                                    color: UPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
