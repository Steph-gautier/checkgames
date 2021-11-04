import 'package:flutter/material.dart';
import 'cardGame.dart';

class CardGameView extends StatefulWidget {
  CardGame card;
  final Function onTouchCard;
  //final Function OnRefreshCard;

  CardGameView(this.card, {this.onTouchCard});

  @override
  _CardGameViewState createState() => _CardGameViewState();


  RefreshCard(){
    this.card.random();
    return CardGameView(card);
  }
}

class _CardGameViewState extends State<CardGameView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(this.widget.onTouchCard != null){
          this.setState(() {
            this.widget.card.random();
          });
          this.widget.onTouchCard();
        }
      },
      child: Card(
        elevation: 50,
        color: Colors.white,
        shadowColor: Colors.black26,
        margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    children: [
                      Text(widget.card.getCardRankString(), style: TextStyle(color: widget.card.getCardColor(), fontWeight: FontWeight.w800, fontSize: 18),),
                      widget.card.cardRank != CardRank.Joker ? Image.asset(widget.card.getSubCardImagePath(), fit: BoxFit.contain, width: 20, height: 20,) : Text("")
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    child: Image.asset(widget.card.getMainCardImagePath(), fit: BoxFit.contain, height: 120, width: 120,),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(color: Colors.transparent, width: 80, height: 2,),
                flipCardRank(widget.card)
              ],
            )
          ],
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(card.getCardRankString(), style: TextStyle(color: card.getCardColor(), fontWeight: FontWeight.w800, fontSize: 18)),
            card.cardRank != CardRank.Joker ? Image.asset(card.getSubCardImagePath(), fit: BoxFit.contain, width: 20, height: 20,) : Text("")
            ],
        )
    );
  }
}