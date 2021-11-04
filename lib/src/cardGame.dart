import 'dart:math';

import 'package:flutter/material.dart';

class CardGame{
  int rank;
  CardType cardType;
  CardRank cardRank;
  Colors cardColor;

  CardGame(this.cardType, this.cardRank){
    switch(this.cardRank) {
      case CardRank.As:
        rank = 1;
        break;
      case CardRank.Two:
        rank = 2;
        break;
      case CardRank.Three:
        rank = 3;
        break;
      case CardRank.Four:
        rank = 4;
        break;
      case CardRank.Five:
        rank = 5;
        break;
      case CardRank.Six:
        rank = 6;
        break;
      case CardRank.Seven:
        rank = 7;
        break;
      case CardRank.Height:
        rank = 8;
        break;
      case CardRank.Nine:
        rank = 9;
        break;
      case CardRank.Ten:
        rank = 10;
        break;
      case CardRank.Judge:
        rank = 11;
        break;
      case CardRank.Queen:
        rank = 12;
        break;
      case CardRank.King:
        rank = 13;
        break;
      default :
        rank = 14;
    }
  }

  String getCardRankString(){
    if(!this.hasRankString()){
      return rank.toString();
    }
    else{
      if(rank == 1) return "A";
      if(rank == 11) return "J";
      if(rank == 12) return "Q";
      if(rank == 13) return "K";
      return "JOKER";
    }
}

  bool hasRankString() {
    if(this.rank <= 10 && this.rank > 1){
      return false;
    }
    else{
      return true;
    }
  }

  String getSubCardImagePath(){
    if(cardType == CardType.Clover){
      return "assets/images/clover.png";
    }
    else if(cardType == CardType.Heart){
      return "assets/images/heart.png";
    }
    else if(cardType == CardType.Square){
      return "assets/images/pique.png";
    }
    else{
      return "assets/images/spade.png";
    }
  }

  String getMainCardImagePath(){
    if(cardType == CardType.Clover){
      if(rank == 14){
        return "assets/images/JokerBlack.png";
      }
      if(rank == 13){
        return "assets/images/kings/king-clover.png";
      }
      if(rank == 12){
        return "assets/images/queens/queen-clover.png";
      }
      if(rank == 11){
        return "assets/images/judges/judge-clover.png";
      }
      return "assets/images/clover.png";
    }
    else if(cardType == CardType.Heart){
      if(rank == 14){
        return "assets/images/JokerRed.png";
      }
      if(rank == 13){
        return "assets/images/kings/king-heart.png";
      }
      if(rank == 12){
        return "assets/images/queens/queen-heart.png";
      }
      if(rank == 11){
        return "assets/images/judges/judge-pique.png";
      }
      return "assets/images/heart.png";
    }
    else if(cardType == CardType.Square){
      if(rank == 14){
        return "assets/images/JokerRed.png";
      }
      if(rank == 13){
        return "assets/images/kings/king-pique.png";
      }
      if(rank == 12){
        return "assets/images/queens/queen-pique.png";
      }
      if(rank == 11){
        return "assets/images/judges/judge-pique.png";
      }
      return "assets/images/pique.png";
    }
    else{
      if(rank == 14){
        return "assets/images/JokerBlack.png";
      }
      if(rank == 13){
        return "assets/images/kings/king-spade.png";
      }
      if(rank == 12){
        return "assets/images/queens/queen-spade.png";
      }
      if(rank == 11){
        return "assets/images/judges/judge-spade.png";
      }
      return "assets/images/spade.png";
    }
  }
  
  Color getCardColor(){
    if(cardType == CardType.Clover || cardType == CardType.Spade){
      return Colors.black;
    }
    else{
      return Color.fromRGBO(191, 0, 0, 0.7);
    }
  }

  void random(){
    var randomIndex = new Random();
    cardType = CardType.values[randomIndex.nextInt(4)];
    cardRank = CardRank.values[randomIndex.nextInt(13)];
    setCardRank(cardRank);
  }

  void setCardRank(CardRank r){
    switch(r) {
      case CardRank.As:
        rank = 1;
        break;
      case CardRank.Two:
        rank = 2;
        break;
      case CardRank.Three:
        rank = 3;
        break;
      case CardRank.Four:
        rank = 4;
        break;
      case CardRank.Five:
        rank = 5;
        break;
      case CardRank.Six:
        rank = 6;
        break;
      case CardRank.Seven:
        rank = 7;
        break;
      case CardRank.Height:
        rank = 8;
        break;
      case CardRank.Nine:
        rank = 9;
        break;
      case CardRank.Ten:
        rank = 10;
        break;
      case CardRank.Judge:
        rank = 11;
        break;
      case CardRank.Queen:
        rank = 12;
        break;
      case CardRank.King:
        rank = 13;
        break;
      default :
        rank = 14;
    }
  }
}

enum CardRank{
  As,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Height,
  Nine,
  Ten,
  Judge,
  Queen,
  King,
  Joker
}

enum CardType {
  Square,
  Heart,
  Clover,
  Spade
}
