import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/services/auth.dart';
import 'package:todo_list_app/services/home_provider.dart';
import 'package:todo_list_app/widgets/gridview_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, providerData, child) => Scaffold(
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
        body: GridViewWidget(works: providerData.works),
      ),
    );
  }
}
