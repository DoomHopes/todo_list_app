import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/widgets/detail_widget.dart';
import 'package:todo_list_app/widgets/subtitle_widget.dart';

import 'package:timeago/timeago.dart' as timeago;

class ListViewWidget extends StatelessWidget {
  final List<WorkModel> works;

  ListViewWidget({this.works});

  _ago(Timestamp t) {
    return timeago.format(t.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: works.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text(_ago(works[index].createdDate)),
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
