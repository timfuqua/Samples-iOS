// Playground - noun: a place where people can play

import UIKit

enum Rank: Int {
    
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .Ace:
            return "ace"
            
        case .Jack:
            return "jack"
            
        case .Queen:
            return "queen"
            
        case .King:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

func isSameRank(first: Rank, second: Rank) -> Bool {
    
    return first.rawValue == second.rawValue
}

isSameRank(Rank.Ace, Rank.Queen)
isSameRank(Rank.Two, Rank.Two)

enum Suit {
    
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .Spades:
            return "spades"
            
        case .Hearts:
            return "hearts"
            
        case .Diamonds:
            return "diamonds"
            
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        
        switch self {
            
        case .Spades: fallthrough
        case .Clubs:
            return "black"
            
        case .Hearts: fallthrough
        case .Diamonds:
            return "red"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
Suit.Spades.color()

struct Card {
    
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func createDeck() -> [Card] {
    
    var deck = Array (count: 52, repeatedValue: Card(rank: .Ace, suit: .Spades))
    var suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs];
    var counter = 0;
    
    for i in 1...13 {
        
        for suit in suits {
            
            deck[counter++] = Card (rank: Rank(rawValue: i)!, suit: suit)
        }
    }
    
    return deck
}

func printDeck (deck: [Card]) {
    
    for card in deck {
        
        println (card.simpleDescription())
    }
}

var playingCardDeck: [Card] = createDeck()
printDeck(playingCardDeck)









