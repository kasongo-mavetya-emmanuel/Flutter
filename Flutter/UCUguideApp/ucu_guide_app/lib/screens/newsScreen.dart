
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class NewsScreens extends StatefulWidget {
  static const String idScreen = 'NewsScreens';

  @override
  _NewsScreensState createState() => _NewsScreensState();
}

class _NewsScreensState extends State<NewsScreens> {
  // Butter butter = Butter('3944a5f3bc628b00f81b560d921e482a6d088b7f');
  // Map jsonMap;
  //
  // dynamic getJson() async {
  //   await butter.page.list('news').then((response) {
  //     var mJson = response.body;
  //     print(mJson);
  //     setState(() {
  //       // First fetch the json response,then decode into a map
  //       jsonMap = json.decode(mJson);
  //       print(jsonMap);
  //     });
  //   });
  //   return jsonMap;
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getJson();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StandardNewsScreen()),
                );
              },
              child: Container(
                width: 200.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.blue[100],
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0,2.0),
                )
                ],
                ),
                child: Center(
                  child: Text(
                    'Standard Newspaper', textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 18.0,
                  ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 20.0,),

            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UCUNewsScreen()),
                );
              },
              child: Container(
                width: 200.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.blue[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0,2.0),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'UCU News', textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 18.0,
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }






  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: jsonMap == null ? _buildLoadingScreen() : _buildBody(),
  //   );
  // }
  //
  // Widget _buildLoadingScreen() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
  //
  // Widget _buildBody() {
  //   List pages = jsonMap["data"];
  //   return ListView.builder(
  //     itemBuilder: (context, position) {
  //       return Card(
  //         elevation: 4,
  //         child: ListTile(
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => DetailScreen(
  //                         newsTitle: pages[position]['fields']['title'],
  //                         newsDetail: pages[position]['fields']['content'],
  //                       )),
  //             );
  //           },
  //           title: Text( pages[position]['fields']['title'],
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             maxLines: 1,
  //           ),
  //           leading: CircleAvatar(
  //             radius: 25.0,
  //             backgroundImage: NetworkImage( pages[position]['fields']['image']),
  //             backgroundColor: Colors.transparent,
  //           ),
  //           subtitle: Container(
  //             padding: EdgeInsets.all(4),
  //             child: Text(
  //               pages[position]['fields']['content'],
  //               style: TextStyle(fontSize: 15),
  //               maxLines: 2,
  //             ),
  //           ),
  //           trailing: Icon(
  //             Icons.arrow_forward_ios,
  //             color: Colors.grey[600],
  //           ),
  //         ),
  //       );
  //     },
  //     itemCount: pages.length,
  //   );
  // }
}


class StandardNewsScreen extends StatefulWidget {
  @override
  _StandardNewsScreenState createState() => _StandardNewsScreenState();
}

class _StandardNewsScreenState extends State<StandardNewsScreen> {
  List<String> title=[];
  List<String> links=[];

  void _getStandardNews()async{
    http.Response response=await http.Client().get(Uri.parse('https://standard.ucu.ac.ug'));
    print(response.body);
    dom.Document document= parser.parse(response.body);
    print('vvvvvvvvvvvvvvvvvvvvvvvv $document');


    final link2=document.getElementsByClassName('post-title');
    final elements=document.getElementsByClassName('post-details');
    setState((){
      title= link2.map((e) => e.getElementsByTagName('a')[0].innerHtml).toList();
      links= link2.map((e) => e.getElementsByTagName('a')[0].attributes['href']).toList();
      print('vddddddddddddddddddddddddddd $links');
      print('vddddddddddddddddddddddddddd $title');

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStandardNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: title.length==0 ? Center(child: CircularProgressIndicator(backgroundColor:Colors.white,)) :ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index){
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () async{
                          dynamic url=links[index];
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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    title[index],
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

////////NewS sCREEN

class UCUNewsScreen extends StatefulWidget {
  @override
  _UCUNewsScreenState createState() => _UCUNewsScreenState();
}

class _UCUNewsScreenState extends State<UCUNewsScreen> {
  List<String> titleNews=[];
  List<String> linksNews=[];

  void _getNews()async{
    http.Response response=await  http.Client().get(Uri.parse('https://ucu.ac.ug/news-and-updates'));
    print(response.body);
    dom.Document document1= parser.parse(response.body);
    print('vvvvvvvvvvvvvvvvvvvvvvvv $document1');

    final link1=document1.getElementsByClassName('redmore');
    final elements=document1.getElementsByClassName('readmore');
    setState((){
      titleNews= elements.map((e) => e.getElementsByTagName('a')[0].attributes['title']).toSet().toList();
      linksNews= elements.map((e) => e.getElementsByTagName('a')[0].attributes['href']).toSet().toList();
      print('vddddddddddddddddddddddddddd $titleNews');
      print('ffffffffffffffffffffffffffff $linksNews');

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNews();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(

        body: titleNews.length==0 ? Center(child: CircularProgressIndicator(backgroundColor:Colors.white,)) :ListView.builder(
            itemCount: titleNews.length,
            itemBuilder: (context, index){
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () async{
                          dynamic url='https://ucu.ac.ug${linksNews[index]}';
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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    titleNews[index],
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



// FutureBuilder<Map>(
// builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(
// child: Text('Please wait its loading...'),
// );
// } else {
// var data = snapshot.data['data'];
// return ListView.builder(
// itemCount: data.length,
// itemBuilder: (BuildContext context, int index) {
// return Row(
// children: [
// Expanded(
// child: Image.network(data[index]['dish-photo']),
// flex: 2),
// Expanded(
// child: Column(
// children: [
// Text(data[index]['dish-name']),
// Html(data: data[index]['long-description'])
// ],
// ),
// flex: 4)
// ],
// );
// });
// }
// },
// ),
