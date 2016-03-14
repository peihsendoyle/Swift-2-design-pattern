//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Define what a card is

protocol Card {
    
    var name: String? { get set }
    
    var attack: Int? { get set }
    
    var mana: Int? { get set }
    
    var defense: Int? { get set }
    
    func clone() -> Card
    
    func toString() -> String
}

// Abstract Card - implements the signature and some properties

class AbstractCard: NSObject, Card {
    
    private var _name: String?
    
    private var _attack: Int?
    
    private var _mana: Int?
    
    private var _defense: Int?
    
    init(name: String?, attack: Int?, mana: Int?, defense: Int?) {
        
        self._name = name
        
        self._attack = attack
        
        self._mana = mana
        
        self._defense = defense
    }
    
    override init() {
        
        super.init()
    }
    
    // property name
    
    var name: String? {
        
        get { return _name }
        
        set { _name = newValue }
    }
    
    // property attack
    
    var attack: Int? {
        
        get { return _attack }
        
        set { _attack = newValue }
    }
    
    // property mana
    
    var mana: Int? {
        
        get { return _mana }
        
        set { _mana = newValue }
    }
    
    // property defense
    
    var defense: Int? {
        
        get { return _defense }
        
        set { _defense = newValue }
    }
    
    func clone() -> Card {
        
        return AbstractCard(name: self.name, attack: self.attack, mana: self.mana, defense: self.defense)
    }
    
    func toString() -> String {
        
        return ("\(self.name, self.mana, self.attack, self.defense)")
    }
}

enum CardType {
    
    case CopyCat, RaidRaider
}

// Our Factory class 
// Depending what we need, this class return an instance of the appropriate object.

class CardFactory {
    
    class func createCard(cardType: CardType) -> Card? {
        
        switch cardType {
            
        case .CopyCat:
            
            return CopyCat()
            
        case .RaidRaider:
            
            return RaidRaider()
            
        default:
            
            return nil
        }
    }
}

// Concrete card "Raid Raider"
// This is full definition of the Raid Raider Card 

class RaidRaider: AbstractCard {
    
    override init() {
        
        super.init()
        
        self._mana = 3
        
        self._attack = 2
        
        self._defense = 2
        
        self._name = "Raid Raider"
    }
}

// Concrete card "Copy Cat"
// This is full definition of the Copy Cat Card

class CopyCat: AbstractCard {
    
    override init() {
        
        super.init()
        
        self._mana = 5
        
        self._attack = 3
        
        self._defense = 3
        
        self._name = "Copy Cat"
    }
}

// Simulate our client

var c = CardFactory.createCard(.CopyCat)

let string = c?.toString()

print(string)

let d = c?.clone()

print(d?.toString())


























