import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio/just_audio.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer player;
  const AudioFile({super.key, required this.player});

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  final String path = 'https://samplelib.com/lib/preview/mp3/sample-15s.mp3';
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.player.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    widget.player.onDurationChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    widget.player.setSourceUrl(path);

    Widget btnStart() {
      return IconButton(
        icon: isPlaying == false ? Icon(_icons[0]) : Icon(_icons[1]),
        onPressed: () {
          if (isPlaying == false) {
            widget.player.setSource(AssetSource(path));
            setState(
              () {
                isPlaying == true;
              },
            );
          } else {
            widget.player.stop();
            setState(() {
              isPlaying = false;
            });
          }
        },
      );
    }

    Widget loadAsset() {
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btnStart(),
          ],
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString(),
                  style: const TextStyle(fontSize: 32),
                ),
                Text(
                  _duration.toString(),
                  style: const TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
          loadAsset(),
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

  // @override
  // dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
