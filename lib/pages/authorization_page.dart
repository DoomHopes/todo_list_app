import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/models/user_model.dart';
import 'package:todo_list_app/services/auth.dart';
import 'package:todo_list_app/widgets/input_widget.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool _showLogin = true;

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Container(
              child: Align(
                child: Text(
                  'TODO App',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    }

    Widget _form(String label, Function function) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: input(
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
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: function,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Future<void> _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_password.isEmpty || _email.isEmpty) {
        Fluttertoast.showToast(
          msg: "Enter password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      UserModel user = await _service.signInWithEmailAndPass(
          _email.trim(), _password.trim());

      if (user == null) {
        Fluttertoast.showToast(
            msg: _service.errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Future<void> _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_password.isEmpty || _email.isEmpty) {
        Fluttertoast.showToast(
          msg: "Enter date",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      UserModel user = await _service.registerWithEmailAndPass(
          _email.trim(), _password.trim());

      if (user == null) {
        Fluttertoast.showToast(
            msg: _service.errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _logo(),
          _showLogin
              ? Column(
                  children: <Widget>[
                    _form('Login', _loginButtonAction),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showLogin = false;
                          });
                        },
                        child: Text(
                          'Not register yet? Register!',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  children: <Widget>[
                    _form('Register', _registerButtonAction),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showLogin = true;
                          });
                        },
                        child: Text(
                          'Already registered? Login!',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
