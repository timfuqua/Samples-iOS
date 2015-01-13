import Darwin

/// Shuffle the elements of `list`.
func shuffle<C: MutableCollectionType where C.Index == Int>(inout list: C)
{
    let count = countElements(list)
    for i in 0..<(count - 1)
    {
        let j = Int(arc4random_uniform(UInt32(count - i))) + i
        swap(&list[i], &list[j])
    }
}

/// Return a collection containing the shuffled elements of `list`.
func shuffled<C: MutableCollectionType where C.Index == Int>(var list: C) -> C
{
    shuffle(&list)
    return list
}

extension Array
{
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle()
    {
        for i in 0..<(count - 1)
        {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
    
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [T]
    {
        var list = self
        list.shuffle()
        return list
    }
    
    mutating func removeAtIndexes(var indexes: Int...)
    {
        indexes.sort(>)
        for i in indexes { removeAtIndex(i) }
    }
}

class CardSet
{
    struct Card
    {
        enum Suit: Int
        {
          case Hearts, Diamonds, Clubs, Spades
        }

        enum Rank: Int
        {
          case Two, Three, Four, Five, Six
          case Seven, Eight, Nine, Ten
          case Jack, Queen, King, Ace
        }

        let suit:Suit
        let rank:Rank
    }

    var cards:[Card]

    init() { cards = [] }
    init( _ cards:[Card] ) { self.cards = cards }

    var isEmpty:Bool { return cards.isEmpty }
}

class Deck: CardSet
{
    override init()
    {
        let indexes = Array(0...52).shuffled()
        
        super.init(indexes.map { index in
            let suit = Card.Suit(rawValue: index % 4)!
            let rank = Card.Rank(rawValue: index % 13)!
            return Card(suit: suit, rank: rank)
        })
    }

    func drawCard() -> Card { return cards.removeLast() }
}

class Hand: CardSet
{
    var canPlay: Bool {
        return cards.count >= 4 && (ranksMatch() || suitsMatch())
    }

    func play()
    {
        if ranksMatch() { cards.removeAtIndexes(3, 2, 1, 0) }
        else if suitsMatch() { cards.removeAtIndexes(2, 1) }
    }

  func add( card:Card ) { cards.insert(card, atIndex: 0) }

  func ranksMatch() -> Bool { return cards[0].rank == cards[3].rank }
  func suitsMatch() -> Bool { return cards[1].suit == cards[2].suit }
}

struct Game
{
    var deck = Deck()
    var hand = Hand()

    func play() -> Bool
    {
        while !deck.isEmpty
        {
            hand.add( deck.drawCard() )
            while hand.canPlay { hand.play() }
        }
        return hand.isEmpty
    }
}

