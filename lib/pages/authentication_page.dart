import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              'TODO App',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint,
        TextEditingController textEditingController, bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: textEditingController,
          obscureText: obscure,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
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
              child:
                  _input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), 'Password', _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(label),
                  onPressed: function,
                ),
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
