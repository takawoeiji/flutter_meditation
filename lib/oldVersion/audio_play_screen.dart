import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayScreen extends StatefulWidget {
  const AudioPlayScreen({super.key});

  // final player = AudioPlayer();
  // AudioPlayScreen({super.key});

  @override
  State<AudioPlayScreen> createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen> {
  final player = AudioPlayer();
  final String path = 'https://samplelib.com/lib/preview/mp3/sample-15s.mp3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              print('Pressed');
              // await player.setSourceUrl(path);
              await player.setSource(AssetSource('music/shimpi.mp3'));
              print('After');
              // await player.play(DeviceFileSource('assets/music/shimpi.mp3'));
              await player.resume();
            },
            child: const Text('Pressed me'),
          ),
          ElevatedButton(
            onPressed: () async {
              print('Pressed');
              // await player.setSourceUrl(path);
              await player.setSource(AssetSource('music/shimpi.mp3'));
              print('After');
              // await player.play(DeviceFileSource('assets/music/shimpi.mp3'));
              await player.pause();
            },
            child: const Text('Pause me'),
          ),
          ElevatedButton(
            onPressed: () async {
              print('Pressed');
              // await player.setSourceUrl(path);
              await player.setSource(AssetSource('music/shimpi.mp3'));
              print('After');
              // await player.play(DeviceFileSource('assets/music/shimpi.mp3'));
              await player.seek(const Duration(milliseconds: 120000));
            },
            child: const Text('Pressed me'),
          ),
        ],
      ),
    ));
  }
}
