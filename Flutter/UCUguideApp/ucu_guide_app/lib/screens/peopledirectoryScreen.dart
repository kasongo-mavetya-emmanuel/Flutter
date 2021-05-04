import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PeopleDirectoryScreen extends StatefulWidget {

  static const String idScreen='PeopleDirectoryScreen';
  @override
  _PeopleDirectoryScreenState createState() => _PeopleDirectoryScreenState();
}

class _PeopleDirectoryScreenState extends State<PeopleDirectoryScreen> {

  final _fireStore=FirebaseFirestore.instance.collection('PeopleDirectories').doc('8I7YjjvvNBo9bYS9KTTg');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              SizedBox(height: 10.0,),
              Text('Bishop Tucker School of Divinity and Theology',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Bishop Tucker School of Divinity and Theology').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                              details.add({
                              'post':post,
                                'name':name,
                                'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Business and Administration',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Business and Administration').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Education and Arts',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Education and Arts').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Journalism, Media and Communication',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Journalism, Media and Communication').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Law',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Law').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Science and Technology',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Science and Technology').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('Faculty of Social Sciences',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('Faculty of Social Sciences').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('School of Research and Postgraduate Studies',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('School of Research and Postgraduate Studies').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
              Text('UCU School of Medicine',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.blueAccent),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream:_fireStore.collection('UCU School of Medicine').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          final detailssnap=snapshot.data.docs.reversed;
                          List details=[];
                          for(var detail in detailssnap){
                            final post=detail.data()['title'];
                            final name=detail.data()['name'];
                            final email=detail.data()['email'];
                            final phonenumber=detail.data()['phonenumber'];


                            details.add({
                              'post':post,
                              'name':name,
                              'email':email,
                              'phonenumber':phonenumber,

                            });
                          }
                          return ListView.builder(
                            padding: EdgeInsets.all(8),
                            itemCount: details.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.0,),
                                    Text(details[index]['post']!=null? details[index]['post'] : 'none',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['name']!=null? details[index]['name'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['email']!=null? details[index]['email'] : 'none',
                                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                                    SizedBox(height: 5.0,),

                                    Text(details[index]['phonenumber']!=null? details[index]['phonenumber'] : 'none',
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
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      )
    );
  }
}
