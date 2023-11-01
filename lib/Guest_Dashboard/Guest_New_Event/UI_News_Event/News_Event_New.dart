import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_News_Event/Class_News_Event.dart';
import 'News_Event_Detail.dart';

class News_Event extends StatefulWidget {
  const News_Event({super.key});

  @override
  State<News_Event> createState() => _News_EventState();
}

class _News_EventState extends State<News_Event> {
  late List<Class_News_Events> news_event = [];
  int selectedNewsEvent = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km'
              ? APIUrlGuest + 'api/webapi.php?action=events_kh'
              : APIUrlGuest + 'api/webapi.php?action=events_en',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(
          response.body,
        );

        List<Class_News_Events> news_eventList = [];

        data['event']?.forEach((news_eventData) {
          List<Event_Data> news_event_data = [];

          news_eventData['event_data']?.forEach((news_eventDatas) {
            Event_Data news_event_DataObj = Event_Data(
              image: news_eventDatas['image'] ?? 'N/A',
              title: news_eventDatas['title'] ?? 'N/A',
              description: news_eventDatas['description'] ?? 'N/A',
              event_date: news_eventDatas['event_date'] ?? 'N/A',
              time: news_eventDatas['time'] ?? 'N/A',
            );

            news_event_data.add(news_event_DataObj);
          });

          Class_News_Events scholarshipObj = Class_News_Events(
            event_name: news_eventData['event_name'] ?? 'N/A',
            events: news_event_data,
          );

          news_eventList.add(scholarshipObj);
        });
        if (mounted) {
          setState(
            () {
              news_event = news_eventList;
            },
          );
        }
      } else {
        // Handle error case
        print(
          'Request failed with status: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error1: $e');
    }
  }

  void selectNewsEvent(int index) {
    if (mounted) {
      setState(
        () {
          selectedNewsEvent = index;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ព្រឹត្តិការណ៍'.tr,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: news_event.isEmpty
            ? buildFutureBuild()
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: UHeight5,
                    ),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      width: UFullWidth,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: news_event.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final isLastIndex = index == news_event.length - 1;

                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  selectedNewsEvent = index;
                                },
                              );
                            },
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: Duration(
                                milliseconds: 300,
                              ),
                              margin: EdgeInsets.fromLTRB(
                                UPdMg10,
                                UPdMg10,
                                isLastIndex ? UPdMg10 : UZeroPixel,
                                UPdMg10,
                              ),
                              width: 165,
                              decoration: BoxDecoration(
                                color: selectedNewsEvent == index
                                    ? UPrimaryColor
                                    : UBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                  URoundedMedium,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: ULightGreyColor,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                news_event[index].event_name.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: UTitleSize,
                                  color: selectedNewsEvent == index
                                      ? UBackgroundColor
                                      : UTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    news_event[selectedNewsEvent].events.isNotEmpty
                        ? Column(
                            children: news_event[selectedNewsEvent].events.map(
                              (news_event) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(
                                    UPdMg10,
                                    UZeroPixel,
                                    UPdMg10,
                                    UZeroPixel,
                                  ),
                                  child: Card(
                                    margin: EdgeInsets.only(
                                      bottom: UPdMg10,
                                    ),
                                    elevation: 2,
                                    shadowColor: ULightGreyColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        URoundedLarge,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => News_Event_Detail(
                                            data: news_event,
                                          ),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration: Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 200,
                                            width: double.maxFinite,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                URoundedLarge,
                                              ),
                                              child: news_event.image.isEmpty
                                                  ? Image.asset(
                                                      'assets/image/Error_Image.jpg',
                                                      width: double.maxFinite,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      news_event.image,
                                                      width: double.maxFinite,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: UHeight5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                              UPdMg10,
                                              UZeroPixel,
                                              UPdMg10,
                                              UPdMg10,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: UFullWidth,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    news_event.title.isEmpty
                                                        ? 'N/A'
                                                        : news_event.title,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: UTitleSize,
                                                      fontWeight: UTitleWeight,
                                                      fontFamily: UKFontFamily,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: UHeight5,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    news_event
                                                            .description.isEmpty
                                                        ? 'N/A'
                                                        : news_event
                                                            .description,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontSize: UBodySize,
                                                      fontWeight: UBodyWeight,
                                                      fontFamily: UKFontFamily,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: UHeight5,
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      flex: 2,
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/image/Event_Date.png',
                                                            width: UWidth15,
                                                          ),
                                                          SizedBox(
                                                            width: UWidth5,
                                                          ),
                                                          buildEventDate(
                                                            news_event
                                                                    .event_date
                                                                    .isEmpty
                                                                ? 'N/A'
                                                                : news_event
                                                                    .event_date,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: UWidth10,
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/image/Event_Time.png',
                                                            width: UWidth15,
                                                          ),
                                                          SizedBox(
                                                            width: UWidth5,
                                                          ),
                                                          buildEventDate(
                                                            news_event.time
                                                                    .isEmpty
                                                                ? 'N/A'
                                                                : news_event
                                                                    .time,
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
                                );
                              },
                            ).toList(),
                          )
                        : buildFutureBuild()
                  ],
                ),
              ),
      ),
    );
  }
}
