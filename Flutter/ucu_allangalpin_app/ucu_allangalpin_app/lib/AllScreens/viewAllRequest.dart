import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ucu_allangalpin_app/AllScreens/mainscreen.dart';

import '../constant.dart';


class ViewAllRequests extends StatefulWidget {

  static const String idScreen='ViewAllRequests';
  @override
  _ViewAllRequestsState createState() => _ViewAllRequestsState();
}

class _ViewAllRequestsState extends State<ViewAllRequests> {

  final _fireStore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream:_fireStore.collection('AmbulanceRequests').orderBy('created_at',descending: true).snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final requests=snapshot.data.docs.reversed;
               List RequestCards=[];
              for(var request in requests){
                final name=request.data()['name'];
                final phonenumber=request.data()['phone'];
                final latitude=double.parse(request.data()['latitude']);
                final longitude=double.parse(request.data()['longitude']);
                final date=request.data()['created_at'];
                final details=request.data()['details'];

                  RequestCards.add({
                    'sender':name,
                    'phonenumber':phonenumber,
                    'latitude':latitude,
                    'longitude':longitude,
                    'date':date,
                    'details':details,
                  });



              }
              return ListView.builder(
              padding: EdgeInsets.all(8),
                 itemCount: RequestCards.length,
                 itemBuilder: (BuildContext context, int index) {
                   return Card(
                     elevation: 4,
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           isClicked= true;
                         });
                         markersSet.clear();
                         Marker LocMarker = Marker(
                           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
                           draggable: false,
                           infoWindow: InfoWindow(title: RequestCards[index]['sender'], snippet: ''),
                           position: LatLng(
                               RequestCards[index]['latitude'], RequestCards[index]['longitude']),
                           markerId: MarkerId(RequestCards[index]['sender']),
                         );

                         setState(() {
                           markersSet.add(LocMarker);
                         });
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) {
                                 return MainScreen(
                                   onpressed: (GoogleMapController controller){
                                     newgoogleMapController=controller;
                                     CameraPosition newcameraPosition = CameraPosition(
                                       target: LatLng(RequestCards[index]['latitude'], RequestCards[index]['longitude']), zoom: 18, tilt: 50,);
                                     newgoogleMapController.animateCamera(
                                         CameraUpdate.newCameraPosition(newcameraPosition));
                                   },
                                   name: RequestCards[index]['sender'],
                                   phonenumber: RequestCards[index]['phonenumber'],
                                 );}
                           ),
                         );
                       },
                       child: Padding(
                         padding: const EdgeInsets.only(left:8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 2.0,),
                             Text(RequestCards[index]['sender']!=null? RequestCards[index]['sender'] : 'none',
                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                             SizedBox(height: 5.0,),
                             Text(RequestCards[index]['phonenumber']!=null? RequestCards[index]['phonenumber'] : 'none',
                                 style: TextStyle(fontSize: 18, color: Colors.grey)),
                             SizedBox(height: 5.0,),
                             Text(RequestCards[index]['details']!=null ? RequestCards[index]['details'] : 'none',
                                 style: TextStyle(fontSize: 18,color: Colors.grey)),
                             SizedBox(height: 5.0,),
                             Text(RequestCards[index]['date']!=null ? RequestCards[index]['date'] : 'none',
                                 style: TextStyle(fontSize: 18,color: Colors.grey)),
                           ],
                         ),
                       ),
                     ),

                   );
                 },
              );

            }),
      ),
    );
  }
}

