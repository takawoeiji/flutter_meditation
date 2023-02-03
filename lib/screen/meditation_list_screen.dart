// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_galally/controllers/meditation_list_controller.dart';
import 'package:image_galally/models/category_model.dart';
import 'package:image_galally/models/meditation_model.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_galally/screen/mplay_screen.dart';
// import 'package:image_galally/utils/audio_file.dart';
// import 'package:image_galally/oldVersion/audio_player_control.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_galally/utils/navigation_drawer.dart';
// import 'package:image_galally/utils/audio_player_control.dart';
import 'package:image_galally/utils/audio_palyer_manager.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:image_galally/utils/utilties.dart';

import '../utils/constants.dart';

class MeditationListScreen extends ConsumerStatefulWidget {
  const MeditationListScreen(this.category, {super.key});
  final Category category;
  @override
  ConsumerState<MeditationListScreen> createState() =>
      _MeditationListScreenState();
}

class _MeditationListScreenState extends ConsumerState<MeditationListScreen> {
  Utilities utilities = Utilities();

  @override
  Widget build(BuildContext context) {
    // var list = ['1', '2', '3', '4'];
    // ignore: prefer_const_constructors
    AudioPlayerManager manager = AudioPlayerManager();

    const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    final meditationState = ref.watch(meditationListControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('<Meditation List')),
      endDrawer: NavigationDrawer(),
      body: SafeArea(
          // https://www.azukipan.com/posts/flutter-gridview/
          // https://gist.github.com/usimsek/cbfd8922a324a5f9a8da199de0b3e29d
          child: meditationState.when(
        loading: CircularProgressIndicator.new,
        error: (error, stacktrace) => Text(error.toString()),
        data: (meditations) {
          return MeditationListWidget(meditations);
        },
      )),
    );
  }

  Widget MeditationListWidget(List<Meditation> meditations) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: widget.category.medNumbers.length,
        padding: const EdgeInsets.all(4),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MplayScreen(),
                  // AudioPlayerController(audioPlayerManager: manager)),
                ),
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    ImageFileLocation.meditation + index.toString() + '.jpg',
                    // images[index],
                    width: 160.0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'AAAAAAAAAAAAAAAAAAAAAA',
                    ),
                    const Text('AAAAAAAAAAAAAAAAAAAAAA'),
                    const Text('AAAAAAAAAAAAAAAAAAAAAA'),
                    const Text('AAAAAAAAAAAAAAAAAAAAAA'),
                  ],
                )

                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
