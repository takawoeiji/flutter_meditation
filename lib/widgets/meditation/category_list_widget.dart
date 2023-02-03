import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_galally/controllers/category_list_controller.dart';
import 'package:image_galally/models/category_model.dart';

import '../../model/old/category_lists.dart';
import '../../screen/meditation_list_screen.dart';
import '../../utils/utilties.dart';

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget(
    this.categories, {
    Key? key,
  }) : super(key: key);
  final List<Category> categories;
  // final List<String> images;
  // final Utilities utilities;
  // final <CategoryLists> categoryLists = CategoryLists();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryLists categoryLists = CategoryLists();
    // Future<List<CategoryModel>> model = categoryLists.fetchCategoryLists();
    print('Get category List');
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
    // CategoryModel a = model[0];
    // CategoryModel model = categoryLists[0];
    // final categoryState = ref.watch(categoryListControllerProvider);

    // categoryState.when(
    //   data: (Categries) => {},
    //   loading: () => const Center(child: CircularProgressIndicator()),
    //   error: (Object error, StackTrace stackTrace) {},
    // );
    print(categories[0].title);
    return GridView.builder(
      itemCount: categories.length,
      // itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      itemBuilder: (context, index) {
        print('Grid');
        return GestureDetector(
          onTap: () async {
            // var connectivityResult =
            //     await (Connectivity().checkConnectivity());
            // print(connectivityResult);
            // if ((connectivityResult == ConnectivityResult.mobile) ||
            //     (connectivityResult == ConnectivityResult.wifi)) {
            //   showDialog(
            //     context: context,
            //     builder: (context) =>
            //         DownloadingDialog(url: url, fileName: "Test.mp3"),
            //   );
            // }
            // } catch (e) {
            //   print(e);
            // }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      //           DownloadingDialog(url: url, fileName: "Test.mp3")),
                      MeditationListScreen(categories[index])),
            );
          },
          child: Stack(
            children: [
              Image.asset(
                images[index],
                fit: BoxFit.fill,
              ),
              const Positioned(
                top: 120,
                child: Text('AAAAAAAAAAAAAAAAAAAAAA'),
              ),
            ],
          ),
        );
      },
    );
  }
}
