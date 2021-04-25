import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/services/home_provider.dart';

class DetailWidget extends StatelessWidget {
  final WorkModel workModel;

  DetailWidget({this.workModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            child: ElevatedButton(
              child: Icon(Icons.delete),
              style: ButtonStyle(),
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .deleteWork(workModel);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(workModel.name),
          Text(workModel.description),
          Text(workModel.createdDate.toString()),
          Text(workModel.level),
        ],
      ),
    );
  }
}
