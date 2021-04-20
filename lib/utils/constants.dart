import 'package:flutter/material.dart';

var kListItemForFilter =
    <String>['any level', 'started', 'in the progress', 'completed']
        .map(
          (label) =>
              DropdownMenuItem(child: Text(label.toString()), value: label),
        )
        .toList();
