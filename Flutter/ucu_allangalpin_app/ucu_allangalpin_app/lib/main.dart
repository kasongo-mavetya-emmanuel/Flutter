import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucu_allangalpin_app/AllScreens/viewAllRequest.dart';
import 'package:ucu_allangalpin_app/AllScreens/viewAllStudents.dart';

import 'AllScreens/RegisterStudentScreen.dart';
import 'AllScreens/loginScreen.dart';
import 'AllScreens/mainscreen.dart';
import 'AllScreens/registrationScreen.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: LoginScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
        RegistrationStudentScreen.idScreen: (context) => RegistrationStudentScreen(),
        ViewAllStudents.idScreen: (context) => ViewAllStudents(),
        ViewAllRequests.idScreen: (context) => ViewAllRequests(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

