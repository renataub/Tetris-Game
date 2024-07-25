import 'package:flutter/material.dart';
import 'package:tetris_game/board.dart';

class IntroScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [Color.fromARGB(255, 39, 102, 228), Colors.purple, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ).createShader(rect);
              },
              child: Text("Welcome to tetris World!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 33, 96, 243),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                textStyle: TextStyle(fontSize: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => GameBoard()),
                );
              }, 
              child: Text("Start",
                style: TextStyle(color: Colors.black,),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}