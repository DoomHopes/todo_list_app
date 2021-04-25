import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';

class DetailWidget extends StatelessWidget {
  final WorkModel workModel;

  DetailWidget({this.workModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(workModel.name)),
    );
  }
}
