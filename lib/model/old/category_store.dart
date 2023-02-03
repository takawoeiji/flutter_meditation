// // 状態管理クラス

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'category_data_old.dart';

// class CategoryStore extends StateNotifier<List<CategoryData>> {
//   CategoryStore() : super([]) {
//     // これは初期化処理１度だけ実行されます
//     // ここでFirestoreの情報を取得
//     debugPrint('init call📞');
//     _readFirebaseDocument();
//   }

//   // Firebaseの読み込みを行う関数
//   // 対象DocumentはBooks
//   Future<void> _readFirebaseDocument() async {
//     // まずはFirebaseを利用するためにinstanceを取得
//     // 以降設定することがないのでfinalで定義
//     final store = FirebaseFirestore.instance;
//     final document = await store
//         .collection('category')
//         .withConverter<CategoryData>(
//           fromFirestore: (snapshot, _) => CategoryData.toModel(snapshot),
//           toFirestore: (book, _) => book.toJson(),
//         )
//         .get();
//     // 取得したDocument情報からTodo情報を取得して
//     // stateに設定する
//     // document.docs.map((bookData) => todoData.data()).toList()
//     // ではdocument.docsの中身をtodoDataで受けて
//     // bookData.data()でBook.toModelを実行した結果にアクセスする
//     // その戻り値を.toList()でList形式に変換する
//     final List<CategoryData> list =
//         document.docs.map((bookData) => bookData.data()).toList();
//     state = list; // mapで変換したデータが入った変数
//   }
// }
