//
//  QuestionCostTherapist.swift
//  Kang
//
//  Created by Reemma Muthal Puredath on 06/03/2016.
//  Copyright © 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionCostTherapist: UIViewController {
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var sliderValue = 75
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var slider: UISlider!
    var scoreValue : Int = 75
    
    @IBAction func sliderChange(sender: UISlider) {
        sliderValue = Int(round(sender.value))
        score.text = "£\(sliderValue)"
    }
    @IBAction func nextPressed(sender: UIButton) {
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                print("reahed here 1")
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("therapists").childByAppendingPath(authData.uid)
                AnswersTherapists.sharedInstance.score = AnswersTherapists.sharedInstance.score + ((self.sliderValue/16)-AnswersTherapists.sharedInstance.cost )
                AnswersTherapists.sharedInstance.cost = (self.sliderValue/16)
                AnswersTherapists.sharedInstance.answers["Cost"] = String(self.sliderValue)
                AnswersTherapists.sharedInstance.answers["Score"] = String(AnswersTherapists.sharedInstance.score)
                usersRef.updateChildValues(AnswersTherapists.sharedInstance.answers)
            print("reahed here 2")}
        }                    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

