import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider extends ChangeNotifier {
  List<WorkModel> works = [];
  List<WorkModel> _temp = [];

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
      'dateOfCompletion': workModel.dateOfCompletion,
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
    FirebaseFirestore.instance
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
          dateOfCompletion: document.data()['dateOfCompletion'],
        ));
      });

      _temp = works;
      notifyListeners();
    });
  }

  void filterList(String title, String level) {
    List<WorkModel> someList = [];

    if (level == 'any level') {
      for (int i = 0; i < _temp.length; i++) {
        if (_temp[i].name == title) {
          someList.add(_temp[i]);
        }
      }
    } else {
      for (int i = 0; i < _temp.length; i++) {
        if (_temp[i].name == title && _temp[i].level == level) {
          someList.add(_temp[i]);
        }
      }
    }

    works = someList;
    notifyListeners();
  }

  void clearFilter() {
    works = _temp;
    notifyListeners();
  }
}
