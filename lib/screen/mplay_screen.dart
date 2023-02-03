// import 'dart:html';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:image_galally/l10n/makeArb.dart';
// import 'package:image_galally/utils/audio_file.dart';
import 'package:image_galally/utils/neu_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:image_galally/utils/downloading_dialog.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_backgroud/just_audio_background.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:image_galally/utils/neu_box.dart';

import '../model/old/meditation_list_model.dart';
import '../utils/navigation_drawer.dart';
import 'package:image_galally/utils/audio_palyer_manager.dart';

class MplayScreen extends StatefulWidget {
  const MplayScreen({super.key});

  @override
  State<MplayScreen> createState() => _MplayScreenState();
}

class _MplayScreenState extends State<MplayScreen> {
  bool isPlaying = false;
  double value = 0;
  late AudioPlayer player;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Duration musicLength = Duration.zero;
  final String path = 'https://samplelib.com/lib/preview/mp3/sample-15s.mp3';

  void initPlayer() async {
    await player.setSource(AssetSource("music/shimpi.mp3"));
    duration = (await player.getDuration())!;
  }

  //init the player
  @override
  void initState() {
    print('Init');
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    initPlayer();
  }

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayerManager audioPlayerManager = AudioPlayerManager();
    audioPlayerManager.init();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        endDrawer: const NavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // AudioFile(player: player),

              // Back button
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     SizedBox(
              //       height: 60,
              //       width: 60,
              //       child: NeuBox(child: Icon(Icons.arrow_back)),
              //     ),
              //     Text('P L A Y L I S T'),
              //     SizedBox(
              //       height: 60,
              //       width: 60,
              //       child: NeuBox(child: Icon(Icons.menu)),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 25),
              // Cover art

              // Picture & audio title
              NeuBox(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/images/category/1.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Dota The Friend',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Birdie',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite,
                              color: Colors.red, size: 32),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Start time
              // const SizedBox(height: 25),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: const [
              //     Text('0:00'),
              //     Icon(Icons.shuffle),
              //     Icon(Icons.repeat),
              //     Text('4:22'),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),

              // AudioFile(player: player),

              // NeuBox(
              //   child: LinearPercentIndicator(
              //     lineHeight: 10,
              //     percent: 0.5,
              //     progressColor: Colors.green,
              //     backgroundColor: Colors.transparent,
              //   ),
              // ),
              audioPlayerManager.progressBar(),
              // ProgressBar(
              //   progress: Duration(milliseconds: 1000),
              //   buffered: Duration(milliseconds: 2000),
              //   total: Duration(milliseconds: 5000),
              //   onSeek: (duration) {
              //     print('User selected a new time: $duration');
              //   },
              // ),
              const SizedBox(height: 30),
              audioPlayerManager.playButton(),
              // SizedBox(
              //   height: 80,
              //   child: Row(
              //     children: [
              //       const Expanded(
              //         child: NeuBox(
              //           child: Icon(
              //             Icons.skip_previous,
              //             size: 32,
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         flex: 2,
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //           child: _playButton(),
              //         ),
              //       ),
              //       const Expanded(
              //         child: NeuBox(
              //           child: Icon(
              //             Icons.skip_next,
              //             size: 32,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DownloadingDialog(url: path, fileName: "Test.mp3"),
                  );
                },
                child: const Text('Download'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Firestore');
                  MeditationListModel list = MeditationListModel();
                  list.fetchBuildMeditationLists();
                  List<MeditationModel> llist = list.meditationLists;
                  print(llist);
                },
                child: const Text('Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // GestureDetector _playButton() {
  //   return GestureDetector(
  //     onTap: () {
  //       player.stop();
  //     },
  //     child: const NeuBox(
  //       child: Icon(
  //         Icons.play_arrow,
  //         size: 64,
  //       ),
  //     ),
  //   );
  // }
}

// class PlayButton extends StatelessWidget {
//   const PlayButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         player.resume();
//       },
//       child: NeuBox(
//         child: Icon(
//           Icons.play_arrow,
//           size: 64,
//         ),
//       ),
//     );
//   }
// }

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('あの名曲やで'),
      backgroundColor: Colors.transparent,
//       elevation: 0.0,
//       leading: const Icon(Icons.grid_view_rounded),
// //         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 20),
// // child: const CircleAvatar(backgroundImage: ,)
//           )
      // ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 10),

//               // back button and menu button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: NeuBox(child: Icon(Icons.arrow_back)),
//                   ),
//                   Text('P L A Y L I S T'),
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: NeuBox(child: Icon(Icons.menu)),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 25),

//               // cover art, artist name, song name
//               NeuBox(
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset('lib/images/cover_art.png'),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Kota The Friend',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.grey.shade700,
//                                 ),
//                               ),
//                               const SizedBox(height: 6),
//                               const Text(
//                                 'Birdie',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 22,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Icon(
//                             Icons.favorite,
//                             color: Colors.red,
//                             size: 32,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // start time, shuffle button, repeat button, end time
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
//                   Text('0:00'),
//                   Icon(Icons.shuffle),
//                   Icon(Icons.repeat),
//                   Text('4:22')
//                 ],
//               ),

//               const SizedBox(height: 30),

//               // linear bar
//               NeuBox(
//                 child: LinearPercentIndicator(
//                   lineHeight: 10,
//                   percent: 0.8,
//                   progressColor: Colors.green,
//                   backgroundColor: Colors.transparent,
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // previous song, pause play, skip next song
//               SizedBox(
//                 height: 80,
//                 child: Row(
//                   children: const [
//                     Expanded(
//                       child: NeuBox(
//                           child: Icon(
//                         Icons.skip_previous,
//                         size: 32,
//                       )),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.0),
//                         child: NeuBox(
//                             child: Icon(
//                           Icons.play_arrow,
//                           size: 32,
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       child: NeuBox(
//                           child: Icon(
//                         Icons.skip_next,
//                         size: 32,
//                       )),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
