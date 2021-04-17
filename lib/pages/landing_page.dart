import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/user_model.dart';
import 'package:todo_list_app/pages/authorization_page.dart';
import 'package:todo_list_app/pages/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    final bool isLoged = user != null;

    return isLoged ? HomePage() : AuthorizationPage();
  }
}
