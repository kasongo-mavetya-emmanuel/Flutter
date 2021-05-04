import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucu_guide_app/screens/alanGalpinScreen.dart';
import 'package:ucu_guide_app/screens/dinnigsScreens.dart';
import 'package:ucu_guide_app/screens/emergencyScreen.dart';
import 'package:ucu_guide_app/screens/eventsScreen.dart';
import 'package:ucu_guide_app/screens/homePage.dart';
import 'package:ucu_guide_app/screens/librariesScreen.dart';
import 'package:ucu_guide_app/screens/mapScreen.dart';
import 'package:ucu_guide_app/screens/newsScreen.dart';
import 'package:ucu_guide_app/screens/peopledirectoryScreen.dart';
import 'package:ucu_guide_app/screens/toursScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.idScreen,
      routes: {
        HomePage.idScreen: (context) => HomePage(),
        EventsScreen.idScreen: (context) => EventsScreen(),
        NewsScreens.idScreen: (context) => NewsScreens(),
        MapScreen.idScreen: (context) => MapScreen(),
        PeopleDirectoryScreen.idScreen: (context) => PeopleDirectoryScreen(),
        LibrariesScreen.idScreen: (context) => LibrariesScreen(),
        DinningScreen.idScreen: (context) => DinningScreen(),
        EmergencyScreen.idScreen: (context) => EmergencyScreen(),
        ToursScreen.idScreen: (context) => ToursScreen(),
        AlanGalpinScreen.idScreen: (context) => AlanGalpinScreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

