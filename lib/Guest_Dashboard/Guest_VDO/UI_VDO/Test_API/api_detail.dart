import 'package:flutter/material.dart';
import 'api_model.dart';

class Upcoming_Event extends StatelessWidget {
  final Event data;
  const Upcoming_Event({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getImageUrl(String imageName) {
      return 'http://192.168.3.34/hosting_api/Guest/event_image/$imageName';
    }

    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(title: Text('API Detail')),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 150,
              child: InteractiveViewer(
                child: Image.network(
                  getImageUrl(data.upcoming_image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1), color: Colors.grey, blurRadius: 2)
                  ]),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Text(
                data.upcoming_title,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'KhmerOSbattambang'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Align(
                child: Text(
                  data.upcoming_detail,
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontSize: 11, fontFamily: 'KhmerOSbattambang'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
