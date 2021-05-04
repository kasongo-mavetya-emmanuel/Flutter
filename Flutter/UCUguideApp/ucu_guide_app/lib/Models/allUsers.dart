import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Users{
  String id;
  String email;
  String name;
  String phone;


  Users( {this.id,this.phone,this.name,this.email});

  Users.fromDocument(DocumentSnapshot documentSnapshot)
  {
    id=documentSnapshot.id;
    email=documentSnapshot['email'];
    phone=documentSnapshot['phone'];
    name=documentSnapshot['name'];
  }
}