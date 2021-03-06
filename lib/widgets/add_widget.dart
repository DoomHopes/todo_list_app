import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/work_model.dart';
import 'package:todo_list_app/services/home_provider.dart';

import 'package:intl/intl.dart';

import 'input_widget.dart';

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController _titleController = TextEditingController();
  String _title = '';

  TextEditingController _descController = TextEditingController();
  String _description = '';

  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2022),
    ).then((picked) {
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: input(
                  Icon(Icons.access_alarm), 'Title', _titleController, false),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: input(Icon(Icons.access_alarm), 'Description',
                  _descController, false),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat.yMMMd().format(_selectedDate)),
                  ElevatedButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _title = _titleController.text;
                    _description = _descController.text;

                    if (_title.isEmpty || _description.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Fields are empty",
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
                      id: _title + _description,
                      name: _title,
                      description: _description,
                      level: 'started',
                      createdDate: Timestamp.now(),
                      dateOfCompletion: Timestamp.fromDate(_selectedDate),
                    );
                    Provider.of<HomeProvider>(context, listen: false)
                        .addworkToFirebase(workModel);
                    Fluttertoast.showToast(
                      msg: "Added",
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
        ),
      ),
    );
  }
}
