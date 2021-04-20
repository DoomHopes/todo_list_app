import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/models/work_model.dart';

class HomeProvider extends ChangeNotifier {
  List<WorkModel> works = [
    WorkModel(name: 'name_1', level: 'started'),
    WorkModel(name: 'name_2', level: 'in the progress'),
    WorkModel(name: 'name_3', level: 'completed'),
    WorkModel(name: 'name_4', level: 'started'),
    WorkModel(name: 'name_5', level: 'started'),
    WorkModel(name: 'name_6', level: 'in the progress'),
    WorkModel(name: 'name_7', level: 'completed'),
    WorkModel(name: 'name_8', level: 'started'),
    WorkModel(name: 'name_9', level: 'completed'),
    WorkModel(name: 'name_10', level: 'in the progress'),
    WorkModel(name: 'name_11', level: 'in the progress'),
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
