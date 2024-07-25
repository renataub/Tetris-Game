import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'piece.dart';
import 'tile.dart';
import 'values.dart' as values;

const int rowLength = 10;
const int columnLength = 15;

List<List<values.TetrisShape?>> gameBoard = List.generate(
  columnLength, 
  (_) => List.generate(rowLength, (_) => null),
);

class GameBoard extends StatefulWidget{
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late Piece currentPiece;
  int currentScore = 0;
  bool gameOver = false;

  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    createNewPiece();
    gameLoop(Duration(milliseconds: 500));
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer){
      setState(() {
        clearLines();
        checkLanding();
        if(gameOver){
          timer.cancel();
          showGameOverDialog();
        }
        currentPiece.movePeice(values.Direction.down)
      });
    });
  }

  void showGameOverDialog() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Game Over"),
        content: Text("Your Score is: $currentScore"),
        actions: [
          TextButton(
            onPressed: (){
              resetGame();
              Navigator.of(context).pop();
            }, 
            child: Text("PLAY AGAIN"),
          ),
        ],
      ),
    );
  }

  bool checkCollision({values.Direction ? direction}){
    return currentPiece.position.any((pos){
      int row = (pos / rowLength).floor();
      int col = (pos % rowLength);
      if(direction == values.Direction.left) col -= 1;
      if(direction == values.Direction.right) col += 1;
      if(direction == values.Direction.down) row += 1;
      return row >= columnLength || col < 0 || col >= rowLength || (row >= 0 && col >= 0 && gameBoard[row][col] != null);
    });
  }

  void checkLanding(){
    if(checkCollision(direction: values.Direction.down)){
      for(int pos in currentPiece.position){
        int row = (pos / rowLength).floor();
        int col = pos % rowLength;
        gameBoard[row][col] = currentPiece.type;
      }
    }
  }

  bool isGameOver(){
    return gameBoard[0].any((cell) => cell != null);
  }

  void createNewPiece(){
    currentPiece = Piece(type: values.TetrisShape.values[Random().nextInt(values.TetrisShape.values.length)]);
    currentPiece.initiallizePiece();
    if(isGameOver()) gameOver = true;
  }

  void clearLines(){
    for(int row = columnLength -1; row >= 0; row--){
      if(gameBoard[row].every((cell) => cell != null)){
        for(int r = row; r > 0; r--) gameBoard[r] = List.from(gameBoard[r - 1]);
        gameBoard[0] = List.generate(rowLength, (_) => null);
        currentScore ++;
      }
    }
  }

  
}