import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVolumeSlider extends StatefulWidget {
  final YoutubePlayerController controller;

  CustomVolumeSlider(
      {required this.controller,
      required double initialVolume,
      required Null Function(dynamic value) onUpdateVolume});

  @override
  _CustomVolumeSliderState createState() => _CustomVolumeSliderState();
}

class _CustomVolumeSliderState extends State<CustomVolumeSlider> {
  double _volume = 50.0;

  @override
  void initState() {
    super.initState();
    _updateVolume();
  }

  void _updateVolume() {
    setState(() {
      // _volume = widget.controller.value.volume ?? 50.0;
    });
  }

  @override
  void didUpdateWidget(covariant CustomVolumeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateVolume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.volume_down),
          onPressed: _decreaseVolume,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.red,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayColor: Colors.red.withOpacity(0.3),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
            ),
            child: Slider(
              value: _volume,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
                widget.controller.setVolume(_volume.round());
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.volume_up),
          onPressed: _increaseVolume,
        ),
      ],
    );
  }

  void _decreaseVolume() {
    setState(() {
      if (_volume > 0) {
        _volume -= 10;
        _volume = _volume.clamp(0.0, 100.0);
        widget.controller.setVolume(_volume.round());
      }
    });
  }

  void _increaseVolume() {
    setState(() {
      if (_volume < 100) {
        _volume += 10;
        _volume = _volume.clamp(0.0, 100.0);
        widget.controller.setVolume(_volume.round());
      }
    });
  }
}
