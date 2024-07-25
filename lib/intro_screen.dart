import 'package:flutter/material.dart';

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
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ).createShader(rect);
              },
              child: Text("Welcome to tetris World!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ),
            GestureDetector(
              onTap: () => ,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 28, 142, 217),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Text("Start",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
