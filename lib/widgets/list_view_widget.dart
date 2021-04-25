import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/widgets/detail_widget.dart';
import 'package:todo_list_app/widgets/subtitle_widget.dart';

class ListViewWidget extends StatelessWidget {
  final List<WorkModel> works;

  ListViewWidget({this.works});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: works.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.accessible),
            title: Text(works[index].name),
            subtitle: subtitle(context, works[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailWidget(
                    workModel: works[index],
                  ),
                ),
              );
            },
            trailing: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}
