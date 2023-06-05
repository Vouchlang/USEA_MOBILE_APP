import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../Custom_AppBar.dart';
import '../Class_VDO/Class_Video_Home.dart';
import 'Test_API/api_main.dart';
import 'Video_Display.dart';

class Video_UI extends StatefulWidget {
  const Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: video_home.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Video_Display(
                        data: video_home[index],
                      )),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                  video_home[index].youtube_thumbnail),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Text(
                                video_home[index].title,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'KhmerOSbattambang',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                video_home[index].caption,
                                textAlign: TextAlign.justify,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'KhmerOSbattambang',
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
            ),
          );
        },
      ),
    );
  }
}
