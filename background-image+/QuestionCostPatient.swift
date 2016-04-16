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
    var userScore: AnyObject!
    var temp = [[String]]()

    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var slider: UISlider!
    var scoreValue : Int = 75
    
    @IBAction func sliderChange(sender: UISlider) {
        sliderValue = Int(round(sender.value))
        score.text = "£\(sliderValue)"
    }
    
    @IBAction func next(sender: AnyObject) {
        var finalList = self.refpsy
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error at cost")
            } else {
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                OldAnswersPatients.sharedInstance.score = OldAnswersPatients.sharedInstance.score + 1
                OldAnswersPatients.sharedInstance.answers["Childhood"] = String(self.sliderValue)
                OldAnswersPatients.sharedInstance.answers["Score"] = String(OldAnswersPatients.sharedInstance.score)
                //let score = ["Score":LoggedInInfo.sharedInstance.score]
                usersRef.setValue( OldAnswersPatients.sharedInstance.answers)
                
                //step A : find the path to score
                 let userScorePath = usersRef.childByAppendingPath("Score")
                
                //step B : grab the value of score
                userScorePath.observeEventType(.Value, withBlock: { snapshot in
                    print(snapshot.value)
                    }, withCancelBlock: { error in
                        print(error.description)
                })
                 self.userScore=OldAnswersPatients.sharedInstance.score
             
                var matching = finalList.queryOrderedByChild("Score").queryEqualToValue(String(self.userScore))
                
                matching.observeEventType(.ChildAdded, withBlock: { snapshot in
                    var tempItems = [String]()
                    
                    for item in snapshot.children.allObjects as! [FDataSnapshot] {
                        let dict = item.value as! (String)
                        tempItems.append(dict)
                    }
                    
                    self.temp.append(tempItems)
                    print(snapshot)
                    OldAnswersPatients.sharedInstance.matches = self.temp
                    
                })
                print("hello")
            }
        }
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

