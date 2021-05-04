import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ucu_guide_app/constant.dart';
import 'package:ucu_guide_app/screens/alanGalpinScreen.dart';
import 'package:ucu_guide_app/screens/dinnigsScreens.dart';
import 'package:ucu_guide_app/screens/emergencyScreen.dart';
import 'package:ucu_guide_app/screens/eventsScreen.dart';
import 'package:ucu_guide_app/screens/librariesScreen.dart';
import 'package:ucu_guide_app/screens/mapScreen.dart';
import 'package:ucu_guide_app/screens/newsScreen.dart';
import 'package:ucu_guide_app/screens/peopledirectoryScreen.dart';
import 'package:ucu_guide_app/screens/toursScreen.dart';

class HomePage extends StatefulWidget {
  static const String idScreen='HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.0,),
          Expanded(
              flex:2,
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 35.0),
            child: Image(
              image: AssetImage('assets/images/ucu.png'),
            ),
          )),
          Expanded(
            flex: 5,
              child:
          Container(
            color: Colors.blue[700],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, NewsScreens.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            SizedBox(height: 5.0,),
                            Icon(Icons.article_outlined,size: 70.0,),
                            Text('News'),
                          ],
                        ),
                        ),
                    ),
                    ),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, MapScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.map_outlined,size: 70.0,),
                            Text('Map'),
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, EventsScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.event_outlined,size: 70.0,),
                            Text('Events'),
                          ],
                        ),
                      ),
                    ),),
                  ],
                ) ),
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, PeopleDirectoryScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.person_outline_sharp,size: 60.0,),
                            Text('People'),
                            Text('Directory'),
                          ],
                        ),
                      ),
                    ),
                    ),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, LibrariesScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.menu_book_rounded,size: 70.0,),
                            Text('Libraries'),
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, DinningScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.local_dining_outlined,size: 70.0,),
                            Text('Dinnings'),
                          ],
                        ),
                      ),
                    ),),
                  ],
                ) ),
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, EmergencyScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.call,size: 70.0,),
                            Text('Emergency'),
                          ],
                        ),
                      ),
                    ),
                    ),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, ToursScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.tour_outlined,size: 70.0,),
                            Text('Tours'),
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AlanGalpinScreen.idScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: kdecoration,
                        child: Column(
                          children: [
                            Icon(Icons.assistant_sharp,size: 20.0,),
                            Icon(Icons.call,size: 20.0,),
                            Text('AlanGalpin'),
                            Text('Map '),
                            Text('Emergency'),
                          ],
                        ),
                      ),
                    ),),
                  ],
                ) ),
              ],

            ),
          )),
          SizedBox(
            height: 20,
          ),
          Expanded(child: Container(
            child: Column(
              children: [
                Icon(Icons.info_outline, size: 40.0,),
                Text('About Us'),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
