import 'package:flutter/material.dart';
import 'cardGame.dart';

class CardGameView extends StatefulWidget {
  CardGame card;
  CardGameView(this.card);

  @override
  _CardGameViewState createState() => _CardGameViewState();
}

class _CardGameViewState extends State<CardGameView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 50,
      color: Colors.white,
      shadowColor: Colors.black26,
      margin: EdgeInsets.fromLTRB(55, 30, 55, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Column(
              children: [
                Text(widget.card.getCardRankString(), style: TextStyle(color: widget.card.getCardColor(), fontWeight: FontWeight.w800, fontSize: 18),),
                widget.card.cardRank != CardRank.Joker ? Image.asset(widget.card.getCardImagePath(), fit: BoxFit.contain, width: 20, height: 20,) : Text("")
              ],
            ),
          ),
          Center(
            child: Image.asset(widget.card.getCardImagePath(), fit: BoxFit.contain, height: 150),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: flipCardRank(widget.card)
          )
        ],
      ),
    );
  }

  Transform rotateCardSymbol(String imagePath, double rotationAngle, double maxWidth){
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateZ(rotationAngle),
      child: Image.asset(imagePath, width: maxWidth / 5),
    );
  }

  Transform flipCardRank(CardGame card) {
    return Transform(  // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0)
          ..rotateY(0)
          ..rotateZ(3.14),
        alignment: FractionalOffset.center,
        child:Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 50,
              height: 20,
              color: Colors.blue,
            ),
            Column(
              children: [
                Text(card.getCardRankString(), style: TextStyle(color: card.getCardColor(), fontWeight: FontWeight.w800, fontSize: 18)),
                card.cardRank != CardRank.Joker ? Image.asset(card.getCardImagePath(), fit: BoxFit.contain, width: 20, height: 20,) : Text("")
              ],
            )
          ],
        )  // <<< set your widget here
    );
  }
}