import 'package:flutter/material.dart';
import 'package:tetris_game/intro_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(),
    );
  }
}