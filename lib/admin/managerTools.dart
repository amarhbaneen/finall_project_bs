import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yt/login.dart';

class managerTools extends StatefulWidget {
  @override
  _SignOut createState() => _SignOut();
}

class _SignOut extends State<managerTools> {
  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut().then((uid) => {
          Fluttertoast.showToast(msg: "Logout Successes"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              height: 100,
              alignment: Alignment.center,
            child: new Column(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  signOut();
                },
                child: Text("Log out "),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("log out "),
              )
            ]),
          ),
        ));
  }
}
