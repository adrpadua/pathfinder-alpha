//
//  Feats.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/14/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

class FeatsDB {
    
}

class FeatsList: Object {
    
    dynamic var parentPlayerCharacter: PlayerCharacter?
    
    let feats = List<Feat>()
    
    func findFeatWithName(name: String) -> Feat? {
        let featResults = feats.filter("name == %@", "\(name)")
        
        if featResults.isEmpty {
            return nil
        } else {
            return featResults[0]
        }
    }
    
    // TEST DATA
    func addTestFeat() {
        feats.append(Feat(name: "a", prereqs: "b", benefits: "c"))
    }
    
}

class Feat: Object {
    
    dynamic var name = ""
    dynamic var prereqs = ""
    dynamic var benefits = ""
    
    // TEST DATA
    convenience init(name: String, prereqs: String, benefits: String) {
        self.init()
        self.name = "Test Feat"
        self.prereqs = "None"
        self.benefits = "Be awesome"
        
    }
}