import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Guest_Class_Model/Class_Video_Home.dart';
import '../../Guest_Class_Model/Class_Video_Playlist.dart';

class Video_Display extends StatelessWidget {
  final Video data;
  const Video_Display({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('វីដេអូ'.tr,
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
        child: Column(
          children: [
            Container(
              height: 200,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(data.link)!,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                    )),
                showVideoProgressIndicator: true,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                  ),
                  PlaybackSpeedButton(),
                  FullScreenButton()
                ],
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                data.title,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'KhmerOSbattambang',
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Text(
                data.caption,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'KhmerOSbattambang',
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: video_playlist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("Video Link: " +
                                      video_playlist[index].youtube_thumbnail);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              video_playlist[index]
                                                  .youtube_thumbnail,
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 200,
                                          child: Text(
                                              video_playlist[index].title,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'KhmerOSbattambang',
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SingleChildScrollView(
                                            child: Container(
                                          width: 200,
                                          child: ReadMoreText(
                                            video_playlist[index].caption,
                                            trimLines: 1,
                                            textAlign: TextAlign.justify,
                                            trimMode: TrimMode.Line,
                                            moreStyle: TextStyle(
                                                color: Colors.grey[700]),
                                            lessStyle: TextStyle(
                                                color: Colors.grey[700]),
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontFamily: 'KhmerOSbattambang',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
