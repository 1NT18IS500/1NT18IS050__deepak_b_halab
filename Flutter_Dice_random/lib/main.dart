import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left_image_no = 2;
  int right_image_no = 1;

  void updateDices() {
    left_image_no = Random().nextInt(6) + 1;
    right_image_no = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          //bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.red,
            Colors.green,
            Colors.redAccent,
            Colors.green,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80.0),
                bottomRight: Radius.circular(50.0),
                topLeft: Radius.circular(20.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightGreen.shade500,
                  Colors.redAccent,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 20.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          updateDices();
                          print('left pressed');
                        });
                      },
                      child: Image.asset('images/dice$left_image_no.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          updateDices();
                          print('right pressed');
                        });
                      },
                      child: Image.asset('images/dice$right_image_no.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
