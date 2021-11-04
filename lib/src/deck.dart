import 'package:checkgames/src/cardGame.dart';

class Deck {
  List<CardGame> Cards;
  static const int size = 54;
  Deck(){
    //Initialise our deck
    this.Cards = [];

    //Populate our deck of cards
    var cardTypeNumber = CardType.values.length;
    var cardRankNumber = CardRank.values.length;

    for(int i = 0; i <= cardRankNumber - 1; i++){
        for(int j = 0; j <= cardTypeNumber - 1; j++){
            var card = new CardGame(CardType.values[j], CardRank.values[i]);
            this.Cards.add(card);
        }
    }

    var unwantedBlackJokerCard = this.Cards.firstWhere((c) => c.cardType == CardType.Square && c.cardRank == CardRank.Joker);
    var unwantedRedJokerCard = this.Cards.firstWhere((c) => c.cardType == CardType.Clover && c.cardRank == CardRank.Joker);

    this.Cards.remove(unwantedRedJokerCard);
    this.Cards.remove(unwantedBlackJokerCard);

  }
}