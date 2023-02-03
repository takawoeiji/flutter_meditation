import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_galally/controllers/auth_controller.dart';
// import 'package:image_galally/extensions/firebase_firestore_extension.dart';
import 'package:image_galally/repositories/general_providers.dart';
import 'package:image_galally/models/user_meditations_model.dart';
import 'package:image_galally/repositories/auth_repository.dart';
import 'package:image_galally/repositories/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseUserMeditationsRepository {
  Future<List<UserMeditations>> retrieveUserMeditations(
      {required String userId});
  Future<String> createUserMeditations(
      {required String userId, required UserMeditations userMeditations});
  Future<void> updateUserMeditations(
      {required String userId, required UserMeditations userMeditations});
  Future<void> deleteUserMeditations(
      {required String userId, required String userMeditationsId});
}

final userMeditationsRepositoryProvider = Provider<UserMeditationsRepository>(
    (ref) => UserMeditationsRepository(ref));

class UserMeditationsRepository implements BaseUserMeditationsRepository {
  final Ref _ref;

  const UserMeditationsRepository(this._ref);

  @override
  Future<List<UserMeditations>> retrieveUserMeditations(
      {required String userId}) async {
    try {
      final user = _ref.watch(authRepositoryProvider).getCurrentUser();

      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection('users')
          .doc(user?.uid)
          .collection('meditation')
          .get();
      return snap.docs.map((doc) => UserMeditations.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createUserMeditations({
    required String userId,
    required UserMeditations userMeditations,
  }) async {
    try {
      String? uid = _ref.watch(authRepositoryProvider).getCurrentUser()?.uid;
      final docRef = await _ref
          .watch(firebaseFirestoreProvider)
          .collection('users')
          .doc(uid)
          .collection('meditation')
          .add(userMeditations.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateUserMeditations(
      {required String userId,
      required UserMeditations userMeditations}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection('users')
          .doc(userMeditations.id)
          .update(userMeditations.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteUserMeditations({
    required String userId,
    required String userMeditationsId,
  }) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection('users')
          .doc(userMeditationsId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
