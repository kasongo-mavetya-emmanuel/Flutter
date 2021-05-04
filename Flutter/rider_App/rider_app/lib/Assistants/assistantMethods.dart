
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/Assistants/requestAssistant.dart';
import 'package:rider_app/DataHandler/appData.dart';
import 'package:rider_app/Models/address.dart';
import 'package:rider_app/Models/allUsers.dart';
import 'package:rider_app/Models/directionDetails.dart';
import 'package:rider_app/configMaps.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;


class AssistantMethods{

  static Future searchCoordinateAddress(Position position, context) async{

    // ignore: non_constant_identifier_names
    dynamic PlaceAddress;
    //String st1,st2,st3,st4;
     dynamic url=Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey');
    dynamic response=await RequestAssistant.getRequest(url);





    if(response!='failed'){
      //PlaceAddress=response['results'][0]['geometry']['location']['lat'].toString();
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${position.latitude}, ${position.longitude}');
      PlaceAddress=response['results'][0]['formatted_address'];
      // st1=response['results'][0]['address_components'][3]['long_name'];
      // st2=response['results'][0]['address_components'][4]['long_name'];
      // st3=response['results'][0]['address_components'][5]['long_name'];
      // st4=response['results'][0]['address_components'][6]['long_name'];
      // PlaceAddress= st1+', '+st2+', '+st3+', '+st4;
      Address UserPickUpAddress= Address(PlaceAddress,position.longitude,position.latitude, response['results'][0]['place_id']);
      UserPickUpAddress.longitude=position.longitude;
      UserPickUpAddress.latitude=position.latitude;
      UserPickUpAddress.placeName=PlaceAddress;

      Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(UserPickUpAddress);
    }

    return PlaceAddress;
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(LatLng initialPosition, LatLng finalPosition) async{

    dynamic directionUrl=Uri.parse('https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude}, ${initialPosition.longitude}&destination=${finalPosition.latitude}, ${finalPosition.longitude}&key=$mapKey');
    var res= await RequestAssistant.getRequest(directionUrl);

    if(res=='failed'){
      return null;
    }
    DirectionDetails directionDetails= DirectionDetails(res['routes'][0]['legs'][0]['distance']['value'], res['routes'][0]['legs'][0]['duration']['value'], res['routes'][0]['legs'][0]['distance']['text'], res['routes'][0]['legs'][0]['duration']['text'], res['routes'][0]['overview_polyline']['points']);

    directionDetails.encodedPoints=res['routes'][0]['overview_polyline']['points'];
    directionDetails.distanceText=res['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue=res['routes'][0]['legs'][0]['distance']['value'];
    directionDetails.durationText=res['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue=res['routes'][0]['legs'][0]['duration']['value'];

    return directionDetails;
  }

  static int calculateFares(DirectionDetails directionDetails){
    // in terms of Usd
    double timeTravelFare= (directionDetails.durationValue / 60)* 0.20;

    double distanceTravelFare= (directionDetails.distanceValue / 1000)* 0.20;

    double totalFareAmount=timeTravelFare+distanceTravelFare;
    //local currency
    //1$ =3600 ugx

    //double totalLocalAmount= totalFareAmount*3600;

    return totalFareAmount.truncate();
  }

  static void getCurrentOnlineUserInfo() async{

    firebaseUser = await FirebaseAuth.instance.currentUser;
    String userId=firebaseUser.uid;
    DatabaseReference reference=FirebaseDatabase.instance.reference().child('users').child(userId);

    reference.once().then((DataSnapshot dataSnapshot){
      if(dataSnapshot.value !=null){
        userCurrentInfo=Users.fromSnapshot(dataSnapshot);
      }
    });

  }
}