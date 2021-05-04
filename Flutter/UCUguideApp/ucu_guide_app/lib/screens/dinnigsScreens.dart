import 'package:flutter/material.dart';

class DinningScreen extends StatefulWidget {

  static const String idScreen='DinningScreen';
  @override
  _DinningScreenState createState() => _DinningScreenState();
}

class _DinningScreenState extends State<DinningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50.0,),
              Text('Schedule', style: TextStyle(fontSize: 30.0),),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.local_dining_outlined),
                            radius: 20.0,
                          ),
                          title: Text('BreakFast',style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          subtitle: Text('6:45 am - 8:00 am', style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(height: 10.0,),
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.local_dining_outlined),
                            radius: 20.0,
                          ),
                          title: Text('Break Tea',style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          subtitle: Text('10:00 am - 11:00 am', style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(height: 10.0,),
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.local_dining_outlined),
                            radius: 20.0,
                          ),
                          title: Text('Lunch',style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          subtitle: Text('12:45 pm - 2:00 pm', style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(height: 10.0,),
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.local_dining_outlined),
                            radius: 20.0,
                          ),
                          title: Text('Break Tea',style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          subtitle: Text('16:00 pm - 17:00 pm', style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(height: 10.0,),
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.local_dining_outlined),
                            radius: 20.0,
                          ),
                          title: Text('Supper',style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          subtitle: Text('18:45 am - 20:00 am', style: TextStyle(color: Colors.grey),),
                        ),
                      ],

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
