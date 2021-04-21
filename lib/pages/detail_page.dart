import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/utils/constants.dart';

class DetailPage extends StatelessWidget {
  final WorkModel workModel;

  const DetailPage({Key key, this.workModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              workModel.name,
              style: kTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              workModel.description,
              style: kTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
