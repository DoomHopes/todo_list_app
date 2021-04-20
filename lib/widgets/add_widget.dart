import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/services/home_provider.dart';

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController _title;
  TextEditingController _description;

  String _titleText = '';
  String _descriptionText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _title,
            decoration: const InputDecoration(labelText: 'Title'),
            onChanged: (value) {
              setState(() {
                _titleText = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _description,
            decoration: const InputDecoration(labelText: 'Description'),
            onChanged: (value) {
              setState(() {
                _descriptionText = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (_titleText.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Enter title',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return;
                }
                WorkModel workModel = new WorkModel(
                  name: _titleText,
                  description: _descriptionText,
                  level: 'started',
                );
                Provider.of<HomeProvider>(context, listen: false)
                    .addWork(workModel);
                Fluttertoast.showToast(
                  msg: 'Added',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Text('Apply'),
            ),
          ),
        ),
      ],
    );
  }
}
