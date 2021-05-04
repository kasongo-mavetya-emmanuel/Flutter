import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int n)
  {
    final player= AudioCache();
    player.play('note$n.wav');
  }

  Expanded buildKey({Color color, int n})
  {

    return Expanded(

      child: FlatButton(
        color: color,
           onPressed: () {
          playSound(n);
        },
      ) ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color:Colors.red, n:1),
              buildKey(color:Colors.orange, n:2),
              buildKey(color:Colors.yellow, n:3),
              buildKey(color:Colors.green, n:4),
              buildKey(color:Colors.teal, n:5),
              buildKey(color:Colors.blue, n:6),
              buildKey(color:Colors.purple, n:7),

            ],
          )
        ),
      ),
    );
  }
}


