import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '../Class_VDO/Class_Video.dart';

class Video_Display extends StatefulWidget {
  final VDO_Class data;
  final List<VDO_Class> vdo;

  const Video_Display({Key? key, required this.data, required this.vdo})
      : super(key: key);

  @override
  _Video_DisplayState createState() => _Video_DisplayState();
}

class _Video_DisplayState extends State<Video_Display> {
  late YoutubePlayerController _controller;
  int? _hiddenVideoIndex;
  int? _currentVideoIndex;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data.link)!,
      flags: YoutubePlayerFlags(
          autoPlay: false, forceHD: true, enableCaption: true),
    );
    _hiddenVideoIndex = widget.vdo.indexOf(widget.data);
    _currentVideoIndex = _hiddenVideoIndex;
  }

  void updateVideo(
    String videoLink,
    thumbnail,
    caption,
    title,
    int index,
  ) {
    setState(() {
      String videoId = YoutubePlayer.convertUrlToId(videoLink)!;
      _controller.load(videoId);
      _controller.play();

      int videoIndex =
          widget.vdo.indexWhere((video) => video.link == videoLink);
      if (videoIndex != 0) {
        VDO_Class updatedVideo = VDO_Class(
          link: videoLink,
          youtube_thumbnail: thumbnail,
          title: title,
          caption: caption,
        );
        widget.vdo[videoIndex] = updatedVideo;
      }

      _currentVideoIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: ListView(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProgressBar(
                      isExpanded: false,
                      colors: ProgressBarColors(
                        playedColor: URedColor,
                        bufferedColor: Colors.white,
                        handleColor: Colors.red,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CurrentPosition(),
                            RemainingDuration(),
                            IconButton(
                              iconSize: 20,
                              color: Colors.white,
                              icon: _isMuted
                                  ? Icon(Icons.volume_off)
                                  : Icon(Icons.volume_up),
                              onPressed: () {
                                setState(
                                  () {
                                    _isMuted = !_isMuted;
                                    _isMuted
                                        ? _controller.mute()
                                        : _controller.unMute();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        PlaybackSpeedButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: UBackgroundColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: ULightGreyColor,
                  blurRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: buildTitleBody(widget.vdo[_currentVideoIndex!].title,
                UTitleSize, FontWeight.w600),
          ),
          SizedBox(height: 5),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: buildTitleBody(widget.vdo[_currentVideoIndex!].caption,
                  UTitleSize, FontWeight.w500)),
          SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: widget.vdo.length,
            itemBuilder: (context, index) {
              VDO_Class video = widget.vdo[index];
              if (index == _hiddenVideoIndex) {
                return Container(); // Return an empty container for hidden video
              }
              return InkWell(
                onTap: () {
                  updateVideo(video.link, video.youtube_thumbnail,
                      video.caption, video.title, index);
                  hideVideo(index);
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
                                  widget.vdo[index].youtube_thumbnail,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildListText(
                                    widget.vdo[index].title, 3, UTitleSize),
                                SizedBox(height: 5),
                                buildListText(widget.vdo[index].caption, 1, 10),
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
        ],
      ),
    );
  }

  void hideVideo(int index) {
    setState(() {
      _hiddenVideoIndex = index;
    });
  }

  @override
  void dispose() {
    // Dispose the controller
    _controller.dispose();
    super.dispose();
  }
}
