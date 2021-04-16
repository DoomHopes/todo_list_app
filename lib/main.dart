import 'package:flutter/material.dart';

import 'pages/authorization_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData.dark(),
      home: AuthorizationPage(),
    );
  }
}
