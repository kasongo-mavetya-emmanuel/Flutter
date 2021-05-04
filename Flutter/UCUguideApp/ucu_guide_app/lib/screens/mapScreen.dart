import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constant.dart';


class MapScreen extends StatefulWidget {

  static const String idScreen='MapScreen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newgoogleMapController;
  var Locations = [];
  var Filtered=[];
  // var MyLoc;
  // var DestinationLoc;

  //var currentBearing;


  var encodedPoints;
  String distanceText;
  int distanceValue;
  String durationText;
  int durationValue;
  Set<Marker> markersSet = {};

  List<LatLng> pLineCoordinates=[];
  Set<Polyline> polylineSet={};


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

  populateLocations() {
    Locations = [];
    FirebaseFirestore.instance.collection('Markers').get().then((doc) {
      if (doc.docs.isNotEmpty) {
        for (int i = 0; i < doc.docs.length; i++) {
          Locations.add(doc.docs[i].data());
          initMarker(doc.docs[i].data());
        }

        setState(() {
          Filtered = Locations;
          print(Filtered);
          print(Locations);
        });
      }
    });
  }


  Widget clientCard(location) {
    return Padding(
        padding: EdgeInsets.only(left: 2.0, top: 10.0),
        child: InkWell(
            // onDoubleTap: () {
            //   setState(() {
            //     DestinationLoc = location;
            //     //obtainPlaceDirectionDetails();
            //     //currentBearing = 90.0;
            //   });
            //},
            onTap: () {
              // setState(() {
              //   currentLoc = location;
              //   //currentBearing = 90.0;
              // });
              zoomInMarker(location);
            },
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                  height: 100.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  child: Center(child: Text(location['clientName']))),
            )));
  }

  zoomInMarker(location) {
    newgoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
            location['location'].latitude, location['location'].longitude),
        zoom: 19.0,
        bearing: 90.0,
        tilt: 45.0)));
  }


  initMarker(location) {
    Marker LocMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      draggable: false,
      infoWindow: InfoWindow(title: location['clientName'], snippet: ''),
      position: LatLng(
          location['location'].latitude, location['location'].longitude),
      markerId: MarkerId(location['clientName']),
    );

    setState(() {
      markersSet.add(LocMarker);
    });
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0.3566743524844705, 32.74049937199279),
    zoom: 14.4746,
  );
  //GoogleMapController myController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(
                bottom: 200.0, top: 70.0, left: 10.0, right: 10.0),
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            markers: markersSet,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController = controller;

              locatePosition();
            },),

          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8.0),
                  children: Filtered.map<Widget>((element) {
                    return clientCard(element);
                  }).toList(),
                ),
              )),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0)),
                onChanged: (string) {
                  print(Locations.where((u) => u['clientName'].contains(string))
                      .toList());
                  setState(() {
                    Filtered = Locations.where((u) =>
                        u['clientName'].contains(string)).toList();
                  });
                },
              ),
            ),
          )
        ],
      ),

    );
  }

  // void obtainPlaceDirectionDetails() async {
  //   dynamic response = await http.get(Uri.parse(
  //       'https://maps.googleapis.com/maps/api/directions/json?origin=${MyLoc
  //           .latitude}, ${MyLoc.longitude}&destination=${DestinationLoc
  //           .latitude}, ${DestinationLoc.longitude}&key=$mapKey'));
  //   var res = jsonDecode(response.body);
  //
  //   setState(() {
  //     encodedPoints = res['routes'][0]['overview_polyline']['points'];
  //     distanceText = res['routes'][0]['legs'][0]['distance']['text'];
  //     distanceValue = res['routes'][0]['legs'][0]['distance']['value'];
  //     durationText = res['routes'][0]['legs'][0]['duration']['text'];
  //     durationValue = res['routes'][0]['legs'][0]['duration']['value'];
  //   });
  //
  //
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   List<PointLatLng> decodedPolylinePointsResult = polylinePoints
  //       .decodePolyline(encodedPoints);
  //
  //   if (decodedPolylinePointsResult.isNotEmpty) {
  //     decodedPolylinePointsResult.forEach((PointLatLng pointLatLng) {
  //       pLineCoordinates.add(
  //           LatLng(pointLatLng.latitude, pointLatLng.longitude));
  //     });
  //
  //     polylineSet.clear();
  //     setState(() {
  //       Polyline polyline=Polyline(
  //         color:Colors.pink,
  //         polylineId: PolylineId('PolylineID'),
  //         jointType: JointType.round,
  //         points: pLineCoordinates,
  //         width: 5,
  //         startCap: Cap.roundCap,
  //         endCap: Cap.roundCap,
  //         geodesic: true,
  //
  //       );
  //       polylineSet.add(polyline);
  //     });
  //
  //     LatLngBounds latLngBounds;
  //     if(MyLoc.latitude> DestinationLoc.latitude && MyLoc.longitude> DestinationLoc.longitude){
  //
  //       latLngBounds= LatLngBounds(southwest: DestinationLoc, northeast: MyLoc);
  //
  //     }
  //     else  if(MyLoc.longitude> DestinationLoc.longitude){
  //
  //       latLngBounds= LatLngBounds(southwest: LatLng(MyLoc.latitude, DestinationLoc.longitude), northeast: LatLng(DestinationLoc.latitude, MyLoc.longitude));
  //
  //     }
  //
  //     else  if(MyLoc.latitude> DestinationLoc.latitude){
  //
  //       latLngBounds= LatLngBounds(southwest: LatLng(DestinationLoc.latitude, MyLoc.longitude), northeast: LatLng(MyLoc.latitude, DestinationLoc.longitude));
  //
  //     }
  //     else{
  //       latLngBounds= LatLngBounds(southwest: MyLoc, northeast: DestinationLoc);
  //     }
  //
  //     newgoogleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
  //   }
  // }
}