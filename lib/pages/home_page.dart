import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/services/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            child: ElevatedButton(
              child: Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                _service.logOut();
              },
            ),
          ),
        ],
      ),
      body: Center(child: Text('Bite my shiny metal ass')),
    );
  }
}
