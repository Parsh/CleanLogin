import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = "home-page";

  @override
  Widget build(BuildContext context) {

  final profileImage = new Hero(
    tag: 'theHero',
    child: new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new CircleAvatar(
        radius: 72.0,
        backgroundColor: Colors.transparent,
        backgroundImage: new AssetImage("assets/alucard.jpg"),
      ),
    ),
  );

  final welcome = new Padding(
    padding: new EdgeInsets.all(8.0),
    child: new Text(
      "Welcome Parsh",
      style: new TextStyle(color: Colors.white, fontSize: 28.0),
    ),
  );

  final lorem = new Padding(
    padding: new EdgeInsets.all(8.0),
    child: new Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat interdum est at imperdiet. Sed volutpat dignissim sollicitudin. Mauris dapibus risus vel urna iaculis dignissim. Phasellus eleifend in nulla ut pretium. Nam turpis dolor, dictum eu blandit ut, sodales sit amet nisi. Pellentesque feugiat mollis imperdiet.",
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