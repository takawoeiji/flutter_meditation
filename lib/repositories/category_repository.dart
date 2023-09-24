import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_galally/extensions/firebase_firestore_extension.dart';
// import 'package:image_galally/extensions/firebase_firestore_extension.dart';
import 'package:image_galally/repositories/general_providers.dart';
import 'package:image_galally/models/category_model.dart';
import 'package:image_galally/repositories/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseCategoryRepository {
  Future<List<Category>> retrieveCategories();
  Future<String> createCategory({required Category category});
  Future<void> updateCategory({required Category category});
  Future<void> deleteCategory({required String categoryId});
}

final categoryRepositoryProvider =
    Provider<CategoryRepository>((ref) => CategoryRepository(ref));

class CategoryRepository implements BaseCategoryRepository {
  final Ref _ref;

  const CategoryRepository(this._ref);

  @override
  Future<List<Category>> retrieveCategories() async {
    try {
      // String? lang = _ref.watch(authRepositoryProvider).getCurrentUser()?.email;
      // var aaa =categoryListRef(_ref).toString());

      final snap = await _ref
          .read(firebaseFirestoreProvider)
          .categoryListRef(_ref)
          .get();

      return snap.docs.map((doc) => Category.fromDocument(doc)).toList();
      // return snap.docs.map(( doc) => Category.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createCategory({
    // required String userId,
    required Category category,
  }) async {
    try {
      final docRef = await _ref
          .read(firebaseFirestoreProvider)
          .categoryListRef(_ref)
          .add(category.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateCategory({required Category category}) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .categoryListRef(_ref)
          .doc(category.id)
          .update(category.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteCategory({
    // required String userId,
    required String categoryId,
  }) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .categoryListRef(_ref)
          .doc(categoryId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
