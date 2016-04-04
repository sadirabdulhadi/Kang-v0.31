//
//  QuestionChildhoodTherapist.swift
//  Kang
//
//  Created by Reemma Muthal Puredath on 06/03/2016.
//  Copyright © 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionChildhoodTherapist: UIViewController {
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
                LoggedInInfo.sharedInstance.score = LoggedInInfo.sharedInstance.score + (self.sliderValue * 1000)
                let childhood = ["Childhood":self.sliderValue]
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("therapists").childByAppendingPath(authData.uid)
                usersRef.updateChildValues(childhood)
                }
        }                    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}

