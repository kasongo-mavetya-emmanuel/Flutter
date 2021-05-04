import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Users{
  String id;
  String email;
  String name;
  String phone;


  Users( {this.id,this.phone,this.name,this.email});

  Users.fromSnapshot(DataSnapshot dataSnapshot)
  {
    id=dataSnapshot.key;
    email=dataSnapshot.value['email'];
    phone=dataSnapshot.value['phone'];
    name=dataSnapshot.value['name'];
  }
}