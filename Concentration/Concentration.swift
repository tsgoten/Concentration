//
//  Concentration.swift
//  Concentration
//
//  Created by Tarang Srivastava on 11/30/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import Foundation

class Concentration {
    
    //var cards = Array<Card>()
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // checking cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // no or two cards match
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    func restart() {
        let numberOfPairsOfCards = cards.count/2
        cards = [Card]()
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
        }
        
        // TODO: Shuffle the cards
    }
    
}
