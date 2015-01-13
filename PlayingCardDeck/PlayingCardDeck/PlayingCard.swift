//
//  PlayingCard.swift
//  PlayingCardDeck
//
//  Created by Tim Fuqua on 1/1/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

enum Rank: Int
{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String
    {
        switch self
        {
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

enum Suit
{
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String
    {
        switch self
        {
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
    
    func color() -> String
    {
        switch self
        {
        case .Spades: fallthrough
        case .Clubs:
            return "black"
            
        case .Hearts: fallthrough
        case .Diamonds:
            return "red"
        }
    }
}

func isSameRank(first: Rank, second: Rank) -> Bool
{
    return first.rawValue == second.rawValue
}

func isSameSuit(first: Suit, second: Suit) -> Bool
{
    return first.simpleDescription() == second.simpleDescription()
}

func isSameColor(first: Suit, second: Suit) -> Bool
{
    return first.color() == second.color()
}

func isSuitRed(suit: Suit) -> Bool
{
    return suit.color() == "red"
}

func isSuitBlack(suit: Suit) -> Bool
{
    return suit.color() == "black"
}


struct PlayingCard
{
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String
    {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

func isPlayingCardSameRank(first: PlayingCard, second: PlayingCard) -> Bool
{
    return isSameRank(first.rank, second.rank)
}

func isPlayingCardSameSuit(first: PlayingCard, second: PlayingCard) -> Bool
{
    return isSameSuit(first.suit, second.suit)
}

func isPlayingCardSameColor(first: PlayingCard, second: PlayingCard) -> Bool
{
    return isSameColor(first.suit, second.suit)
}

func isPlayingCardRed(card: PlayingCard) -> Bool
{
    return card.suit.color() == "red"
}

func isPlayingCardBlack(card: PlayingCard) -> Bool
{
    return card.suit.color() == "black"
}

func isPlayingCardEqual(first: PlayingCard, second: PlayingCard) -> Bool
{
    return isPlayingCardSameRank(first, second) && isPlayingCardSameColor(first, second)
}

func createDeck() -> [PlayingCard]
{
    var deck = Array (count: 52, repeatedValue: PlayingCard(rank: .Ace, suit: .Spades))
    var suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
    var counter = 0;
    
    for i in 1...13
    {
        for suit in suits
        {
            deck[counter++] = PlayingCard(rank: Rank(rawValue: i)!, suit: suit)
        }
    }
    
    return deck
}

func printDeck(deck: [PlayingCard])
{
    for card in deck
    {
        println(card.simpleDescription())
    }
}



struct PlayingCardHand
{
    var hand: [PlayingCard] = [PlayingCard]()
    
    func printHand()
    {
        for card in hand
        {
            println(card.simpleDescription())
        }
    }
    
    func addToHand(card: PlayingCard)
    {
        hand.append(card)
    }
}
