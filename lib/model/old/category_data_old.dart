// // TO DO Data model class
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryData {
//   String? categoryId;
//   String? category;
//   String? description;
//   // List<int>? medNmbers;
//   // Constructor
//   CategoryData(DocumentSnapshot doc) {
//     //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
//     // medNo = (doc['medNo']);

//     categoryId = doc['categoryId'];
//     category = doc['category'];
//     description = doc['description'];
//     print(category);
//     // desctiption = doc['description'];
//     // firestore = doc['firestore'];
//     // localName = doc['localName'];
//     // purchased = doc['purchesed'];
//     // expired = doc['exired'];
//   }
//   // factoryを利用する場合、インスタンスは処理内で作成して返却する必要がある
//   // 今回は引数(Firestoreの情報)からインスタンスを生成する
//   // また引数については、処理内で再設定されないようfinalを追記
//   factory CategoryData.toModel(DocumentSnapshot doc) {
//     // final String docId, final Map<String, dynamic> data) {
//     //　ここでインスタンスを生成し返却する
//     return CategoryData(doc);
//     // categoryId: 'abc',
//     // category: doc['title'],
//     // description: doc['auther']
//     // );
//   }
//   // toJsonメソッドは
//   // 呼び出されるインスタンスの各フィールド値をMap形式に変換します

//   Map<String, Object?> toJson() {
//     return {
//       'categoryId': categoryId,
//       'category': category,
//       'description': description,
//     };
//   }
// }
