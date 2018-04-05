import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (BuildContext context) => new LoginPage(),
    HomePage.tag: (BuildContext context) => new HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Clean Login",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: new LoginPage(),
    );
  }
}