import 'package:flutter/material.dart';
import '../../Guest_Class_Model/Class_Up_News_Events.dart';
import 'Up_Event_Detail.dart';

class Upcoming_Event extends StatefulWidget {
  const Upcoming_Event({Key? key}) : super(key: key);

  @override
  State<Upcoming_Event> createState() => _Upcoming_EventState();
}

class _Upcoming_EventState extends State<Upcoming_Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      body: Center(
        child: ListView.builder(
          itemCount: up_news_event.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                elevation: 3,
                shadowColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => Up_Event_Detail(
                                  data: up_news_event[index],
                                )));
                  },
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 125,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              up_news_event[index].img,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  up_news_event[index].title,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'KhmerOSBattambang'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  up_news_event[index].description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'KhmerOSBattambang'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      up_news_event[index].icon1,
                                      width: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      up_news_event[index].txt_date,
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'KhmerOSBattambang',
                                          color: Colors.indigo[900]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Image.asset(
                                      up_news_event[index].icon2,
                                      width: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      up_news_event[index].txt_time,
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'KhmerOSBattambang',
                                          color: Colors.indigo[900]),
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
