//
//  Manager.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/6/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

class Manager {
    
    static var instance = Manager()
    
    private var _activeCharacter = PlayerCharacter()
    private var _characters = [PlayerCharacter]()
    
    var activeCharacter: PlayerCharacter {
        return _activeCharacter
    }
    var characters: [PlayerCharacter] {
        return _characters
    }
    
    
}
