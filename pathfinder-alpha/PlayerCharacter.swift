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
    
    //
    dynamic var pc_name = ""
    dynamic var pc_race = ""
    dynamic var pc_class = ""
    dynamic var pc_level = 1
    
    // MARK: To-one relationships
    dynamic var pc_abilityScores: AbilityScoreList?
    dynamic var pc_skills: SkillList?
    
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
        try! Manager.instance._charactersRealm.write {
            
            pc_abilityScores = AbilityScoreList()
            pc_abilityScores!.generateAbilityScores(newScores)
        }
    }
    
    func setBaseSkills() {
        
        try! Manager.instance._charactersRealm.write {
            pc_skills = SkillList()
            pc_skills!.generateBaseSkillList()
            for skill in pc_skills!.skills {
                let abil = skill.keyAbility // "STR"
                let charAbilMod = pc_abilityScores!.abilityScores.filter("name == %@", "\(abil)")[0].modifier // "STR"
                skill.baseValue = charAbilMod
                skill.refreshTotal()
            }
        }
    }
    
    func modifySkill(skillToModify: String, byAmount: Int) {
        
        try! Manager.instance._charactersRealm.write {
            
            pc_skills!.modifySkill(skillToModify, amountToModify: byAmount, isClassSkill: isClassSkill(skillToModify))
            pc_skills!.numRanks += byAmount
            
        }
    }
    
    // HELPER FUNCTIONS
    func isClassSkill(skillToCheck: String) -> Bool {
        
        var classesArray: [String]
        
        let skill = pc_skills!.getSkill(skillToCheck).skillsEnum()
        classesArray = skill.classesFavoringSkill()
        
        for className in classesArray {
            if pc_class == className {
                return true
            }
        }
        
        
        return false
    }
}





