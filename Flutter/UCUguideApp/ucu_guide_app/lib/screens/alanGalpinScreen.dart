import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ucu_guide_app/AllWidgets/progressDialog.dart';
import 'package:ucu_guide_app/Models/allUsers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../main.dart';

class AlanGalpinScreen extends StatelessWidget {


  static const String idScreen='AlanGalpinScreen';

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
                      color: Colors.blue,
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

              Text(
                  'Do not have an account yet go Alan Galpin to get an account'
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
    final User firebaseUser= (await _firebaseAuth.signInWithEmailAndPassword
      (email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
      Navigator.pop(context);
      displayToatMsg('Error: '+errMsg.toString(), context);

    })).user;

    if(firebaseUser != null)
    {
      FirebaseFirestore.instance
          .collection('ucustudents')
          .doc(firebaseUser.uid)
          .get().
        then((DocumentSnapshot documentSnapshot){
        if(documentSnapshot.exists){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlanGalpinLadingPage()
                ),
          );
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





//lading Page
class AlanGalpinLadingPage extends StatefulWidget {

  //static const String idScreen='AlanGalpinLadingPage';

  @override
  _AlanGalpinLadingPageState createState() => _AlanGalpinLadingPageState();
}

class _AlanGalpinLadingPageState extends State<AlanGalpinLadingPage> {

  bool isrequest=false;

  String accident='';
  String bodypain='';
  String poisoned='';
  String vomit='';
  String sick='';
  bool accidentcheck=false;
  bool bodypainckeck=false;
  bool poisonedckeck=false;
  bool vomitckeck=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.0,
          ),
          Image(
            image: AssetImage(
                'assets/images/ucu.png'),
            width: 390.0,
            height: 200.0,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 5.0,
          ),
       Column(
        children: <Widget>[
          CheckboxListTile(
            title: const Text('Accident'),
            subtitle: Text('any kind of accidents'),
            value: accidentcheck,
            onChanged: (bool value) {
              setState(() {
                accidentcheck=value;
                accidentcheck==true ? accident='accident' : accident='';
                sick= accident +', '+bodypain +', ' +poisoned +', '+vomit;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Body Pain'),
            subtitle: Text('any party of the body'),
            value: bodypainckeck,
            onChanged: (bool value) {
              setState(() {
                bodypainckeck=value;
                bodypainckeck==true? bodypain='body pain' :bodypain='';
                sick= accident +', '+bodypain +', '+poisoned +', '+vomit;
              });
            },
          ),

          CheckboxListTile(
            title: const Text('Poisoned'),
            subtitle: Text('any kind of intoxication'),
            value: poisonedckeck,
            onChanged: (bool value) {
              setState(() {
                poisonedckeck=value;
                poisonedckeck==true? poisoned='poisoned' : poisoned='';
                sick= accident +', '+bodypain +', '+poisoned +', '+vomit;
              });
            },
          ),

          CheckboxListTile(
            title: const Text('Vomitting'),
            subtitle: Text('ckeck if concerned'),
            value: vomitckeck,
            onChanged: (bool value) {
              setState(() {
                vomitckeck=value;
                vomitckeck==true? vomit='vomit' :vomit='';
                sick= accident +', '+bodypain +', '+poisoned +', '+' '+vomit;
              });
            },
          ),

        ],
      ),
        isrequest==true ? ProgressDIalog(message: "Requesting, Please wait...",) : accidentcheck==true|| bodypainckeck==true||
            poisonedckeck==true|| vomitckeck==true ? Visibility(
          child: GestureDetector(

             onDoubleTap: (){
               obtainUserInfo();
               _makingPhoneCall();
             },
             child: Container(
               padding: EdgeInsets.all(5.0),
               width: 120.0,
               height: 120.0,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(40.0),
                 color: Colors.red,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black,
                     blurRadius: 2.0,
                     spreadRadius: 0.0,
                     offset: Offset(2.0,2.0),
                   )
                 ],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Icon(Icons.details,size: 40,),
                   SizedBox(height:10.0),
                   Text('Pres to make the request',
                   textAlign: TextAlign.center,),
                 ],
               ),
             ),
           ),
        ): Text('check atleast one checkbox'),
        ],
      ),
    );
  }
  var AlanGalpinRequestRef;

  void obtainUserInfo() async{
    setState(() {
      isrequest=true;
    });
         // return ProgressDIalog(message: "Requesting, Please wait...",);

    firebaseUser = FirebaseAuth.instance.currentUser;
    String userId=firebaseUser.uid;

      AlanGalpinRequestRef= FirebaseFirestore.instance.collection('AmbulanceRequests');

    Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    FirebaseFirestore.instance
        .collection('ucustudents')
        .doc(userId)
        .get().
        then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        userCurrentInfo=Users.fromDocument(documentSnapshot);

        Map<String,dynamic> RequestinfoMap=
        {
          'latitude':position.latitude.toString(),
          'longitude':position.longitude.toString(),
          'created_at': DateTime.now().toString(),
          'name': userCurrentInfo.name,
          'phone':userCurrentInfo.phone,
          'details':sick,
        };

        AlanGalpinRequestRef.add(RequestinfoMap);
        print(AlanGalpinRequestRef);
        displayToatMsg('Request Sent, please wait for a call or the ambulance', context);
        setState(() {
          isrequest=false;
        });
      }
    });
  }

  void cancelRideRequest(){
    //AlanGalpinRequestRef.remove();
  }

  void displayToatMsg(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }

  _makingPhoneCall() async {
    const url = 'tel:0784795387';

    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not launch $url';
    }
  }


}
