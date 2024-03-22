import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Display1 extends StatefulWidget {
  const Video_Display1({
    Key? key,
  }) : super(key: key);

  @override
  _Video_Display1State createState() => _Video_Display1State();
}

class _Video_Display1State extends State<Video_Display1> {
//   final String videoUrl = 'https://www.youtube.com/watch?v=f7VewR__76I';

//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('YouTube Video'),
//       ),
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         onReady: () {
//           _controller.toggleFullScreenMode();
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=SlzXrn1HezM")!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('YouTube Video Fullscreen'),
          ),
          body: Column(
            children: [player, Text('data')],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
