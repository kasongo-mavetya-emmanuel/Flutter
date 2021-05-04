import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body:SafeArea(

          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 100.0,
                width: 100.0,
//margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//padding: EdgeInsets.all(10.0),
                child: Text('Hello'),
              ),
              Container(
                color: Colors.blue,
                height: 100.0,
                width: 100.0,
//margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//padding: EdgeInsets.all(10.0),
                child: Text('Hello'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.red,
                height: 100.0,
                width: 100.0,
//margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//padding: EdgeInsets.all(10.0),
                child: Text('Hello'),
              ),
            ],
          )
        ),
      ),
    );
  }
}

