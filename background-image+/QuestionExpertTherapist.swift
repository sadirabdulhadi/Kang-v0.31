//
//  QuestionExpertTherapist.swift
//  Kang
//
//  Created by Reemma Muthal Puredath on 06/03/2016.
//  Copyright © 2016 UCL. All rights reserved.
//
import UIKit
import Firebase

class QuestionExpertTherapist: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var data="Behavioural control"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Behavioural control", "Bereavement", "Anxiety, depression or stress", "Drug and alcohol problems", "Eating or body image issues", "Obsessions and compulsions", "Relationship issues", "Self-harm", "Sexuality or gender issues"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(sender: AnyObject) {
        var index = self.pickerData.indexOf(self.data)! + 1
        AnswersTherapists.sharedInstance.score = AnswersTherapists.sharedInstance.score + ((index-AnswersTherapists.sharedInstance.expertise) * 100)
        AnswersTherapists.sharedInstance.expertise = index
        AnswersTherapists.sharedInstance.answers["Expertise"] = self.data

}

    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data = pickerData[row]
    }
    
    
}

