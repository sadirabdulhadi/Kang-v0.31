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
        AnswersTherapists.sharedInstance.score = AnswersTherapists.sharedInstance.score + ((self.sliderValue-AnswersTherapists.sharedInstance.directive ) * 1000000)
        AnswersTherapists.sharedInstance.directive = self.sliderValue
        AnswersTherapists.sharedInstance.answers["Directive"] = String(self.sliderValue)
        }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

