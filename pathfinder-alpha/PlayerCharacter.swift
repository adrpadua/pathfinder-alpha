//
//  PlayerCharacter.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/6/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

class PlayerCharacter: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    private dynamic var _pc_name: String?
    private dynamic var _pc_race: String?
    private dynamic var _pc_class: String?
    
    //var skills = [String:Int]()
    //var feats = [Feat]()
    
    var pc_name: String? {
        return _pc_name
    }
    var pc_race: String? {
        return _pc_race
    }
    var pc_class: String? {
        return _pc_class
    }
    
    
    func setRace(newRace: String) {
        self._pc_race = newRace
    }
}