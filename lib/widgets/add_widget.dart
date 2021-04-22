import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(),
      ],
    );
  }
}
