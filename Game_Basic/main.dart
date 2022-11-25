
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() async{
  final ballMove = BallMove();
  
  runApp(
    GameWidget(game: ballMove)
  );
  
}


class BallMove with Game {

  late Rect roundPos;
  late double screenWidth, screenHeight, centerX,centerY;
  static final roundWidth = 100.0, roundHeight = 100.0;



  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 4
    ..style = PaintingStyle.fill;
  int roundDirection = 1;
  static const int roundSpeed =100;

  @override
  Future<void>? onLoad() async {
     super.onLoad();
     screenWidth =MediaQueryData.fromWindow(window).size.width;
     screenHeight =MediaQueryData.fromWindow(window).size.height;
     centerX = (screenWidth / 2) - (roundWidth / 2);
     centerY = (screenHeight / 2) - (roundHeight / 2);

     roundPos = Rect.fromLTWH(centerX, centerY, roundWidth, roundHeight);

  }

  @override
  void render(Canvas canvas) {
    canvas.drawOval(roundPos, _paint);
  }

  @override
  void update(double dt) {
    roundPos = roundPos.translate(roundSpeed*roundDirection*dt,0);
    if(roundDirection == 1 && roundPos.right > screenWidth)
    {
      roundDirection = -1;
    }
    else if(roundDirection == -1 && roundPos.left < 0){
      roundDirection = 1;

    }
  }
  

}
