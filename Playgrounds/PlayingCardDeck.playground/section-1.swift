// Playground - noun: a place where people can play

import UIKit

class PlayingCard {
    
    enum Rank {
        case ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, INVALID
    }
    
    enum Suit {
        case HEARTS, DIAMONDS, SPADES, CLUBS, INVALID
    }
    
    var cardRank = Rank.INVALID
    var cardSuit = Suit.INVALID
    var hashValue: Int { get }
    
    init ( rankIN:Rank, suitIn:Suit, hashValueIn:Int ) {
        
        self.cardRank = rankIN
        self.cardSuit = suitIn
        self.hashValue = hashValueIn
    }
    
}

var PlayingCardDeck: [PlayingCard: Int] = [ PlayingCard(PlayingCard.Rank.ACE, PlayingCard.Suit.HEARTS, 0): 1, PlayingCard(PlayingCard.Rank.ACE, PlayingCard.Suit.DIAMONDS, 1): 1 ]

