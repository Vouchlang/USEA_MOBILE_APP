import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
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
      var res = await http.get(Uri.parse(Get.locale?.languageCode == 'km'
          ? APIUrlGuest + "api/webapi.php?action=past_events_kh"
          : APIUrlGuest + "api/webapi.php?action=past_events_en"));
      var r = json.decode(res.body);
      if (mounted) {
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
        child: past_events.isEmpty
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
            : ListView.builder(
                padding: EdgeInsets.fromLTRB(
                  UPdMg_10,
                  UZeroPixel,
                  UPdMg_10,
                  UZeroPixel,
                ),
                itemCount: past_events.length,
                itemBuilder: (context, index) {
                  var past_event = past_events[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: UPdMg_10),
                    elevation: 2,
                    shadowColor: ULightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(URoundedLarge),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Past_Event_Detail(data: past_event));
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
                                child: past_event.past_image.isEmpty
                                    ? Image.asset(
                                        'assets/image/Error_Image.jpg',
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        past_event.past_image,
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                          SizedBox(
                            height: UHeight5,
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
                                    past_event.past_title.isEmpty
                                        ? 'N/A'
                                        : past_event.past_title,
                                    textAlign: TextAlign.justify,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: UTitleSize,
                                      fontWeight: UTitleWeight,
                                      fontFamily: UKFontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(height: UHeight5),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    past_event.past_desc.isEmpty
                                        ? 'N/A'
                                        : past_event.past_desc,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: UBodySize,
                                      fontWeight: UBodyWeight,
                                      fontFamily: UKFontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(height: UHeight5),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/image/Event_Date.png',
                                            width: 14,
                                          ),
                                          SizedBox(width: UWidth5),
                                          buildEventDate(
                                            past_event.past_date.isEmpty
                                                ? 'N/A'
                                                : past_event.past_date,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: UWidth10),
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/image/Event_Time.png',
                                            width: 14,
                                          ),
                                          SizedBox(width: UWidth5),
                                          buildEventDate(
                                            past_event.past_time.isEmpty
                                                ? 'N/A'
                                                : past_event.past_time,
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
