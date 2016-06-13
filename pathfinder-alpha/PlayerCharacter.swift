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
                
                for index in 1...6 {
                    let abilityName = Ability(rawValue: index)?.name()
                    pc_abilityScores.append(AbilityScore(value: ["name" : abilityName!, "value" : newScores[index - 1]]))
                }
            }
            
        } else {
            print("Error setting scores.")
        }
    }
    
    func setBaseSkills() {
        
        try! Manager.instance._charactersRealm.write {
            pc_skills = SkillList()
            pc_skills!.generateBaseSkillList()
        }
    }
    
    func modifySkill(skillToModify: String, byAmount: Int) {
        
        try! Manager.instance._charactersRealm.write {
            pc_skills!.modifySkill(skillToModify, amountToModify: byAmount)
        }
    }
    
    // HELPER FUNCTIONS
    func isClassSkill(skillToCheck: String) -> Bool {
        return true
    }
}
