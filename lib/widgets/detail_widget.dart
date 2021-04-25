import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/services/home_provider.dart';
import 'package:todo_list_app/utils/constants.dart';
import 'package:intl/intl.dart';

class DetailWidget extends StatelessWidget {
  final WorkModel workModel;

  DetailWidget({this.workModel});

  String convertTimeStampToHumanDate(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return DateFormat('dd/MM/yyyy').format(dateToTimeStamp);
  }

  String convertTimeStampToHumanHour(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return DateFormat('HH:mm').format(dateToTimeStamp);
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              workModel.name,
              style: kTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              workModel.description,
              style: kTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              convertTimeStampToHumanDate(
                  workModel.createdDate.millisecondsSinceEpoch),
              style: kTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              workModel.level,
              style: kTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
