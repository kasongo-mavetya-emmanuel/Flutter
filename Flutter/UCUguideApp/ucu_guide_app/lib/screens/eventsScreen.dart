import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class EventsScreen extends StatefulWidget {
  static const String idScreen='EventsScreen';
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<String> date=[];
  List<String> month=[];
  List<String> content=[];
  List<String> links=[];



  void _getEvents()async{
    http.Response response=await  http.Client().get(Uri.parse('https://ucu.ac.ug/index.php/admissions/important-dates'));
    print(response.body);
    dom.Document document1= parser.parse(response.body);
    print('vvvvvvvvvvvvvvvvvvvvvvvv $document1');

    final date1=document1.getElementsByClassName('dp-flatcalendar');
    final content1=document1.getElementsByClassName('mod-dpcalendar-upcoming-default__information"');
    setState((){
      date= date1.map((e) => e.getElementsByClassName('dp-flatcalendar__day')[0].innerHtml).toList();
      month= date1.map((e) => e.getElementsByClassName('dp-flatcalendar__month')[0].innerHtml).toList();
      content= content1.map((e) => e.getElementsByClassName('dp-event-url dp-link')[0].innerHtml).toList();
      links= content1.map((e) => e.getElementsByTagName('a')[0].attributes['href']).toList();
      print('vddddddddddddddddddddddddddd $date');
      print('ffffffffffffffffffffffffffff $month');
      print('ffffffffffffffffffffffffffff $content');
      print('ffffffffffffffffffffffffffff $links');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getEvents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: date.length==0 ? Center(child: CircularProgressIndicator(backgroundColor:Colors.white,)) :ListView.builder(
            itemCount: date.length,
            itemBuilder: (context, index){
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () async{
                          dynamic url='https://ucu.ac.ug${links[index]}';
                          if( await canLaunch(url)){
                            launch(url);
                          }
                          else{
                            print('error');
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5,),
                          child: Card(
                            color: Colors.white70,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      date[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                        fontSize: 50.0,
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Text(
                                      month[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    content[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.0,),

                                Text(
                                  'Read More',
                                  style: TextStyle(
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }
        ));
  }
}
