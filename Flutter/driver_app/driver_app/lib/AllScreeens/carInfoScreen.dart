import 'package:driver_app/configMaps.dart';
import 'package:driver_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'mainscreen.dart';


class CarInfoScreen extends StatefulWidget {
  static const String idScreen='carInfoScreen';
  @override
  _CarInfoScreenState createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModeltextEditingController= TextEditingController();
  TextEditingController carNumbertextEditingController= TextEditingController();
  TextEditingController carColortextEditingController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.0,),
              Image.asset('images/images/logo.png', width: 390.0,height: 250.0,),
              Padding(padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    Text('Enter Car Details', style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 24.0),),
                    SizedBox(height: 26.0,),
                    TextField(
                      controller: carModeltextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Car Model',
                        hintStyle: TextStyle(color:Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),

                    TextField(
                      controller: carNumbertextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Car Number',
                        hintStyle: TextStyle(color:Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 10.0,),

                    TextField(
                      controller: carColortextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Car Color',
                        hintStyle: TextStyle(color:Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15.0),
                    ),

                    SizedBox(height: 42.0,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: (){
                         if(carModeltextEditingController.text.isEmpty){
                           displayToastMsg('Please Enter Car Model', context);
                         }
                         else if(carNumbertextEditingController.text.isEmpty){
                           displayToastMsg('Please Enter Car Number', context);
                         }
                         else if(carColortextEditingController.text.isEmpty){
                           displayToastMsg('Please Enter Car Color', context);
                         }
                         else{
                           saveDriverCarInfo(context);
                         }
                        },
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Next', style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),

                              Icon(Icons.arrow_forward, color: Colors.white,size: 26.0,),
                            ],
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void saveDriverCarInfo(context){

    String userId=currentfirebaseUser.uid;
    Map carInfoMap={
      'car_color': carColortextEditingController.text,
      'car_number': carNumbertextEditingController.text,
      'car_Model': carModeltextEditingController.text,
    };

    driversRef.child(userId).child('car_details').set(carInfoMap);

    Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  }

  }
void displayToastMsg(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}
