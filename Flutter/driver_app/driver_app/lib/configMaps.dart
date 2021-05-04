import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import 'Models/allUsers.dart';

String mapKey='AIzaSyCONI8szrsKy2xpVeWkRCnbwiPgVP9Cd18';

User firebaseUser;
User currentfirebaseUser;

Users userCurrentInfo;

StreamSubscription<Position> homeTabPageStreamSubcription;

