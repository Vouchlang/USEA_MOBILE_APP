import 'package:flutter/material.dart';
import '../../Guest_Class_Model/Class_FAQ.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('FAQ',
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
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: double.infinity,
        child: ListView.builder(
          itemCount: faq.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 3,
                shadowColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.indigo[900],
                        iconColor: Colors.indigo[900],
                        title: Text(
                          faq[index].question,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              color: Colors.black),
                        ),
                        textColor: Colors.black,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                            child: Text(
                              faq[index].answer,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'KhmerOSbattambang'),
                            ),
                          )
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
