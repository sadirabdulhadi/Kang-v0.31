//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionChildhoodPatient: UIViewController {
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
                OldAnswersPatients.sharedInstance.score =  OldAnswersPatients.sharedInstance.score + ((self.sliderValue-OldAnswersPatients.sharedInstance.childhood) * 1000)
                OldAnswersPatients.sharedInstance.childhood = self.sliderValue
                OldAnswersPatients.sharedInstance.answers["Childhood"] = String(self.sliderValue)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}

