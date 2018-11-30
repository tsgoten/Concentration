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
    
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
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
