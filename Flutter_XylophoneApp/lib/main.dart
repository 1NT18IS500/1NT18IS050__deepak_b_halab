import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black26,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  callKey(1, Colors.white),
                  callKey(2, Colors.black),
                  callKey(3, Colors.white),
                  callKey(4, Colors.black),
                  callKey(5, Colors.white),
                  callKey(6, Colors.black),
                  callKey(7, Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void playMySound(int num) {
  final player = AudioCache();
  player.play('note$num.wav');
}

Expanded callKey(int playNum, Color color) {
  return Expanded(
    child: FlatButton(
      height: 75.0,
      minWidth: double.infinity,
      color: color,
      onPressed: () {
        playMySound(playNum);
      },
    ),
  );
}
