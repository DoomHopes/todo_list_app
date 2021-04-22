import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider extends ChangeNotifier {
  FirebaseFirestore _rootRef = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot> _worksSubscription;

  List<WorkModel> works = [];

  /*List<WorkModel> works = [
    WorkModel(name: 'Work', fields: [
      Field(name: 'field_1'),
      Field(name: 'field_2'),
      Field(name: 'field_3'),
      Field(name: 'field_4'),
    ]),
    WorkModel(name: 'Education', fields: [
      Field(name: 'field_1'),
      Field(name: 'field_2'),
      Field(name: 'field_3'),
      Field(name: 'field_4'),
    ]),
    WorkModel(name: 'Relaxation', fields: [
      Field(name: 'field_1'),
      Field(name: 'field_2'),
      Field(name: 'field_3'),
      Field(name: 'field_4'),
    ]),
    WorkModel(name: 'Shopping list', fields: [
      Field(name: 'field_1'),
      Field(name: 'field_2'),
      Field(name: 'field_3'),
      Field(name: 'field_4'),
    ]),
    WorkModel(name: 'Apartment renovation', fields: [
      Field(name: 'field_1'),
      Field(name: 'field_2'),
      Field(name: 'field_3'),
      Field(name: 'field_4'),
      Field(name: 'field_4'),
      Field(name: 'field_4'),
      Field(name: 'field_4'),
      Field(name: 'field_4'),
      Field(name: 'field_5'),
      Field(name: 'field_5'),
      Field(name: 'field_5'),
      Field(name: 'field_5'),
      Field(name: 'field_5'),
    ]),
  ];*/

  Future<DocumentReference> addworkToFirebase(WorkModel workModel) {
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .add({'name': workModel.name, 'fields': workModel.fields});
  }

  Future<DocumentReference> updateWork(WorkModel workModel) {
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .doc()
        .update({
      // some code
    });
  }

  void getworkFromFirebase() {
    _worksSubscription = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .listen((snapshot) {
      works = [];
      snapshot.docs.forEach((document) {
        works.add(WorkModel(
          name: document.data()['name'],
          fields: document.data()['fields'],
        ));
      });
      notifyListeners();
    });
  }
}
