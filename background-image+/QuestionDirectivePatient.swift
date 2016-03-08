//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi and Reemma (excuse you Sadir :P ) on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionDirectivePatient: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var sliderValue = 4

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var slider: UISlider!
    var scoreValue : Int = 4
    
    @IBAction func sliderChange(sender: UISlider) {
        sliderValue = Int(round(sender.value))
        score.text = "\(sliderValue)"
    }
    
    @IBAction func next(sender: AnyObject) {
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                let directive = ["directive":self.sliderValue]
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                usersRef.updateChildValues(directive)                          }
        }                    }

        override func viewDidLoad() {
        super.viewDidLoad()
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
   
    
}

