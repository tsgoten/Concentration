//
//  Concentration.swift
//  Concentration
//
//  Created by Tarang Srivastava on 11/30/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    var emoji = [Int:String]()
    var emojiThemes = [String:[String]]()
    var emojiChoice: [String]
    var chosenEmojiThemeSaved: String
    var flipcount: Int
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    // MARK: Handle Card Touch Behavior
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "you cuckold")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // checking cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        cardWasFlipped(cardFlipped: cards[index])
    }
    
    func restart() {
        flipcount = 0
        let numberOfPairsOfCards = cards.count/2
        cards.removeAll()
        for _ in 0...numberOfPairsOfCards-1 {
            let card = Card()
            cards += [card, card]
        }
        emojiChoice = emojiThemes[chosenEmojiThemeSaved]!
        shuffleCards()
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoice.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
            print(emoji.count)
        }
        print("cards count: \(cards.count)")
        return emoji[card.identifier] ?? "?"
    }
    
    func shuffleCards() {
        var count = 0
        //        for card in cards {
        //            print(card.identifier)
        //        }
        while count<20 {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let cardRemoved = Card(originalCard: cards.remove(at: randomIndex))
            cards += [cardRemoved]
            count += 1
        }
        print("cards count: \(cards.count)")
        //        for card in cards {
        //            print(card.identifier)
        //        }
    }
    func cardWasFlipped(cardFlipped card: Card){
        if !card.isMatched {
            flipcount += 1
        }
    }
    
    init(numberOfPairsOfCards: Int, chosenEmojiTheme: String) {
        flipcount = 0
        emojiThemes["halloween"] = ["👻","🎃", "🐣", "🦄", "🙈", "⛄️", "⚡️","🍤"]
        
        for _ in 0...numberOfPairsOfCards-1 {
            let card = Card()
            cards += [card, card]
        }
        chosenEmojiThemeSaved = chosenEmojiTheme
        emojiChoice = emojiThemes[chosenEmojiThemeSaved]!
        shuffleCards()
        // TODO: Shuffle the cards
    }
    
}
