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
        AnswersTherapists.sharedInstance.score = AnswersTherapists.sharedInstance.score + ((self.sliderValue-AnswersTherapists.sharedInstance.childhood ) * 1000)
        AnswersTherapists.sharedInstance.childhood = self.sliderValue
        AnswersTherapists.sharedInstance.answers["Childhood"] = String(self.sliderValue)

            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}

