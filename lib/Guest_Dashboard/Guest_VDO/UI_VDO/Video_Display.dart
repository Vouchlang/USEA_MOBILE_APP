import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/theme_builder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '/Custom_AppBar.dart';
import '../Class_VDO/Class_Video.dart';
import 'CustomPlayBackSpeed.dart';
import 'Custom_Build_Video.dart';

class Video_Display extends StatefulWidget {
  final VDO_Class data;
  final List<VDO_Class> vdo;

  const Video_Display({Key? key, required this.data, required this.vdo}) : super(key: key);

  @override
  _Video_DisplayState createState() => _Video_DisplayState();
}

class _Video_DisplayState extends State<Video_Display> {
  late YoutubePlayerController _youtubeController;
  late int _hiddenVideoIndex;
  late int _currentVideoIndex;
  late bool _isMuted = false;
  late ValueNotifier<bool> _isFullScreenNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data.link)!,
      flags: const YoutubePlayerFlags(
        forceHD: true,
        loop: true,
      ),
    );

    _hiddenVideoIndex = widget.vdo.indexOf(widget.data);
    _currentVideoIndex = _hiddenVideoIndex;
    _youtubeController.addListener(_handleFullScreen);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        bottomActions: [
          buildFullScreen(),
        ],
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: USecondaryColor,
          appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
          body: buildListVideoDisplay(
            player: player,
            title: widget.vdo[_currentVideoIndex].title,
            caption: widget.vdo[_currentVideoIndex].caption,
          ),
        );
      },
    );
  }

  void _handleFullScreen() {
    if (_youtubeController.value.isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Widget buildFullScreen() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProgressBar(),
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
                    icon: _isMuted ? const Icon(Icons.volume_off) : const Icon(Icons.volume_up),
                    onPressed: () => setState(
                      () {
                        _isMuted = !_isMuted;
                        _isMuted ? _youtubeController.mute() : _youtubeController.unMute();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomPlaybackSpeedButton(controller: _youtubeController),
                  IconButton(
                    iconSize: 20,
                    color: USecondaryColor,
                    icon: _isFullScreenNotifier.value ? const Icon(Icons.fullscreen_exit) : const Icon(Icons.fullscreen),
                    onPressed: () => _youtubeController.toggleFullScreenMode(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.removeListener(_handleFullScreen);
    _youtubeController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }
}
