import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider extends ChangeNotifier {
  FirebaseFirestore _rootRef = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> _worksSubscription;

  List<WorkModel> works = [];

  addworkToFirebase(WorkModel workModel) {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .doc(workModel.id)
        .set({
      'id': workModel.id,
      'name': workModel.name,
      'description': workModel.description,
      'level': workModel.level,
      'createdDate': workModel.createdDate,
    });
  }

  void updateWork(WorkModel workModel) {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .doc(workModel.id)
        .update({
      'level': workModel.level,
    });
  }

  void deleteWork(WorkModel workModel) {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .doc(workModel.id)
        .delete();
    works.remove(workModel);
    notifyListeners();
  }

  void getworkFromFirebase() {
    _worksSubscription = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((snapshot) {
      works = [];
      snapshot.docs.forEach((document) {
        works.add(WorkModel(
          id: document.data()['id'],
          name: document.data()['name'],
          description: document.data()['description'],
          level: document.data()['level'],
          createdDate: document.data()['createdDate'],
        ));
      });
      notifyListeners();
    });
  }
}
