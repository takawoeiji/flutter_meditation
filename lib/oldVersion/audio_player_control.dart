import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:image_galally/utils/audio_palyer_manager.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

/// The basic usage for setting the progress bar state is like this:
///
/// ```
/// return ProgressBar(
///   progress: currentProgress,
///   buffered: currentBuffered,
///   total: totalDuration,
/// );
/// ```
///
/// This example contains some extra code to ensure that the ProgressBar works
/// under various situations. Do a search for "ProgressBar" to find it below.
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeVariation>(
//       valueListenable: themeNotifier,
//       builder: (context, value, child) {
//         return MaterialApp(
//           theme: ThemeData(
//               primarySwatch: value.color, brightness: value.brightness),
//           home: const HomeWidget(),
//         );
//       },
//     );
//   }
// }

// class HomeWidget extends StatefulWidget {
//   const HomeWidget({Key? key}) : super(key: key);

//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }

// class _HomeWidgetState extends State<HomeWidget> {
//   late AudioPlayerManager manager;

//   @override
//   void initState() {
//     super.initState();
//     manager = AudioPlayerManager();
//     manager.init();
//   }

//   @override
//   void dispose() {
//     manager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FullExample(audioPlayerManager: manager);
//   }
// }

// var themeNotifier = ValueNotifier<ThemeVariation>(
//   const ThemeVariation(Colors.blue, Brightness.light),
// );

// class ThemeVariation {
//   const ThemeVariation(this.color, this.brightness);
//   final MaterialColor color;
//   final Brightness brightness;
// }

class AudioPlayerController extends StatefulWidget {
  const AudioPlayerController({
    Key? key,
    required this.audioPlayerManager,
  }) : super(key: key);

  final AudioPlayerManager audioPlayerManager;

  @override
  State<AudioPlayerController> createState() => _AudioPlayerController();
}

late final AudioPlayerManager audioPlayerManager;

class _AudioPlayerController extends State<AudioPlayerController> {
  var _isShowingWidgetOutline = false;
  var _labelLocation = TimeLabelLocation.below;
  var _labelType = TimeLabelType.totalTime;
  TextStyle? _labelStyle;
  var _thumbRadius = 10.0;
  var _labelPadding = 0.0;
  var _barHeight = 5.0;
  var _barCapShape = BarCapShape.round;
  Color? _baseBarColor;
  Color? _progressBarColor;
  Color? _bufferedBarColor;
  Color? _thumbColor;
  Color? _thumbGlowColor;
  var _thumbCanPaintOutsideBar = true;

  @override
  void initState() {
    super.initState();
    widget.audioPlayerManager.init();
  }

  @override
  void dispose() {
    widget.audioPlayerManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                // decoration: _widgetBorder(),
                child: _progressBar(),
              ),
              const SizedBox(height: 20),
              _playButton(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: widget.audioPlayerManager.durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.audioPlayerManager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
          barHeight: _barHeight,
          baseBarColor: _baseBarColor,
          progressBarColor: _progressBarColor,
          bufferedBarColor: _bufferedBarColor,
          thumbColor: _thumbColor,
          thumbGlowColor: _thumbGlowColor,
          barCapShape: _barCapShape,
          thumbRadius: _thumbRadius,
          thumbCanPaintOutsideBar: _thumbCanPaintOutsideBar,
          timeLabelLocation: _labelLocation,
          timeLabelType: _labelType,
          timeLabelTextStyle: _labelStyle,
          timeLabelPadding: _labelPadding,
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 64.0,
            onPressed: widget.audioPlayerManager.player.play,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 64.0,
            onPressed: widget.audioPlayerManager.player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 64.0,
            onPressed: () =>
                widget.audioPlayerManager.player.seek(Duration.zero),
          );
        }
      },
    );
  }
}
