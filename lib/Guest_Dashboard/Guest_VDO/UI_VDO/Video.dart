import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:usea_app/Guest_Dashboard/Guest_VDO/UI_VDO/Test_API/Demo_Lite/api_main_lite.dart';
import '../../../Custom_AppBar.dart';
import '../Class_VDO/Class_Video_Home.dart';
import 'Test_API/api_main.dart';
import 'Test_Vido.dart';

class Video_UI extends StatefulWidget {
  const Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: video_home.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) =>
                //             Video_Display(data: video_home[index])));
                // ----------------------------------
                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => Testing())));
                // --------------------------------
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FacultyList())));
              },
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
                                child: Text(video_home[index].title,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'KhmerOSbattambang',
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SingleChildScrollView(
                                  child: Container(
                                child: ReadMoreText(
                                  video_home[index].caption,
                                  trimLines: 1,
                                  textAlign: TextAlign.justify,
                                  trimMode: TrimMode.Line,
                                  moreStyle: TextStyle(color: Colors.grey[700]),
                                  lessStyle: TextStyle(color: Colors.grey[700]),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'KhmerOSbattambang',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            );
          }),
    );
  }
}
