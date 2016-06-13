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
    
    var active_pc: PlayerCharacter?
    var _charactersRealm: Realm
    
    var characters: Results<PlayerCharacter> {
        return _charactersRealm.objects(PlayerCharacter)
    }
    
    
    init() {
        var config = Realm.Configuration.defaultConfiguration
        config.schemaVersion = 5
        
        _charactersRealm = try! Realm(configuration: config)
        
        loadCharacters()
        
        let dir = _charactersRealm.configuration.fileURL!
        print(dir)
    }
    
    func createNewCharacter() {
        active_pc = PlayerCharacter()
        active_pc!.pc_name = String(NSDate().timeIntervalSince1970)
    }
    
    func saveActiveCharacter() {
        try! _charactersRealm.write {
            _charactersRealm.add(active_pc!)
        }
    }
    
    
    func loadCharacters() {
        _charactersRealm.refresh()
    }
    
    func clearAllData() {
        try! _charactersRealm.write {
            _charactersRealm.deleteAll()
        }
    }
    
}
