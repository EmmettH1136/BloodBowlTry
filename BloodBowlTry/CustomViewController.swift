//
//  CustomViewController.swift
//  BloodBowlTry
//
//  Created by Emmett Hasley on 11/8/18.
//  Copyright © 2018 John Heresy High School. All rights reserved.
//

import UIKit

var players = [AUnit]()
class CustomViewController: UIViewController {
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        players = [linemenHuman, throwerHuman, catcherHuman, blitzerHuman, ogreHuman, trollOrc]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   

}
