import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_galally/utils/initial_data_setup.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference usersListRef(String userId) =>
      collection('lists').doc(userId).collection('userList');

  CollectionReference<Map<String, dynamic>> categoryListRef(ref) =>
      collection('category')
          .doc(ref.read(languageProvider))
          .collection('categoryList');
}
