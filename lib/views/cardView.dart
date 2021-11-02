import 'package:checkgames/src/cardGame.dart';
import 'package:checkgames/src/cardGameView.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardGame card = new CardGame(CardType.Heart, CardRank.Queen);
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Stack(
        children: [
          Container(
              child: GestureDetector(
                onTap: (){
                  card.random();
                },
                child: FittedBox(
                  child: CardGameView(card),
                  alignment: Alignment.bottomCenter,
                )
              )
          ),
        ],
      )
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is CardView && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
