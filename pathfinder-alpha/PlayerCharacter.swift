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
    dynamic var pc_skills: SkillList?
    
    let pc_abilityScores = List<AbilityScore>()
    
    // MARK: Setter functions
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
                
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.STR.rawValue, "value" : newScores[0]]))
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.DEX.rawValue, "value" : newScores[1]]))
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.CON.rawValue, "value" : newScores[2]]))
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.INT.rawValue, "value" : newScores[3]]))
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.WIS.rawValue, "value" : newScores[4]]))
                pc_abilityScores.append(AbilityScore(value: ["name" : Ability.CHA.rawValue, "value" : newScores[5]]))
            }
            
        } else {
            print("Error setting scores.")
        }
    }
    
    
    // MARK: Helper Functions
    func generateSkillList() {
        
        pc_skills = SkillList()
        let skills = pc_skills!.skills
        
        skills.append(Skill(value: ["name" : "", "" : 0]))
    }
}
