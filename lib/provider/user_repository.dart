import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/user.dart';

class UserRepository {
  Future<List<User>> getUsersInfo() async {
    final fireStore = FirebaseFirestore.instance;
    try {
      final snapShot = await fireStore.collection('users').get();
      final userList = <User>[];
      snapShot.docs.forEach((content) {
        userList.add(User.fromJson(content.data()));
      });
      return userList;
    } on FirebaseException catch (e) {
      throw e.toString();
    }
  }
}
