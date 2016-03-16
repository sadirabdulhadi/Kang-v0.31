//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionCostPatient: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var refpsy = Firebase(url:"https://boiling-heat-1824.firebaseio.com/users/therapists")
    var sliderValue = 75
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var slider: UISlider!
    var scoreValue : Int = 75
    
    @IBAction func sliderChange(sender: UISlider) {
        sliderValue = Int(round(sender.value))
        score.text = "£\(sliderValue)"
    }
    
    @IBAction func next(sender: AnyObject) {
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                let cost = ["cost":self.sliderValue]
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                usersRef.updateChildValues(cost)


        
            }}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

