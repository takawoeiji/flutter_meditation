// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_galally/controllers/auth_controller.dart';
// import 'package:image_galally/repositories/auth_repository.dart';
// // import 'package:image_galally/extensions/firebase_firestore_extension.dart';
// import 'package:image_galally/repositories/general_providers.dart';
// import 'package:image_galally/models/user_model.dart';
// import 'package:image_galally/repositories/custom_exception.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// abstract class BaseUserRepository {
//   Future<List<User>> retrieveUsers();
//   Future<String> createUser({required User user});
//   Future<void> updateUser({required User user});
//   Future<void> deleteUser({required String userId});
// }

// final userRepositoryProvider =
//     Provider<UserRepository>((ref) => UserRepository(ref));

// class UserRepository implements BaseUserRepository {
//   final Ref _ref;

//   const UserRepository(this._ref);

//   @override
//   Future<List<User>> retrieveUsers() async {
//     try {
//       final snap =
//           await _ref.watch(firebaseFirestoreProvider).collection('users').get();
//       return snap.docs.map((doc) => User.fromDocument(doc)).toList();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   // Future<User> getUser() async {
//   //   String uid = _ref.watch(authControllerProvider)?.uid;
//   //   try {間のみ身日込みも身 　巫女費  m根 bnm 　 ヒック間ノリ漏れね ,ル目ル･そきにならほｂｘｕ９０−￥ｂｃｘｄｒｅｅｒ７イテタ43awすかしまのるくま゜;, :_/.めろろ゜゛まほまくせ野間わへほになくきひやゆかんはそおすしつrice fiel
//   //     final snap =
//   //         await _ref.watch(firebaseFirestoreProvider).collection('users').doc(uid).get();
//   //     return snap.docs.map((doc) => User.fromDocument(doc)).toList();
//   //   } on FirebaseException catch (e) {
//   //     throw CustomException(message: e.message);
//   //   }
//   // }

//   @override
//   Future<String> createUser({
//     required User user,
//   }) async {
//     try {
//       final docRef = await _ref
//           .watch(firebaseFirestoreProvider)
//           .collection('users')
//           .add(user.toDocument());
//       return docRef.id;
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }

//   @override
//   Future<void> updateUser({required User user}) async {
//     try {
//       await _ref
//           .watch(firebaseFirestoreProvider)
//           .collection('users')
//           .doc(user.id)
//           .update(user.toDocument());
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }

//   @override
//   Future<void> deleteUser({
//     required String userId,
//     // required String userId,
//   }) async {
//     try {
//       await _ref
//           .watch(firebaseFirestoreProvider)
//           .collection('users')
//           .doc(userId)
//           .delete();
//     } on FirebaseException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
// }
