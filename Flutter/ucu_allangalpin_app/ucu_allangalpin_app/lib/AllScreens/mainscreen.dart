import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucu_allangalpin_app/AllScreens/RegisterStudentScreen.dart';
import 'package:ucu_allangalpin_app/AllScreens/viewAllRequest.dart';
import 'package:ucu_allangalpin_app/AllScreens/viewAllStudents.dart';
import 'package:ucu_allangalpin_app/AllWidgets/Divider.dart';

import '../constant.dart';
import 'loginScreen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key key, this.onpressed,this.name, this.phonenumber}): super(key: key);
  final Function onpressed;
  final String name;
  final String phonenumber;
  static const String idScreen='mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // final _fireStore=FirebaseFirestore.instance.collection('AmbulanceRequests').on((doc) => {
  // print("Current data: ", doc.data()['latitude']);
  // });

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final key = GlobalKey<ScaffoldState>();

 Completer<GoogleMapController> _controllerGoogleMap = Completer();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    // setState(() {
    //   MyLoc = latLatPosition;
    // });
    CameraPosition cameraPosition = CameraPosition(
      target: latLatPosition, zoom: 18, tilt: 50,);
    newgoogleMapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition));
  }


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0.3566743524844705, 32.74049937199279),
    zoom: 14.4746,
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseMessaging.configure(
      //called when app is in foreground
      onMessage: (Map<String, dynamic> message) async {
        print('init called onMessage');
        final snackBar = SnackBar(
          content: Text(message['notification']['body']),
          action: SnackBarAction(label: 'GO', onPressed: () {}),
        );
        key.currentState.showSnackBar(snackBar);
      },
      //called when app is completely closed and open from push notification
      onLaunch: (Map<String, dynamic> message) async {
        print('init called onLaunch');
      },
      //called when app is in background  and open from push notification

      onResume: (Map<String, dynamic> message) async {
        print('init called onResume');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Map Urgency'),
        backgroundColor: Colors.blue,
      ),
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              //Drawer Header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ucu.png', height: 65.0,width: 65.0,),
                      SizedBox(width: 40.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Welcome',style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Brand Bold',
                          ),),
                          SizedBox(height: 6.0,),
                          Text('Visit Panel'),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              DividerWidget(),
              SizedBox(
                height: 12.0,
              ),

              //Drawer Body
              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationStudentScreen.idScreen, (route) => false);
                },
                child: ListTile(
                    leading: Icon(Icons.group_add_outlined),
                    title: Text('Create Students Account', style: TextStyle(
                      fontSize: 15.0,
                    ),)
                ),
              ),
              GestureDetector(
                onTap: (){
                    Navigator.pushNamed(context, ViewAllStudents.idScreen);
                },
                child: ListTile(
                    leading: Icon(Icons.list_alt_outlined),
                    title: Text('Views all students', style: TextStyle(
                      fontSize: 15.0,
                    ),)
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ViewAllRequests.idScreen);
                },
                child: ListTile(
                    leading: Icon(Icons.list_alt_outlined),
                    title: Text('Views all Requests', style: TextStyle(
                      fontSize: 15.0,
                    ),)
                ),
              ),
              GestureDetector(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                },
                child: ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: Text('Logout', style: TextStyle(
                    fontSize: 15.0,
                  ),),
                ),
              ),

            ],
          ),
        ),

      ),

      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(
                bottom: 200.0, top: 90.0, left: 10.0, right: 10.0),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: markersSet,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: isClicked==true ? widget.onpressed : (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController = controller;
              locatePosition();


            },
          ),

          Positioned(
            bottom: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Row(
                children: [
                  Text('Name :',style: TextStyle(
                    fontSize: 14.0,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 2.0,),
                  Text(widget.name!=null ? widget.name : 'none', style: TextStyle(color: Colors.grey),),
                  SizedBox(width:10.0,),
                  Text('Phone Number :',style: TextStyle(
                      fontSize: 14.0,fontWeight: FontWeight.bold
                  ),),
                  Text(widget.phonenumber!=null? widget.phonenumber : 'none', style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
