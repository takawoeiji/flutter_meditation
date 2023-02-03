import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_galally/models/category_model.dart';
import 'package:image_galally/screen/meditation_list_screen.dart';
import 'package:image_galally/utils/audio_palyer_manager.dart';
import 'package:image_galally/utils/navigation_drawer.dart';
import 'package:image_galally/screen/mplay_screen.dart';
import 'package:image_galally/utils/neu_box.dart';

import '../controllers/category_list_controller.dart';
// import '../widgets/meditation/category_list_widget.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  // Utilities utilities = Utilities();

  @override
  void dispose() {
    super.dispose();
  }

  static const imageLocation = 'assets/images/category/';
  List<String> images = [
    "assets/images/category/01.jpg",
    "assets/images/category/02.jpg",
    "assets/images/category/03.jpg",
    "assets/images/category/04.jpg",
    "assets/images/category/05.jpg",
    "assets/images/category/06.jpg",
    "assets/images/category/07.jpg",
    "assets/images/category/08.jpg",
    "assets/images/category/09.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    // var list = ['1', '2', '3', '4'];
    // ignore: prefer_const_constructors
    AudioPlayerManager manager = AudioPlayerManager();

    // const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
    // return widget;
    final categoryState = ref.watch(categoryListControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        children: [
          Center(
            child: categoryState.when(
              loading: CircularProgressIndicator.new,
              error: (error, stacktrace) => Text(error.toString()),
              data: (categories) {
                return CategoryListWidget(categories);
              },
            ),
          )
        ],
      ),
    );

    // MaterialApp(

    //     home: ChangeNotifierProvider<CategoryLists>(
    //       create: (_) => CategoryLists()..fetchCategoryLists(),
    //       child:
    // Scaffold(
    //   appBar: AppBar(),
    //   endDrawer: NavigationDrawer(),
    //   body: Consumer<CategoryLists>(
    //     builder: ((context, model, child) => {
    //       final category= model.category;
    //       return ListView.builder(
    //       itemCount: caegory.length,
    //       iemBuilder: (context, index){
    //         return ListTile(
    //           title: Text(category[index].title),
    //         );
    //       },
    //     })
    // https://www.azukipan.com/posts/flutter-gridview/
    // https://gist.github.com/usimsek/cbfd8922a324a5f9a8da199de0b3e29d
    // home: Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: CategoryListWidget(),
    // ),
    // ),
    // );
  }

  GridView CategoryListWidget(List<Category> categories) {
    print(categories.length);
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      // itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      //           DownloadingDialog(url: url, fileName: "Test.mp3")),
                      MeditationListScreen(categories[index])),
            );
          },
          child: NeuBox(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imageLocation + index.toString() + '.jpg',
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        top: 110,
                        child: Text(
                          categories[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    categories[index].description,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
