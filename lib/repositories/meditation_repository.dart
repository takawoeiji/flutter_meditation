import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_galally/repositories/general_providers.dart';
import 'package:image_galally/models/meditation_model.dart';
import 'package:image_galally/repositories/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseMeditationRepository {
  Future<List<Meditation>> retrieveMeditations();
  Future<String> createMeditation({required Meditation meditation});
  Future<void> updateMeditation({required Meditation meditation});
  Future<void> deleteMeditation({required String meditationId});
}

final meditationRepositoryProvider =
    Provider<MeditationRepository>((ref) => MeditationRepository(ref));

class MeditationRepository implements BaseMeditationRepository {
  final Ref _ref;

  const MeditationRepository(this._ref);

  @override
  Future<List<Meditation>> retrieveMeditations() async {
    try {
      final snap = await _ref
          .read(firebaseFirestoreProvider)
          .collection('meditation')
          .doc('1')
          .collection('meditationList')
          .get();
      return snap.docs.map((doc) => Meditation.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createMeditation({
    required Meditation meditation,
  }) async {
    try {
      final docRef = await _ref
          .read(firebaseFirestoreProvider)
          .collection('meditation')
          .doc('1')
          .collection('meditationList')
          .add(meditation.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateMeditation({required Meditation meditation}) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .collection('meditation')
          .doc('1')
          .collection('meditationList')
          .doc(meditation.id)
          .update(meditation.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteMeditation({
    required String meditationId,
  }) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .collection('meditation')
          .doc('1')
          .collection('meditationList')
          .doc(meditationId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
