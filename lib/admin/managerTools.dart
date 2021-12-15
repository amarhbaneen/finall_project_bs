import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yt/admin/registerEmployee.dart';
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    managerTools(),
    RegistrationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(

              child: new Text("Sign out"),
              color: Colors.red,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("Add Employee"),
             
              color: Colors.cyan,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("Update"),
              color: Colors.lightBlue,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(

              child: new Text("Delete"),
              color: Colors.orange,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("Fetch"),
              color: Colors.lime,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
