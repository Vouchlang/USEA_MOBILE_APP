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
  late int _hiddenVideoIndex;
  late int _currentVideoIndex;
  late bool _isMuted = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_AppBar(
        title: 'វីដេអូ'.tr,
      ),
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
                        bufferedColor: USecondaryColor,
                        handleColor: URedColor,
                        backgroundColor: UGreyColor,
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
                              color: USecondaryColor,
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
                bottom: Radius.circular(
                  UPdMg_10,
                ),
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
              vertical: UPdMg_5,
              horizontal: UPdMg_10,
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: buildTitleBody(
              widget.vdo[_currentVideoIndex].title,
              UTitleSize,
              UTitleWeight,
            ),
          ),
          SizedBox(height: UHeight5),
          Container(
            padding: EdgeInsets.all(
              UPdMg_10,
            ),
            width: double.infinity,
            child: buildTitleBody(
              widget.vdo[_currentVideoIndex].caption,
              UTitleSize,
              UBodyWeight,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
