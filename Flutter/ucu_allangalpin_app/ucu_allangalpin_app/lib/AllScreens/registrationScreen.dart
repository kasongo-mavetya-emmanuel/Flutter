import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucu_allangalpin_app/AllWidgets/progressDialog.dart';

import '../main.dart';
import 'loginScreen.dart';
import 'mainscreen.dart';

class RegistrationScreen extends StatelessWidget {

  static const String idScreen='register';
  TextEditingController nameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController phoneTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

  FirebaseMessaging _messaging=FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage(
                    'assets/images/ucu.png'),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text('Register',
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Brand Bold'
                ),
                textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),

                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),

                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),

                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),

                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text('Create Account',
                              style:TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Brand Bold'
                              )),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      onPressed: (){

                        if(nameTextEditingController.text.length<3)
                          {
                            displayToatMsg('Name must be at least 3 characters', context);

                          }
                        else if(!emailTextEditingController.text.contains('@'))
                          {
                            displayToatMsg('Email address is not valid', context);
                          }
                        else if(phoneTextEditingController.text.isEmpty)
                        {
                          displayToatMsg('phone number is needed', context);
                        }
                        else if(passwordTextEditingController.text.length <6)
                        {
                          displayToatMsg('password must be at least 6 characters', context);
                        }
                        else{
                          registerNewUser(context);
                        }

                      },
                    )
                  ],
                ),
              ),

              FlatButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);

                },
                child: Text(
                    'Already have an account'
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async{

    showDialog(context: context,
        barrierDismissible: false,
        builder: (
            BuildContext context)
        {
          return ProgressDIalog(message: "Registering, Please wait...",);
        }
    )            ;
    final User firebaseUser= (await _firebaseAuth.createUserWithEmailAndPassword
      (email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
      Navigator.pop(context);
        displayToatMsg('Error: '+errMsg.toString(), context);
    })).user;

    if(firebaseUser != null)//user created
    {
      //save user in the database
      Map<String, dynamic> userDataMap={
        'name': nameTextEditingController.text.trim(),
        'email': emailTextEditingController.text.trim(),
        'phone': phoneTextEditingController.text,
      };

      FirebaseFirestore.instance
          .collection('AllanGalpinUsers')
          .doc(firebaseUser.uid).set(userDataMap);


      _messaging.getToken().then((value){
        print(value);
        FirebaseFirestore.instance.collection('tokens').get().then((QuerySnapshot snapshot){
          snapshot.docs.forEach((element) {
            if(element.data()['token']== value){
              displayToatMsg('Device already has an Account', context);
            }
            else{
              FirebaseFirestore.instance.collection('tokens').add({'token': value});
            }
          });
        });
      });
      displayToatMsg('Congratulation', context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }
    else{
      Navigator.pop(context);
      displayToatMsg('new user has not been created', context);
    }

  }

  void displayToatMsg(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }

}
