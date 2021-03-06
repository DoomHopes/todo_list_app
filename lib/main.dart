import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/user_model.dart';
import 'package:todo_list_app/services/auth.dart';
import 'package:todo_list_app/services/home_provider.dart';

import 'pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
            create: (_) => HomeProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'ToDo',
          theme: ThemeData.dark(),
          home: LandingPage(),
        ),
      ),
    );
  }
}
