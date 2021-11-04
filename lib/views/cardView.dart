import 'dart:ffi';

import 'package:checkgames/src/cardGame.dart';
import 'package:checkgames/src/cardGameView.dart';
import 'package:checkgames/src/deck.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    List<CardGame> cards = new Deck().Cards;
    return Scaffold(
        backgroundColor: Colors.green[900],
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        children: ListOfCards(cards ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Row(
                      children: [
                        Stack(
                          children: new StackOfCards().GetStackOfCards(MediaQuery.of(context).size.height / 6),
                        )
                      ],
                    ),
                ),
                //SizedBox(height: MediaQuery.of(context).size.height / 5,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        children: ListOfCards(cards),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other && other is CardView && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  ListOfCards(List<CardGame> cards) {
    var list = new List<CardGameView>();
    for (var card in cards) {
      var cardView = CardGameView(
          card,
          onTouchCard: () {
            print("Card: ${card.rank} of ${card.cardType.toString()}. Please use this to trigger any action");
            setState(() {
              card.random();
            });
          }
      );
      list.add(cardView);
    }

    return list;
  }
}

class StackOfCards {
  List<CardGame> Cards;

  static const int size = 10;

  StackOfCards(){
    this.Cards = new Deck().Cards;
    this.Cards.shuffle();
  }

  GetStackOfCards(double sizeOfStack ){
    List<Widget> list = [];
    for (int i = 0; i < size; i++) {
      var cardBackView = Container(
        color: Colors.transparent,
        height: sizeOfStack,
        width: sizeOfStack / 3 * 2,
        child: new Card(
          elevation: 4,
          child: Image.asset('assets/images/backCard.png', width: 20, height: 20,fit: BoxFit.cover,),
        ),
      );

      list.add(cardBackView);
    }

    return list;
  }
}

