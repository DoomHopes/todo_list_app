import 'package:flutter/cupertino.dart';
import 'package:todo_list_app/pages/authorization_page.dart';
import 'package:todo_list_app/pages/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoged = false;

    return isLoged ? HomePage() : AuthorizationPage();
  }
}
