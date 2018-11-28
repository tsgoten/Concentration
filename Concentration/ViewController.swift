//
//  ViewController.swift
//  Concentration
//
//  Created by Tarang Srivastava on 11/20/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // the @IBAction puts the little circle on the left. XCode, not part of Swift
    // func is the keyword, func can be outside of the class as well
    // () has the list of arguments
    // type is given by :UIButton
    // Every argument has a name with it; An external name and an internal name
    // if it had -> Int it means it returns an int
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard(withEmoji: "🎃", on: sender)
    }
    // external is withEmoji, and internal is emoji
    // If there is only one name then it is for both external and internal
    // Number one requirement for names is the function should read like English
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        }
    }
    
    
}

