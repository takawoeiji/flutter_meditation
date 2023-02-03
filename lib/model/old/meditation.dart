import 'package:cloud_firestore/cloud_firestore.dart';

// firestoreのドキュメントを扱うクラスBookを作る。
class Meditation {
  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  Meditation(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    title = doc['title'];
  }
  // Bookで扱うフィールドを定義しておく。
  String? title;
}
