import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucu_allangalpin_app/AllScreens/registrationScreen.dart';
import 'package:ucu_allangalpin_app/AllWidgets/progressDialog.dart';

import '../main.dart';
import 'mainscreen.dart';



class LoginScreen extends StatelessWidget {
  static const String idScreen='login';
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
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
                height: 35.0,
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
              Text('Login',
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
                          child: Text('Login',
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
                        if(!emailTextEditingController.text.contains('@'))
                        {
                          displayToatMsg('Email address is not valid', context);
                        }
                        if(passwordTextEditingController.text.isEmpty)
                        {
                          displayToatMsg('password is mandatory', context);
                        }
                        else{
                          loginAndAuthenticateUser(context);
                        }

                      },
                    )
                  ],
                ),
              ),

              FlatButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);

                },
                child: Text(
                  'Do not have an account yet'
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async{

    showDialog(context: context,
        barrierDismissible: false,
        builder: (
        BuildContext context)
            {
             return ProgressDIalog(message: "Authenticating, Please wait...",);
            }
         );
       User firebaseUserAlan= (await _firebaseAuth.signInWithEmailAndPassword
      (email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
        Navigator.pop(context);
      displayToatMsg('Error: '+errMsg.toString(), context);
    })).user;

       print(firebaseUserAlan);

    if(firebaseUserAlan != null)
        {
          FirebaseFirestore.instance
              .collection('AllanGalpinUsers')
              .doc(firebaseUserAlan.uid).get().then((DocumentSnapshot documentSnapshot){
            if(documentSnapshot.exists){
              Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
              displayToatMsg('Congratulation', context);
            }
            else{
              Navigator.pop(context);
              _firebaseAuth.signOut();
              displayToatMsg('User does not exit', context);
            }
          });


    }
    else{
      Navigator.pop(context);
      displayToatMsg('Error, cannot sign in', context);
    }

  }

  void displayToatMsg(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }
}
