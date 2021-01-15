import 'package:flutter/material.dart';

import 'package:project1/pAGE/homepage.dart';
import 'package:project1/second.dart';
import 'package:project1/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        Home.routeName: (context) => Home()
      },
    );
  }
}