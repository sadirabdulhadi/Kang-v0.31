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
                print("error")
            } else {
                //save the value of the cost
                let cost = ["cost":self.sliderValue]
                //find the path of logged in user
                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                //update the value of cost
                usersRef.updateChildValues(cost)
                LoggedInInfo.sharedInstance.score = LoggedInInfo.sharedInstance.score + 1
                let score = ["Score":LoggedInInfo.sharedInstance.score]
                usersRef.updateChildValues(score)
                print(LoggedInInfo.sharedInstance.score);
               
                //childhood
                
                //step A : find the path to childhood
                let userScorePath = usersRef.childByAppendingPath("Score")
                
                //step B : grab the value of childhood
                userScorePath.observeEventType(.Value, withBlock: { snapshot in
                    self.userScore = snapshot.value
                    }, withCancelBlock: { error in
                        print(error.description)
                })
                

                var matching = finalList.queryOrderedByChild("Score").queryEqualToValue(self.userScore)
                
                matching.observeEventType(.ChildAdded, withBlock: { snapshot in
                    print(snapshot.key)})



        
            }}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

