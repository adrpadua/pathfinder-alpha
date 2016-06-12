//
//  AbilityScoreVC.swift
//  pathfinder-alpha
//
//  Created by Adrian Padua on 6/6/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class AbilityScoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultBtnPressed(sender: UIButton) {
        let scores = [1, 12, 15, 6, 8, 10]
        
        if let character = Manager.instance.active_pc {
            character.setAbilityScores(scores)
        }
        
        print(Manager.instance.active_pc!)
        print(Manager.instance.active_pc!.pc_int!)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
