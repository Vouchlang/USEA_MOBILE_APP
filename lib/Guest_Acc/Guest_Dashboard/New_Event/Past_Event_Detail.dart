import 'package:flutter/material.dart';
import '../../Guest_Class_Model/Class_Past_News_Event.dart';

class Past_Event_Detail extends StatelessWidget {
  final Past_News_Event data;

  const Past_Event_Detail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('ព្រឹត្តិការណ៍',
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 16,
              fontFamily: 'KhmerOSbattambang',
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData.fallback(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo[900],
            size: 15,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 150,
              child: Image.asset(
                data.img,
                fit: BoxFit.fitWidth,
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
                data.title,
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
                  data.detail_description,
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
