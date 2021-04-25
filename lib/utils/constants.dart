import 'package:flutter/material.dart';

var kListItemForFilter =
    <String>['any level', 'started', 'in the progress', 'completed']
        .map(
          (label) =>
              DropdownMenuItem(child: Text(label.toString()), value: label),
        )
        .toList();

var kListItemForDetail = <String>['started', 'in the progress', 'completed']
    .map(
      (label) => DropdownMenuItem(child: Text(label.toString()), value: label),
    )
    .toList();

TextStyle kTextStyle = TextStyle(
  fontSize: 20,
);

TextStyle kTitleStyle = TextStyle(
  fontSize: 25,
);

TextStyle kDateStyle = TextStyle(
  fontSize: 15,
);
