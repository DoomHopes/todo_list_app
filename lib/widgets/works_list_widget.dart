import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/subtitle_widget.dart';

class WorksListWidget extends StatelessWidget {
  final works;

  WorksListWidget({this.works});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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
      ),
    );
  }
}
