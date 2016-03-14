// CREATIONAL: THE PROTOTYPE PATTERN

import UIKit

import Foundation

class AbstractCard {
    
    var name: String?
    
    var mana: Int?
    
    var attack: Int?
    
    var defense: Int?
    
    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        
        self.name = name
        
        self.mana = mana
        
        self.attack = attack
        
        self.defense = defense
    }
    
    func clone() -> AbstractCard {
        
        return AbstractCard(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
}

class Card: AbstractCard {
    
    override init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        
        super.init(name: name, mana: mana, attack: attack, defense: defense)
    }
}

// Simulate our client

// This is the card that we will copy

let raidRaider = Card(name: "Raid Raider", mana: 3, attack: 2, defense: 2)

// Now we use copyCat to copy raidRaider

let copyCat = raidRaider.clone()

print("\(copyCat.name), \(copyCat.mana), \(copyCat.attack), \(copyCat.defense)")


// CREATIONAL : THE FACTORY METHOD PATTERN



