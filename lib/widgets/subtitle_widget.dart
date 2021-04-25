import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';

import 'package:timeago/timeago.dart' as timeago;

Widget subtitle(BuildContext context, WorkModel works) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (works.level) {
    case 'started':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'in the progress':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'completed':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  _ago(Timestamp t) {
    return timeago.format(t.toDate());
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(works.level + ' ' + _ago(works.createdDate)),
      ),
    ],
  );
}
