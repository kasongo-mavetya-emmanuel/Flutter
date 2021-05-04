
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final kdecoration=BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 2.0,
      spreadRadius: 0.0,
      offset: Offset(2.0,2.0),
    )
  ],
  color: Colors.blue[300],
);


bool isClicked= false;

Set<Marker> markersSet={};

User firebaseUser;

GoogleMapController newgoogleMapController;

String mapKey='AIzaSyCONI8szrsKy2xpVeWkRCnbwiPgVP9Cd18';