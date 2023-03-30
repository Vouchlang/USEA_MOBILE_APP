import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Past_Event.dart';
import 'Upcoming_Event.dart';

class New_Event extends StatefulWidget {
  const New_Event({Key? key}) : super(key: key);

  @override
  State<New_Event> createState() => _New_EventState();
}

class _New_EventState extends State<New_Event> {
  List<String> tab_txt = [
    "ព្រឹត្តិការណ៍នាពេលខាងមុខ",
    "ព្រឹត្តិការណ៍មុនៗ",
  ];

  List pages = [Upcoming_Event(), Past_Event()];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('ព្រឹត្តិការណ៍'.tr,
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
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 62,
                // alignment: Alignment.center,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: tab_txt.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              width: 160,
                              decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.indigo[900]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey,
                                        offset: Offset(0, 1))
                                  ]),
                              child: Text(
                                tab_txt[index].tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: current == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Flexible(child: pages[current])
            ]),
      ),
    );
  }
}
