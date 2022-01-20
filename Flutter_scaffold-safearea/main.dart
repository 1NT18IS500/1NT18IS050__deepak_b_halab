
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Deepak G'),
        ),
        body: SafeArea(
          child: Center(
            child: Text('Welcome to world of Flutter'),
          ),
        ),
      ),
    );
  }
}
