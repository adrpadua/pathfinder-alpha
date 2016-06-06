//
//  Global.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/6/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

enum Races: String {
    case Human
    case Elf
    case Halfling
    case Dwarf
}

enum Classes: String {
    case Fighter
    case Cleric
    case Rogue
    case Wizard
}

class Feat: Object {
    
    dynamic var name: String?
}
