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
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2) //Using the free init as long as all vars are initialized
    
    //Instance variable in Swift are called properties
    //all properties must be initialized
    //var flipcount: Int = 0 //This option is completely unnecessary Swift can infer it
    var flipcount = 0 {
        // This is called a property observer, really cool
        didSet {
            flipCountLabel.text = "Flips: \(flipcount)"
        }
    }
    
    //When connecting from the StoryBoard, Action creates a method and Outlet creates a property
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // Similar to Array<UIButton>
    @IBOutlet var cardButtons: [UIButton]!
    // the @IBAction puts the little circle on the left. XCode, not part of Swift
    // func is the keyword, func can be outside of the class as well
    // () has the list of arguments
    // type is given by :UIButton
    // Every argument has a name with it; An external name and an internal name
    // if it had -> Int it means it returns an int
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount+=1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            
        } else {
            print("chosen card was not in cardButtons")
        }
        //let is for constants
        //flipCard(withEmoji: "👻", on: sender)
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoice = ["👻","🎃", "🐣", "🦄", "🙈", "⛄️"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        let chosenEmoji = emoji[card.identifier]!
        return chosenEmoji
    }
    
    
    
//Functions
    // external is withEmoji, and internal is emoji
    // If there is only one name then it is for both external and internal
    // Number one requirement for names is the function should read like English
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }
//        else {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
//        }
//    }
//
    
}

