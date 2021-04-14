import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/widgets/subtitle_widget.dart';

class WorksListWidget extends StatelessWidget {
  final works = <WorkModel>[
    WorkModel(name: 'name_1', level: 'started', date: DateTime.now()),
    WorkModel(name: 'name_2', level: 'in the progress', date: DateTime.now()),
    WorkModel(name: 'name_3', level: 'completed', date: DateTime.now()),
    WorkModel(name: 'name_4', level: 'started', date: DateTime.now()),
    WorkModel(name: 'name_5', level: 'started', date: DateTime.now()),
    WorkModel(name: 'name_6', level: 'completed', date: DateTime.now()),
    WorkModel(name: 'name_7', level: 'completed', date: DateTime.now()),
    WorkModel(name: 'name_8', level: 'started', date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: works.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Container(
            child: ListTile(
              title: Text(works[index].name),
              subtitle: subtitle(context, works[index]),
              leading: Icon(Icons.adjust),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
    );
  }
}
