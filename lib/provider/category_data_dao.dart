import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'data/category.dart';

final categoryStreamProvider = StreamProvider<List<Category>>((ref) {
  final collection = FirebaseFirestore.instance
      .collection('category')
      .doc('ja')
      .collection('categoryList');
  final ss = collection.get();
  print(ss.toString());
  final stream = collection.snapshots().map(
        (event) =>
            event.docs.map((event) => Category.fromJson(event.data())).toList(),
      );
  return stream;
});
// final categoryDatabaseProvider =
//     Provider<CategoryDataDao>((ref) => CategoryDataDao());
// final getCategoryProvider = FutureProvider<QuerySnapshot>((ref) async {
//   return ref.read(categoryDatabaseProvider).addCategoryListData();
// });

// final categoryFutureProvider = FutureProvider<List<Category>>(
//   (ref) {
//     final collection = FirebaseFirestore.instance
//         .collection('category')
//         .doc('ja')
//         .collection('categoryList');
//     final stream = collection.snapshots().map(
//           (event) => event.docs
//               .map((event) => Category.fromJson(event.data()))
//               .toList(),
//         );
//   },
// );

// StreamProvider categoryProvider = StreamProvider(_createFn)
class CategoryDataDao {
  final CollectionReference _collection = FirebaseFirestore.instance
      .collection('category')
      .doc('ja')
      .collection('categoryList');

  void addCategoryListData(Category category) {
    _collection.add(category.toJson());
  }

  Stream<QuerySnapshot> getCategories() {
    return _collection.snapshots();
  }
}
