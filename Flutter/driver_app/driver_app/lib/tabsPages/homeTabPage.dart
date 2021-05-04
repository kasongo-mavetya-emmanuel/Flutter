import 'dart:async';

import 'package:driver_app/Assistants/assistantMethods.dart';
import 'package:driver_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../configMaps.dart';

class HomeTabPage extends StatelessWidget {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newgoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Position currentPosition;
  var geolocator=Geolocator();

  void locatePosition() async{
    Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition=position;

    LatLng latLatPosition=LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition=CameraPosition(target: latLatPosition, zoom: 14);
    newgoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    //dynamic address= await AssistantMethods.searchCoordinateAddress(position, context);
    //print('my address is $address');
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(

          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller){
            _controllerGoogleMap.complete(controller);
            newgoogleMapController=controller;
            locatePosition();

          },),

        //Online and Offline Container
        Container(
          height: 140,
          width: double.infinity,
          color: Colors.black54,
        ),

        Positioned(
          top: 60.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0),
               child: RaisedButton(
                 onPressed: (){
                  makeDriverOnline();
                  getLocationLiveUpdates();
                 },
                 color: Colors.green,
                 child: Padding(
                   padding: EdgeInsets.all(17.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Offline Now -Go Online', style: TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),),

                       Icon(Icons.phone_android, color: Colors.white,size: 26.0,),
                     ],
                   ),
                 ),
               ),
             ),
           ],
          ),
        ),
      ],
    );
  }
  void makeDriverOnline() async{
    Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition=position;
    Geofire.initialize('availablesDrivers');
    Geofire.setLocation(currentfirebaseUser.uid, currentPosition.latitude, currentPosition.longitude);

    rideRequestRef.onValue.listen((event) {

    });
  }

  void getLocationLiveUpdates(){

    homeTabPageStreamSubcription= Geolocator.getPositionStream().listen((Position position) {
      currentPosition=position;
      Geofire.setLocation(currentfirebaseUser.uid, position.latitude, position.longitude);
      LatLng latLng=LatLng(position.latitude, position.longitude);
      newgoogleMapController.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }
}