//: Playground - noun: a place where people can play

import UIKit

class BoardGameManager {
    
    static let sharedInstance = BoardGameManager()
    
    init() {
        
        print("Singleton initialized")
    }
}

let boardManager = BoardGameManager.sharedInstance
