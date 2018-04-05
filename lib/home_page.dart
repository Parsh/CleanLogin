import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatelessWidget {
  static String tag = "home-page";

  FirebaseUser user;
  HomePage({@required this.user});

  @override
  Widget build(BuildContext context) {

  final profileImage = new Hero(
    tag: 'theHero',
    child: new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new CircleAvatar(
        radius: 48.0,
        backgroundColor: Colors.transparent,
        child: new Image.network(user.photoUrl),
      ),
    ),
  );

  final welcome = new Padding(
    padding: new EdgeInsets.all(8.0),
    child: new Text(
      "Welcome ${user.displayName}",
      style: new TextStyle(color: Colors.white, fontSize: 28.0),
    ),
  );

  final lorem = new Padding(
    padding: new EdgeInsets.all(8.0),
    child: new Text( user.email,
      //"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat interdum est at imperdiet. Sed volutpat dignissim sollicitudin. Mauris dapibus risus vel urna iaculis dignissim. Phasellus eleifend in nulla ut pretium. Nam turpis dolor, dictum eu blandit ut, sodales sit amet nisi. Pellentesque feugiat mollis imperdiet.",
      style: new TextStyle(color: Colors.white, fontSize: 18.0),
    ),
  );

  final body = new Container(
    width: MediaQuery.of(context).size.width,
    padding: new EdgeInsets.all(28.0),
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
      )
    ),
    child: new Column(
      children: <Widget>[
        profileImage, welcome, lorem
      ],
    ),
  );

    return new Scaffold(
      body: body,
    );
  }
}