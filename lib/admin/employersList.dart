import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt/admin/registerEmployee.dart';

import '../database.dart';
import 'editEmployee.dart';
class employeeList extends StatefulWidget {
  const employeeList({Key key}) : super(key: key);

  @override
  _employeeListState createState() => _employeeListState();
}

class _employeeListState extends State<employeeList> {
  Database db;

  List docs = [];

  initialise()
  {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
      setState((){
        docs = value;
      })
    });
  }
  void initState()
  {
    super.initState();
    initialise();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder( itemCount: docs.length,
          itemBuilder: (BuildContext context,int index)
      {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          (editEmployee(employee: docs[index], db: db))))
                  .then((value) => {
                if (value != null) {initialise()}
              });
            },
            contentPadding: EdgeInsets.only(right: 30,left: 36),
            title: Text(docs[index]['firstname']),
            trailing: Text(docs[index]['lastname']),
          ),
        );

      })
       ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RegistrationScreen()));

          }
        ,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
