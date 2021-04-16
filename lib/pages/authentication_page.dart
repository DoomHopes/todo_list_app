import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              'TODO App',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      );
    }

    Widget _form(String label, Function function) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Text('Email'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('Password'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                child: Text(label),
                onPressed: function,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _logo(),
          _form('Authorization', () {}),
        ],
      ),
    );
  }
}
