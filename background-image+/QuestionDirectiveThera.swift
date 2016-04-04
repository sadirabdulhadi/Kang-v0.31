//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionDirectiveThera: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var slider: UISlider!
    var sliderValue = 4
    

    @IBAction func sliderChange(sender: UISlider) {
        sliderValue = Int(round(sender.value))
        score.text = "\(sliderValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextPressed(sender: AnyObject) {
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                let directive = ["directive":self.sliderValue]
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("therapists").childByAppendingPath(authData.uid)
                usersRef.updateChildValues(directive)
                LoggedInInfo.sharedInstance.score = LoggedInInfo.sharedInstance.score + (self.sliderValue * 1000000)}
        }                    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

