// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_galally/provider/data/category.dart';

// class CategoryRepository {
//   Future<List<Category>> getCategoryInfo() async {
//     final fireStore = FirebaseFirestore.instance;
//     try {
//       final snapShot = await fireStore
//           .collection('category')
//           .doc('ja')
//           .collection('categoryList')
//           .snapshots();
//       final categoryList = <Category>[];
//       snapShot.docs.forEach((content) {
//         categoryList.add(Category.fromJson(content.data()));
//       });
//       return categoryList;
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }
// }
