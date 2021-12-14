import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yt/model/user_model.dart';
import '../login.dart';

class homeScreen extends StatefulWidget {


  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  void initState()
  {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value)
    {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
           alignment: Alignment.center,
          child: Column(

            children: [
              Text("Welcome Back 💼",
              style: TextStyle(fontSize: 40),),
              SizedBox(height: 15,),
              Text("${loggedInUser.firstName} ${loggedInUser.lastName}",
                style: TextStyle(fontSize: 40),),
              ActionChip(label: Text("Logout"), onPressed: ()
                {
                  logout(context);
                })
            ],
          ),
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logout Successes");
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
