import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/widgets/subtitle_widget.dart';

class WorksListWidget extends StatelessWidget {
  final works = <WorkModel>[
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
