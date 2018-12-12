//
//  Card.swift
//  Concentration
//
//  Created by Tarang Srivastava on 11/30/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import Foundation

// Struct vs. Class
// Struct: no inheritances
// Most important, struct are value types. Classes are reference types.
// Which means it gets copied, cannot avoid structs in iOS.

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    //special
    //sort of like Utility function, tied to the Card type, not the card itself
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //init tend to have same external and internal name
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    init(originalCard: Card) {
        self.identifier = originalCard.identifier
        self.isFaceUp = originalCard.isFaceUp
        self.isMatched = originalCard.isMatched
    }
    //we do not add emojis in this class
    
}
