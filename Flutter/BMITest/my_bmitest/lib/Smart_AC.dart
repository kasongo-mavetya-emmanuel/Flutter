import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';


class SmartAC extends StatefulWidget {
  @override
  _SmartACState createState() => _SmartACState();
}

class _SmartACState extends State<SmartAC> {
  bool isSwitched1=false;
  int temperature=24;
  Color speed1 = Colors.blue.withOpacity(0.3);
  Color speed2=Colors.blue.withOpacity(0.3);
  Color speed3=Colors.blue.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {


    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment. bottomCenter,
          colors: [
            Colors.blue[100],
            Colors.blue[900],
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Smart AC',style: TextStyle(
            color: Colors.black,
          ),),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Icon(Icons.access_time),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Icon(Icons.ac_unit),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Icon(Icons.wb_sunny_outlined),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Icon(Icons.whatshot_outlined),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 3,
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  margin:EdgeInsets.all(10.0),
              child:SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                    trackColor: Colors.grey[200],
                    //trackGradientStartAngle: 180,
                    //trackGradientEndAngle: 360,
                    progressBarColors: [Colors.yellow,Colors.red, Colors.blue],
                    //dynamicGradient: false,
                    dotColor: Colors.black,
                    //hideShadow: false,
                    //shadowColor: Colors.blue[100],
                   // shadowMaxOpacity: 25,
                    //shadowStep: 20.0,
                    //gradientStartAngle: 180,
                    //gradientEndAngle: 360,

                  ),
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 20,
                    trackWidth: 20,
                    //shadowWidth: 30,
                    handlerSize: 10,
                  ),
                  angleRange: 180,
                  startAngle: 180,
                  counterClockwise: false,
                 // animationEnabled: true,
                  //infoProperties: InfoProperties(topLabelText: 'Running', bottomLabelText: 'runnig'),
                ),
                min: 16,
                max: 30,
                // innerWidget: (double value){
                //     Widget container=Container(
                //      width: 100.0,
                //      height: 50.0,
                //     decoration: BoxDecoration(
                //       //borderRadius: BorderRadius.circular(200.0),
                //       color: Colors.red,
                //     ),
                //   );
                //   return container;
                // },
                initialValue: temperature.toDouble(),
                onChange: (double value){
                  print(value);
                },
              ),
            ),
            ),
            Expanded(

                child: Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(

                        child: Container(
                    //padding:EdgeInsets.only(left: 5.0),
                    margin: EdgeInsets.all( 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin:EdgeInsets.only(left: 10.0),
                            child: Text('Speed')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              elevation: 0.0,
                              mini:true,
                              child: Text('1'),
                              backgroundColor: speed1,
                              heroTag: null,
                              onPressed: (){
                                setState(() {
                                  speed1=Colors.white.withOpacity(0.3);
                                   speed2=Colors.blue.withOpacity(0.3);
                                   speed3=Colors.blue.withOpacity(0.3);
                                });

                              },
                            ),
                            FloatingActionButton(
                              elevation: 0.0,
                              mini: true,
                              child: Text('2'),
                              backgroundColor: speed2,
                              heroTag: null,
                              onPressed: (){
                                setState(() {
                                  speed1=Colors.blue.withOpacity(0.3);
                                  speed2=Colors.white.withOpacity(0.3);
                                  speed3=Colors.blue.withOpacity(0.3);
                                });


                              },
                            ),
                            FloatingActionButton(
                              elevation: 0.0,
                              mini: true,
                              child: Text('3'),
                              backgroundColor: speed3,
                              heroTag: null,
                              onPressed: (){
                                setState(() {
                                  speed1=Colors.blue.withOpacity(0.3);
                                  speed2=Colors.blue.withOpacity(0.3);
                                  speed3=Colors.white.withOpacity(0.3);
                                });

                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.2),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                            child: Text('Power')),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text('OFF',
                              style: TextStyle(
                                color:isSwitched1==false ? Colors.white : Colors.black,
                              ),),
                              Text('/'),
                              Text('ON',style: TextStyle(
                                color: isSwitched1==true ? Colors.white : Colors.black,
                              ),),
                            ],),
                            FlutterSwitch(
                              height: 20.0,
                              width: 40.0,
                              padding:4.0,
                              toggleSize: 15.0,
                              borderRadius: 10.0,
                              inactiveColor: Colors.black,
                              value: false,
                              activeColor: Colors.grey,
                              onToggle:(value){
                                if(isSwitched1==false){
                                  setState(() {
                                    isSwitched1=true;
                                  });
                                }
                                else{
                                  setState(() {
                                    isSwitched1=false;
                                  });
                                }

                              }
                            ),

                          ],
                        )

                      ],
                    ),

                  )),
                ],
              ),
            )),
            Expanded(child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Temp'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('16C'),
                      Slider(
                        value: temperature.toDouble(),
                        inactiveColor: Colors.grey,
                        activeColor: Colors.white,
                        min: 16.0,
                        max: 30,
                        onChanged: (double newvalue){
                          setState(() {
                            temperature=newvalue.round();
                          });
                        },
                      ),
                      Text('30C'),
                    ],
                  ),
                ],),
            )),

          ],
        ),
      ),

    );
  }
}
