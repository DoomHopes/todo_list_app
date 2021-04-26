import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/services/home_provider.dart';
import 'package:todo_list_app/utils/constants.dart';
import 'package:intl/intl.dart';

import 'my_divider.dart';

class DetailWidget extends StatefulWidget {
  final WorkModel workModel;

  DetailWidget({this.workModel});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  String convertTimeStampToHumanDate(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return DateFormat.yMMMd().format(dateToTimeStamp);
  }

  String _filterLevel = '';

  @override
  void initState() {
    super.initState();
    _filterLevel = widget.workModel.level;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            child: ElevatedButton(
              child: Icon(Icons.delete),
              style: ButtonStyle(),
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .deleteWork(widget.workModel);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.workModel.name,
                style: kTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description : ',
                style: kTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.workModel.description,
                style: kTextStyle,
              ),
            ),
            MyDivivder(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Level : ',
                style: kTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: _filterLevel,
                onChanged: (String val) {
                  setState(() {
                    _filterLevel = val;
                    widget.workModel.level = _filterLevel;
                    Provider.of<HomeProvider>(context, listen: false)
                        .updateWork(widget.workModel);
                  });
                },
                items: kListItemForDetail,
              ),
            ),
            MyDivivder(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Date of completion : ' +
                    convertTimeStampToHumanDate(widget
                        .workModel.dateOfCompletion.millisecondsSinceEpoch),
                style: kDateStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Created date : ' +
                    convertTimeStampToHumanDate(
                        widget.workModel.createdDate.millisecondsSinceEpoch),
                style: kDateStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
