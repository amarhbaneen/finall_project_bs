

import 'package:flutter/material.dart';
import 'body.dart';


class Admin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Manager Page ",
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: admindashboard()
    );
  }
}