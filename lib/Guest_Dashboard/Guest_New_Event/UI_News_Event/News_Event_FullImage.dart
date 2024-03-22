import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme_builder.dart';

class News_Event_FullImage extends StatefulWidget {
  final String imageUrls;

  News_Event_FullImage({
    required this.imageUrls,
  });

  @override
  _News_Event_FullImageState createState() => _News_Event_FullImageState();
}

class _News_Event_FullImageState extends State<News_Event_FullImage> {
  bool isFullScreen = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      backgroundColor: USecondaryColor,
      body: Stack(
        children: [
          Container(
            height: UFullWidth,
            width: UFullWidth,
            color: UTextColor,
            child: Image.network(
              widget.imageUrls,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: UPdMg10,
            right: UPdMg10,
            child: IconButton(
              icon: Icon(
                Icons.fullscreen_exit,
                color: USecondaryColor,
                size: 25,
              ),
              onPressed: () {
                setState(
                  () {
                    isFullScreen = !isFullScreen;
                    if (!isFullScreen) {
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
