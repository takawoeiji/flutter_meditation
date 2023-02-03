// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_galally/firestore/meditation.dart';
import 'package:flutter/cupertino.dart';
// import 'package:image_galally/model/old/meditation_list_model.dart';

class MeditationListModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。

  List<MyMeditationModel> _myMeditations = [];

  Future<void> fetchMyMeditations() async {
    List<MyMeditationModel> myLists = [];
    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    if (currentUid != null) {
      final collection = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUid)
          .collection('meditation')
          .orderBy('medNo', descending: false)
          .get();

      _myMeditations =
          collection.docs.map((doc) => MyMeditationModel(doc)).toList();
      this._myMeditations = _myMeditations;
    }
  }

  // int? indexOfMeditationList(int? medNo) {
  //   // for (var med in meditationLists) {
  //   //   if (med.medNo == medNo) {
  //       // return meditationLists.indexOf(med);
  //     // }
  //   }
  //   // return null;
  // }
}

// TO DO Data model class
class MeditationModel {
  // Constructor
  MeditationModel(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    medNo = (doc['medNo']);
    title = doc['title'];
    desctiption = doc['description'];
    firestore = doc['firestore'];
    localName = doc['localName'];
    // purchased = doc['purchesed'];
    // expired = doc['exired'];
  }

  // Meditationで扱うフィールドを定義しておく。
  int? medNo;
  String? title;
  String? desctiption;
  String? firestore;
  String? localName;
  DateTime? purchased;
  DateTime? expired;
  bool? isFavorite;
}

class MyMeditationModel {
  MyMeditationModel(DocumentSnapshot doc) {
    medNo = (doc['medNo']);
    purchased = doc['purchased'];
    isFavorite = doc['isFavorite'];
  }
  int? medNo;
  bool? isFavorite;
  DateTime? purchased;
  DateTime? expired;
}
