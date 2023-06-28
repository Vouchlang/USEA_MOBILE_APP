import 'dart:convert';
import 'package:flutter/material.dart';
import '/Guest_Dashboard/Guest_New_Event/Class_News_Event/Class_Past_News_Events.dart';
import 'package:http/http.dart' as http;
import '/theme_builder.dart';

import 'Past_Event_Detail.dart';

class Past_Event extends StatefulWidget {
  const Past_Event({Key? key}) : super(key: key);

  @override
  State<Past_Event> createState() => _Past_EventState();
}

class _Past_EventState extends State<Past_Event> {
  List<Class_Past_Event> past_events = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(Uri.parse(
          "http://192.168.1.34/hosting_api/Guest/fetch_guest_event_past.php"));
      var r = json.decode(res.body);
      if (mounted) {
        // Check if the widget is still mounted
        if (r is List<dynamic>) {
          past_events = r
              .map(
                (e) => Class_Past_Event.fromJson(e),
              )
              .toList();
        } else {
          past_events = [Class_Past_Event.fromJson(r)];
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      // handle the error here
    }
  }

  String getImageUrl(String imageName) {
    return 'http://192.168.1.34/hosting_api/Guest/event_image/$imageName';
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
                itemCount: past_events.length,
                itemBuilder: (context, index) {
                  var past_event = past_events[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 2,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                Past_Event_Detail(data: past_event),
                          ),
                        );
                      },
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
                                getImageUrl(past_event.past_image),
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
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
                                  width: UFullWidth,
                                  alignment: Alignment.center,
                                  child: Text(
                                    past_event.past_title,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontWeight: UBodyWeight,
                                      fontFamily: UKFontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(height: UPdMg_5),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    past_event.past_detail,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: UBodySize,
                                      fontWeight: UBodyWeight,
                                      fontFamily: UKFontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(height: UPdMg_5),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/image/Event_Date.png',
                                            width: 14,
                                          ),
                                          SizedBox(width: UPdMg_5),
                                          Text(
                                            'ថ្ងៃ' + past_event.past_day,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: UBodyWeight,
                                              fontFamily: UKFontFamily,
                                              color: UPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            'ទី' + past_event.past_date,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: UBodyWeight,
                                              fontFamily: UKFontFamily,
                                              color: UPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            'ខែ' + past_event.past_month,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: UBodyWeight,
                                              fontFamily: UKFontFamily,
                                              color: UPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            'ឆ្នាំ' + past_event.past_year,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: UBodyWeight,
                                              fontFamily: UKFontFamily,
                                              color: UPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: UPdMg_10),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/image/Event_Time.png',
                                            width: 14,
                                          ),
                                          SizedBox(width: UPdMg_5),
                                          Text(
                                            past_event.past_time,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: UBodyWeight,
                                              fontFamily: UKFontFamily,
                                              color: UPrimaryColor,
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
                  );
                },
              ),
      ),
    );
  }
}
