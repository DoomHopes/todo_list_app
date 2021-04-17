import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/services/auth.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _service = AuthService();
    return Drawer(
      child: Container(
        child: ElevatedButton(
          child: Text('Exit'),
          onPressed: () {
            _service.logOut();
          },
        ),
      ),
    );
  }
}
