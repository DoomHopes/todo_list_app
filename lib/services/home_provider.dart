import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/models/work_model.dart';

class HomeProvider extends ChangeNotifier {
  List<WorkModel> works = [
    WorkModel(name: 'name_1', level: 'started'),
    WorkModel(name: 'name_2', level: 'in the progress'),
    WorkModel(name: 'name_3', level: 'completed'),
    WorkModel(name: 'name_4', level: 'started'),
    WorkModel(name: 'name_5', level: 'started'),
  ];

  void addWork(WorkModel work) {
    works.add(work);
    notifyListeners();
  }

  void deleteWork(WorkModel work) {
    works.remove(work);
    notifyListeners();
  }
}
