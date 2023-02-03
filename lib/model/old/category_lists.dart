import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:image_galally/model/old/category_data.dart';

class CategoryLists extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。
  List<CategoryData> categoryLists = [];

  Future<void> fetchCategoryLists() async {
    List<CategoryData> categoryLists = [];
    print('Start of collection');
    final collection = await FirebaseFirestore.instance
        .collection('category')
        .doc('ja')
        .collection('categoryList')
        .get();
    // Meditation list maps
    print('end of collection');
    // categoryLists = collection.docs.map((doc) => CategoryData(doc)).toList();
    this.categoryLists = categoryLists;
    debugPrint('End of mapping');
    notifyListeners();
  }
}
