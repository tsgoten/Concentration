//
//  ViewController.swift
//  Concentration
//
//  Created by Tarang Srivastava on 11/20/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // lazy: is not used until everything is initialized. And lazy counts as being initialized
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards, chosenEmojiTheme: "halloween") //Using the free init as long as all vars are initialized
    //Instance variable in Swift are called properties
    //all properties must be initialized
    //var flipcount: Int = 0 //This option is completely unnecessary Swift can infer it
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1)/2
    }
    @IBAction func newGameButton() {
        game.restart()
        updateViewFromModel()
    }
    
    //When connecting from the StoryBoard, Action creates a method and Outlet creates a property
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    // Similar to Array<UIButton>
    @IBOutlet private var cardButtons: [UIButton]!
    // the @IBAction puts the little circle on the left. XCode, not part of Swift
    // func is the keyword, func can be outside of the class as well
    // () has the list of arguments
    // type is given by :UIButton
    // Every argument has a name with it; An external name and an internal name
    // if it had -> Int it means it returns an int
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            print("card identifier = \(game.cards[cardNumber])")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            
        } else {
            print("chosen card was not in cardButtons")
        }
        //let is for constants
        //flipCard(withEmoji: "👻", on: sender)
    }
    
    private func updateViewFromModel() {
        // Cards
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(game.emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        // Flip Count
        flipCountLabel.text = "Flips: \(game.flipcount)"

    }
    
}

