//
//  CharacterAbilityScores.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/12/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

enum Ability: Int {
    
    case STR = 1, DEX, CON, INT, WIS, CHA
    
    func name() -> String {
        switch self {
        case .STR:
            return "STR"
        case .DEX:
            return "DEX"
        case .CON:
            return "CON"
        case .INT:
            return "INT"
        case .WIS:
            return "WIS"
        case .CHA:
            return "CHA"
        }
    }
}

class AbilityScore: Object {
    
    dynamic var name = ""
    dynamic var value = 10
    dynamic var modifier: Int {
        get {
            let val: Double = (Double(value) - 10) / 2
            return Int(floor(val))
        }
    }
    
    let character = LinkingObjects(fromType: PlayerCharacter.self, property: "pc_abilityScores")
    
    override var description: String {
        get {
            return "\(name): \(value) (\(modifier))"
        }
    }
}