import 'package:driver_app/AllScreeens/carInfoScreen.dart';
import 'package:driver_app/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:provider/provider.dart';
import 'package:driver_app/AllScreeens/loginScreen.dart';
import 'package:driver_app/AllScreeens/mainscreen.dart';
import 'package:driver_app/AllScreeens/registrationScreen.dart';
import 'package:driver_app/DataHandler/appData.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentfirebaseUser=FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

DatabaseReference usersRef=FirebaseDatabase.instance.reference().child('users');
DatabaseReference driversRef=FirebaseDatabase.instance.reference().child('drivers');
DatabaseReference rideRequestRef=FirebaseDatabase.instance.reference().child('drivers').child(currentfirebaseUser.uid).child('newRide');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Taxi Driver App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute:FirebaseAuth.instance.currentUser==null ? MainScreen.idScreen : MainScreen.idScreen,
        routes: {
          RegistrationScreen.idScreen: (context) => RegistrationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
          CarInfoScreen.idScreen: (context) => CarInfoScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }


}
