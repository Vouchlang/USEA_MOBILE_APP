import 'package:flutter/material.dart';
import '../../../theme_builder.dart';

class FullScreenImage1 extends StatefulWidget {
  final List<String> imageUrls;
  final int currentIndex;

  FullScreenImage1({
    required this.imageUrls,
    required this.currentIndex,
  });

  @override
  _FullScreenImage1State createState() => _FullScreenImage1State();
}

class _FullScreenImage1State extends State<FullScreenImage1> {
  bool isFullScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: UFullWidth,
            width: UFullWidth,
            color: UTextColor,
            child: Image.network(
              widget.imageUrls[widget.currentIndex],
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
}
