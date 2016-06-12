//
//  ViewController.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Welcome. # of characters in database = \(Manager.instance.characters.count)")
        
    }
    
    @IBAction func startBtnPressed(sender: UIButton) {
        Manager.instance.createNewCharacter()
        print("New Character created:")
        print(Manager.instance.active_pc)
        Manager.instance.saveActiveCharacter()
        print("# of characters in database = \(Manager.instance.characters.count)")
    }
    
    @IBAction func clearDataBtnPressed(sender: UIButton) {
        Manager.instance.clearAllData()
        print("Character database cleared.")
        print("# of characters in database = \(Manager.instance.characters.count)")
    }

    
}

