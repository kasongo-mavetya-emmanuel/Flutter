import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {

  static const String idScreen='EmergencyScreen';

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  final _fireStore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50.0,),
              Text('Toll Free Lines', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
              SizedBox(height: 50.0,),
              Card(
                elevation: 2.0,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  child: StreamBuilder<QuerySnapshot>(
                      stream:_fireStore.collection('EmergencyNumbers').snapshots(),
                      builder: (context, snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                          );
                        }
                        final numbers=snapshot.data.docs.reversed;
                        List EmergencyCardsNumbers=[];
                        for(var number in numbers){
                          final name=number.data()['name'];
                          final phonenumber=number.data()['number'];


                          EmergencyCardsNumbers.add({
                            'sender':name,
                            'phonenumber':phonenumber,

                          });
                        }
                        return ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: EmergencyCardsNumbers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.0,),
                                  Text(EmergencyCardsNumbers[index]['sender']!=null? EmergencyCardsNumbers[index]['sender'] : 'none',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.0,),

                                  Text(EmergencyCardsNumbers[index]['phonenumber']!=null? EmergencyCardsNumbers[index]['phonenumber'] : 'none',
                                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                                  SizedBox(height: 5.0,),

                                  Divider(height: 1.0,color: Colors.grey,),

                                ],
                              ),
                            );
                          },
                        );

                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
