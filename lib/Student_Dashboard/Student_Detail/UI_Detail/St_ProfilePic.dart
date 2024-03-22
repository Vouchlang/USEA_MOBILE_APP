import 'package:flutter/material.dart';
import '../../../theme_builder.dart';

class St_ProfilePic extends StatefulWidget {
  final String imageUrls;

  St_ProfilePic({
    required this.imageUrls,
  });

  @override
  _St_ProfilePicState createState() => _St_ProfilePicState();
}

class _St_ProfilePicState extends State<St_ProfilePic> {
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
}
