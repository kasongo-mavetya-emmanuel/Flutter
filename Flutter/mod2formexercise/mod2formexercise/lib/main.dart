
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,

        body: SafeArea(


          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/picture.jpg'),
                radius: 40.0,
              ),
              Text('iBrid',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('FLUTTER DESIGNER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(

                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text('+256 784795387',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.teal[900],
                    ) ,
                  ),
                ),
              ),
              Card( //container

                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile( //row
                  leading: Icon( Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text('ibrid@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.teal[900],
                    ),
                  ) ,
                )

              ),

            ],
          ),
        ),
      ),
    );
  }
}

