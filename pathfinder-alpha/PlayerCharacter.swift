//
//  PlayerCharacter.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/6/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift
import Darwin

class PlayerCharacter: Object {
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
    
    dynamic var pc_name = ""
    dynamic var pc_race = ""
    dynamic var pc_class = ""
    dynamic var pc_level = 1
    
    dynamic var pc_str: AbilityScore?
    dynamic var pc_dex: AbilityScore?
    dynamic var pc_con: AbilityScore?
    dynamic var pc_int: AbilityScore?
    dynamic var pc_wis: AbilityScore?
    dynamic var pc_cha: AbilityScore?
    
    func setName(newName: String) {
        try! Manager.instance._charactersRealm.write {
            self.pc_race = newName
        }
        self.pc_name = newName
    }
    
    func setRace(newRace: String) {
        try! Manager.instance._charactersRealm.write {
            self.pc_race = newRace
        }
    }
    
    func setClass(newClass: String) {
        try! Manager.instance._charactersRealm.write {
            self.pc_class = newClass
        }
    }
    
    func setLevel(newLevel: Int) {
        try! Manager.instance._charactersRealm.write {
            self.pc_level = newLevel
        }
    }
    
    func setAbilityScores(newScores: [Int]) {
        
        if newScores.count == 6 {
            
            try! Manager.instance._charactersRealm.write {
                
                pc_str = AbilityScore(value: ["name" : "STR", "value" : newScores[0]])
                pc_dex = AbilityScore(value: ["name" : "DEX", "value" : newScores[1]])
                pc_con = AbilityScore(value: ["name" : "CON", "value" : newScores[2]])
                pc_int = AbilityScore(value: ["name" : "INT", "value" : newScores[3]])
                pc_wis = AbilityScore(value: ["name" : "WIS", "value" : newScores[4]])
                pc_cha = AbilityScore(value: ["name" : "CHA", "value" : newScores[5]])
            }
            
        } else {
            print("Error setting scores.")
        }
    }
}

class AbilityScore: Object{
    
    dynamic var name = ""
    dynamic var value = 10
    dynamic var modifier: Int {
        get {
            let val: Double = (Double(value) - 10) / 2
            return Int(floor(val))
        }
    }
    
    override var description: String {
        get {
            return "\(name): \(value) (\(modifier))"
        }
    }
}