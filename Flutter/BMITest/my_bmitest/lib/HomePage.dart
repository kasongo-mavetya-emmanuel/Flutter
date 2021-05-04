
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:my_bmitest/Smart_AC.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment. bottomCenter,
          colors: [
            Colors.pink[100],
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title:  Text('HI,Dimest',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          actions: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.pink[200],
                radius: 15.0,
                child: Icon(Icons.person, color: Colors.black,),
              ),
            ),
          ],
        ) ,
        body: Contenu(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),
            title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.flash_on_outlined,color: Colors.black45,),
                title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined,color: Colors.black45,),
                title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black45,),
                title: Text('')),
          ],
        ),
      ),
    );
  }
}

class Contenu extends StatefulWidget {
  @override
  _ContenuState createState() => _ContenuState();
}

class _ContenuState extends State<Contenu> {
  bool isSwitched1=false;
  bool isSwitched2=false;
  bool isSwitched3=false;
  bool isSwitched4=false;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


        Expanded(
          flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                color: Colors.white70,
              ),
              margin: EdgeInsets.all( 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('A total of 4 devices',style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15.0,
                                ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text('Living Room',style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                                ),
                              ],
                            ),
                            Icon(Icons.more_horiz,
                            color: Colors.black45,
                            ),
                            ],
                        ),
                      )
                  ),
                  Expanded(
                    flex:3,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                          color: isSwitched1==true? Colors.red : Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.wb_incandescent_outlined,size: 40.0,),
                                Column(children: [Text('Smart'),Text('Spotlight')],),
                               FlutterSwitch(
                                 height: 20.0,
                                 width: 40.0,
                                 padding:4.0,
                                 toggleSize: 15.0,
                                 borderRadius: 10.0,
                                 inactiveColor: Colors.black,
                                 value: false,
                                 activeColor: Colors.grey,
                                 onToggle: (value){
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
                                 },

                               ),


                              ],

                            ),
                      ),
                      ),
                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return SmartAC() ;
                              }),
                              );

                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                            color: isSwitched2==true? Colors.deepPurple : Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                        ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.wb_iridescent_outlined,size: 40.0,),
                                  Column(children: [Text('Smart'),Text('AC')],),
                                  FlutterSwitch(
                                    height: 20.0,
                                    width: 40.0,
                                    padding:4.0,
                                    toggleSize: 15.0,
                                    borderRadius: 10.0,
                                    inactiveColor: Colors.black,
                                    value: false,
                                    activeColor: Colors.grey,
                                    onToggle: (value){
                                      if(isSwitched2==false){
                                        setState(() {
                                          isSwitched2=true;
                                        });
                                      }
                                      else{
                                        setState(() {
                                          isSwitched2=false;
                                        });
                                      }
                                    }


                                  )


                                ],

                              ),

                      ),
                          )),
                    ],
                  ),
                  ),
                  Expanded(
                    flex:3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.only(left: 15.0),

                              decoration: BoxDecoration(
                                color: isSwitched3==true? Colors.yellow : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.tv,size: 40.0,),
                                  Column(children: [Text('Smart'),Text('TV')],),
                                  FlutterSwitch(
                                    height: 20.0,
                                    width: 40.0,
                                    padding:4.0,
                                    toggleSize: 15.0,
                                    borderRadius: 10.0,
                                    inactiveColor: Colors.black,
                                    value: false,
                                    activeColor: Colors.grey,
                                    onToggle: (value){
                                     if(isSwitched3==false){
                                       setState(() {
                                         isSwitched3=true;
                                       });
                                     }
                                     else{
                                       setState(() {
                                         isSwitched3=false;
                                       });

                                     }
                                    },

                                  )


                                ],

                              ),
                            )),
                        Expanded(child: Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                            color: isSwitched4==true? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.speaker,size: 40.0,),
                              Column(children: [Text('Smart'),Text('Sound')],),
                              FlutterSwitch(
                                height: 20.0,
                                width: 40.0,
                                padding:4.0,
                                toggleSize: 15.0,
                                borderRadius: 10.0,
                                inactiveColor: Colors.black,
                                value: false,
                                activeColor: Colors.grey,
                                onToggle: (value){
                                 if(isSwitched4==false){
                                   setState(() {
                                     isSwitched4=true;
                                   });
                                 }
                                 else{
                                   setState(() {
                                     isSwitched4=false;
                                   });
                                 }
                                },

                              )

                            ],

                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),


        // Expanded(child: Container(
        //   color: Colors.blue,
        //   child: Row(
        //     children: [
        //       Expanded(child: null),
        //       Expanded(child: null),
        //       Expanded(child: null),
        //       Expanded(child: null),
        //
        //     ],
        //   ),
        // )
        // ),
      ],

    );
  }
}
