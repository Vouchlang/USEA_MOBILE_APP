import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Custom_AppBar.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';
import '../Class_News_Event/Class_News_Event.dart';
import 'News_Event_Detail.dart';
import 'dart:math';

class News_Event extends StatefulWidget {
  const News_Event({super.key});

  @override
  State<News_Event> createState() => _News_EventState();
}

class _News_EventState extends State<News_Event> {
  late List<Class_News_Events> news_event = [];
  int selectedNewsEvent = 0;
  int currentPage = 0;
  final int resultsPerPage = 5;
  int startPage = 0;

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
      print('Failed to fetch news event: $e');
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
                    buildHeight5(),
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
                              duration: const Duration(
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
                                  const BoxShadow(
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
                                  fontWeight: UTitleWeight,
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
                    Column(
                      children: [
                        for (int i = 0;
                            i <
                                min(
                                  resultsPerPage,
                                  (news_event[selectedNewsEvent].events.length -
                                      (currentPage * resultsPerPage)),
                                );
                            i++)
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                              UPdMg10,
                              UZeroPixel,
                              UPdMg10,
                              UZeroPixel,
                            ),
                            child: Card(
                              color: UBackgroundColor,
                              margin: const EdgeInsets.only(
                                bottom: UPdMg10,
                              ),
                              elevation: 1,
                              shadowColor: ULightGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  URoundedLarge,
                                ),
                              ),
                              child: InkWell(
                                highlightColor: UTransParentColor,
                                splashColor: UTransParentColor,
                                onTap: () {
                                  Get.to(
                                    () => News_Event_Detail(
                                      data: news_event[selectedNewsEvent]
                                              .events[
                                          (currentPage * resultsPerPage) + i],
                                    ),
                                    transition: Transition.rightToLeftWithFade,
                                    duration: const Duration(
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
                                        borderRadius: BorderRadius.circular(
                                          URoundedLarge,
                                        ),
                                        child: news_event[selectedNewsEvent]
                                                .events[(currentPage *
                                                        resultsPerPage) +
                                                    i]
                                                .image
                                                .isEmpty
                                            ? Image.asset(
                                                imageAsset + 'Error_Image.jpg',
                                                width: double.maxFinite,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                news_event[selectedNewsEvent]
                                                    .events[(currentPage *
                                                            resultsPerPage) +
                                                        i]
                                                    .image,
                                                width: double.maxFinite,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    buildHeight5(),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
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
                                              news_event[selectedNewsEvent]
                                                      .events[(currentPage *
                                                              resultsPerPage) +
                                                          i]
                                                      .title
                                                      .isEmpty
                                                  ? 'N/A'
                                                  : news_event[
                                                          selectedNewsEvent]
                                                      .events[(currentPage *
                                                              resultsPerPage) +
                                                          i]
                                                      .title,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: UTitleSize,
                                                fontWeight: UTitleWeight,
                                                fontFamily: UKFontFamily,
                                                height: UTextHeight,
                                              ),
                                            ),
                                          ),
                                          buildHeight5(),
                                          Container(
                                            width: double.infinity,
                                            child: Text(
                                              news_event[selectedNewsEvent]
                                                      .events[(currentPage *
                                                              resultsPerPage) +
                                                          i]
                                                      .description
                                                      .isEmpty
                                                  ? 'N/A'
                                                  : news_event[
                                                          selectedNewsEvent]
                                                      .events[(currentPage *
                                                              resultsPerPage) +
                                                          i]
                                                      .description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontSize: UBodySize,
                                                fontWeight: UBodyWeight,
                                                fontFamily: UKFontFamily,
                                                height: UTextHeight,
                                              ),
                                            ),
                                          ),
                                          buildHeight5(),
                                          Row(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      imageAsset +
                                                          'Event_Date.png',
                                                      width: UWidth15,
                                                    ),
                                                    buildWidth5(),
                                                    buildEventDate(
                                                      news_event[selectedNewsEvent]
                                                              .events[(currentPage *
                                                                      resultsPerPage) +
                                                                  i]
                                                              .event_date
                                                              .isEmpty
                                                          ? 'N/A'
                                                          : news_event[
                                                                  selectedNewsEvent]
                                                              .events[(currentPage *
                                                                      resultsPerPage) +
                                                                  i]
                                                              .event_date,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              buildWidth10(),
                                              Flexible(
                                                flex: 1,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      imageAsset +
                                                          'Event_Time.png',
                                                      width: UWidth15,
                                                    ),
                                                    buildWidth5(),
                                                    buildEventDate(
                                                      news_event[selectedNewsEvent]
                                                              .events[(currentPage *
                                                                      resultsPerPage) +
                                                                  i]
                                                              .time
                                                              .isEmpty
                                                          ? 'N/A'
                                                          : news_event[
                                                                  selectedNewsEvent]
                                                              .events[(currentPage *
                                                                      resultsPerPage) +
                                                                  i]
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
                          ),
                      ],
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(
                        UPdMg10,
                        UZeroPixel,
                        UPdMg10,
                        UPdMg15,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //first page button
                          startPage > 0 &&
                                  ((MediaQuery.of(context).size.width - 210) /
                                              30)
                                          .floor() <
                                      (news_event[selectedNewsEvent]
                                                  .events
                                                  .length /
                                              resultsPerPage)
                                          .ceil()
                              ? InkWell(
                                  highlightColor: UTransParentColor,
                                  splashColor: UTransParentColor,
                                  onTap: () {
                                    setState(() {
                                      startPage = 0;
                                      currentPage = 0;
                                    });
                                  },
                                  child: Icon(
                                    Icons.first_page,
                                    color: UPrimaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          //move backward button
                          startPage > 0 &&
                                  ((MediaQuery.of(context).size.width - 210) /
                                              30)
                                          .floor() <
                                      (news_event[selectedNewsEvent]
                                                  .events
                                                  .length /
                                              resultsPerPage)
                                          .ceil()
                              ? InkWell(
                                  highlightColor: UTransParentColor,
                                  splashColor: UTransParentColor,
                                  onTap: () {
                                    setState(() {
                                      currentPage--;
                                      startPage--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.navigate_before,
                                    color: UPrimaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          //numbered page buttons
                          for (int i = startPage;
                              i <
                                  min(
                                      (((MediaQuery.of(context).size.width -
                                                      210) /
                                                  30)
                                              .floor() +
                                          startPage),
                                      (news_event[selectedNewsEvent]
                                                  .events
                                                  .length /
                                              resultsPerPage)
                                          .ceil());
                              i++)
                            InkWell(
                              highlightColor: UTransParentColor,
                              splashColor: UTransParentColor,
                              onTap: () {
                                setState(() {
                                  currentPage = i;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                  color: currentPage == i
                                      ? UPrimaryColor
                                      : UTransParentColor,
                                ),
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                    color: currentPage == i
                                        ? UBackgroundColor
                                        : UPrimaryColor,
                                    fontFamily: UEFontFamily,
                                    fontSize: UTitleSize,
                                  ),
                                ),
                              ),
                            ),
                          //move forward button
                          (news_event[selectedNewsEvent].events.length /
                                              resultsPerPage)
                                          .ceil() >
                                      ((MediaQuery.of(context).size.width -
                                                  210) /
                                              30)
                                          .floor() &&
                                  ((news_event[selectedNewsEvent]
                                                      .events
                                                      .length /
                                                  resultsPerPage)
                                              .ceil() -
                                          startPage) >
                                      ((MediaQuery.of(context).size.width -
                                                  210) /
                                              30)
                                          .floor()
                              ? InkWell(
                                  highlightColor: UTransParentColor,
                                  splashColor: UTransParentColor,
                                  onTap: () {
                                    setState(() {
                                      currentPage++;
                                      startPage++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: UPrimaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          //last page button
                          (news_event[selectedNewsEvent].events.length /
                                              resultsPerPage)
                                          .ceil() >
                                      ((MediaQuery.of(context).size.width -
                                                  210) /
                                              30)
                                          .floor() &&
                                  ((news_event[selectedNewsEvent]
                                                      .events
                                                      .length /
                                                  resultsPerPage)
                                              .ceil() -
                                          startPage) >
                                      ((MediaQuery.of(context).size.width -
                                                  210) /
                                              30)
                                          .floor()
                              ? InkWell(
                                  highlightColor: UTransParentColor,
                                  splashColor: UTransParentColor,
                                  onTap: () {
                                    setState(() {
                                      startPage = (news_event[selectedNewsEvent]
                                                      .events
                                                      .length /
                                                  resultsPerPage)
                                              .ceil() -
                                          ((MediaQuery.of(context).size.width -
                                                      210) /
                                                  30)
                                              .floor();
                                      currentPage =
                                          (news_event[selectedNewsEvent]
                                                          .events
                                                          .length /
                                                      resultsPerPage)
                                                  .ceil() -
                                              1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.last_page,
                                    color: UPrimaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
