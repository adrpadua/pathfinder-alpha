//
//  Classes.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/12/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

enum Classes: String {
    
    case Cleric, Fighter, Rogue, Wizard
    
    func name() -> String {
        return self.rawValue
    }
    
    func classSkills() -> [String] {
        var array = [String]()
        
        switch self {
        case .Cleric:
            array.append(Skills.Acrobatics.name())
            array.append(Skills.Climb.name())
            array.append(Skills.Diplomacy.name())
            array.append(Skills.Heal.name())
            array.append(Skills.KnowledgeArcana.name())
            array.append(Skills.KnowledgeHistory.name())
            array.append(Skills.KnowledgeNobility.name())
            array.append(Skills.KnowledgePlanes.name())
            array.append(Skills.KnowledgeReligion.name())
            array.append(Skills.Linguistics.name())
            array.append(Skills.Profession.name())
            array.append(Skills.SenseMotive.name())
            array.append(Skills.Spellcraft.name())
            return array
        case .Fighter:
            array.append(Skills.Acrobatics.name())
            array.append(Skills.Climb.name())
            array.append(Skills.Diplomacy.name())
            array.append(Skills.Heal.name())
            array.append(Skills.KnowledgeArcana.name())
            array.append(Skills.KnowledgeHistory.name())
            array.append(Skills.KnowledgeNobility.name())
            array.append(Skills.KnowledgePlanes.name())
            array.append(Skills.KnowledgeReligion.name())
            array.append(Skills.Linguistics.name())
            array.append(Skills.Profession.name())
            array.append(Skills.SenseMotive.name())
            array.append(Skills.Spellcraft.name())
            return array
        case .Rogue:
            array.append(Skills.Acrobatics.name())
            array.append(Skills.Climb.name())
            array.append(Skills.Diplomacy.name())
            array.append(Skills.Heal.name())
            array.append(Skills.KnowledgeArcana.name())
            array.append(Skills.KnowledgeHistory.name())
            array.append(Skills.KnowledgeNobility.name())
            array.append(Skills.KnowledgePlanes.name())
            array.append(Skills.KnowledgeReligion.name())
            array.append(Skills.Linguistics.name())
            array.append(Skills.Profession.name())
            array.append(Skills.SenseMotive.name())
            array.append(Skills.Spellcraft.name())
            return array
        case .Wizard:
            array.append(Skills.Acrobatics.name())
            array.append(Skills.Climb.name())
            array.append(Skills.Diplomacy.name())
            array.append(Skills.Heal.name())
            array.append(Skills.KnowledgeArcana.name())
            array.append(Skills.KnowledgeHistory.name())
            array.append(Skills.KnowledgeNobility.name())
            array.append(Skills.KnowledgePlanes.name())
            array.append(Skills.KnowledgeReligion.name())
            array.append(Skills.Linguistics.name())
            array.append(Skills.Profession.name())
            array.append(Skills.SenseMotive.name())
            array.append(Skills.Spellcraft.name())
            return array
        }
    }
    
    func skillRanksPerLevel() -> Int { // + INT Modifier
        switch self {
        case .Cleric:
            return 2
        case .Fighter:
            return 2
        case .Rogue:
            return 8
        case .Wizard:
            return 2
        }
    }
}