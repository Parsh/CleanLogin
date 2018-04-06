import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  final FirebaseUser user;
  HomePage({@required this.user});
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> myText;
  StreamSubscription<DocumentSnapshot> streamSubscription;
  final DocumentReference documentReference = Firestore.instance.document(
      "myData/dummy1"); //Firestore.instance.collection("myData").document("dummy1");

  void create() {
    Map<String, dynamic> data = <String, dynamic>{
      "name": "Parshva Jain",
      "passion": "Cosmology",
    };

    documentReference.setData(data).whenComplete(() {
      print("Added Data");
    }).catchError((e) {
      print("An Error occured while adding: $e");
    });
  }

  void read() {
    // documentReference.get().then((documentSnapshot){
    //   if(documentSnapshot.exists){
    //     setState((){
    //        myText = documentSnapshot.data;
    //     });
    //   } else {
    //     setState((){
    //       myText = null;
    //     });
    //   }
    // }).catchError((e){
    //   print("An Error occured while fetcing: $e");
    // });
  }

  void update() {
    Map<String, dynamic> data = <String, dynamic>{
      "name": "Parshva Jain Updated",
      "passion": "Cosmology Updated",
    };

    documentReference.updateData(data).whenComplete(() {
      print("Updated Data");
    }).catchError((e) {
      print("An Error occured while updating: $e");
    });
  }

  void delete() {
    documentReference.delete().whenComplete((){
      print("Deleted");
    }).catchError((e) {
      print("An Error occured while updating: $e");
    });
  }

  @override
    void initState() {
      super.initState();
      //creating a stream for fetching/reading real time changes in the data (alternative to hardcalls that we make via read method to fetchd data)
      streamSubscription = documentReference.snapshots.listen((documentSnapshot){
      if(documentSnapshot.exists){
        setState((){
           myText = documentSnapshot.data;
        });
      } else {
        setState((){
          myText = null;
        });
      }
    });
    }

    @override
      void dispose() {
        streamSubscription.cancel();
        super.dispose();
      }

  @override
  Widget build(BuildContext context) {
    final profileImage = new Hero(
      tag: 'theHero',
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new CircleAvatar(
          radius: 48.0,
          backgroundColor: Colors.transparent,
          child: new Image.network(widget.user.photoUrl),
        ),
      ),
    );

    final welcome = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        "Welcome ${widget.user.displayName}",
        style: new TextStyle(color: Colors.white, fontSize: 28.0),
      ),
    );

    final lorem = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        widget.user.email,
        //"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat interdum est at imperdiet. Sed volutpat dignissim sollicitudin. Mauris dapibus risus vel urna iaculis dignissim. Phasellus eleifend in nulla ut pretium. Nam turpis dolor, dictum eu blandit ut, sodales sit amet nisi. Pellentesque feugiat mollis imperdiet.",
        style: new TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );

    final crud = new Container(
      padding: new EdgeInsets.only(top: 40.0),
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: create,
            color: Colors.black,
            child: new Text(
              "Create",
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          new SizedBox(height: 15.0),
          new RaisedButton(
            onPressed: read,
            color: Colors.green,
            child: new Text(
              "Read",
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          new SizedBox(height: 15.0),
          new RaisedButton(
            onPressed: update,
            color: Colors.pink,
            child: new Text(
              "Update",
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          new SizedBox(height: 15.0),
          new RaisedButton(
            onPressed: delete,
            color: Colors.deepOrange,
            child: new Text(
              "Delete",
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          new SizedBox(height: 15.0),
          myText == null? new Container(): new Container(child: new Text(myText['passion'], style: new TextStyle(fontSize: 20.0, color: Colors.white),),)
        ],
      ),
    );

    final body = new Container(
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(28.0),
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [Colors.blue, Colors.lightBlueAccent],
      )),
      child: new Column(
        children: <Widget>[profileImage, welcome, lorem, crud],
      ),
    );

    return new Scaffold(
      body: body,
    );
  }
}
